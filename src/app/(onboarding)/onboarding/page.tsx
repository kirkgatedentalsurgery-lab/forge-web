'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/providers/auth-provider';
import { createClient } from '@/lib/supabase/client';
import { useOnboardingStore, TrainingGoal, ExperienceLevel, SplitPreference } from '@/stores/onboarding-store';
import { generateProgram } from '@/engines/program-generator';
import { SplitType, EquipmentType, Difficulty } from '@/types';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Badge } from '@/components/ui/badge';
import { Slider } from '@/components/ui/slider';
import { cn } from '@/lib/utils';
import {
  Target, Dumbbell, Zap, Heart, Scale, Star, Calendar, Clock, Wrench,
  LayoutList, Flame, Shield, ChevronLeft, ChevronRight, Loader2,
  CheckCircle2, AlertTriangle, Minus, Plus,
} from 'lucide-react';

const TOTAL_STEPS = 8;

// Step 1: Goals with icons
const GOALS: { value: TrainingGoal; label: string; description: string; icon: any }[] = [
  { value: 'hypertrophy', label: 'Build Muscle', description: 'Maximise muscle growth with volume-focused training', icon: Dumbbell },
  { value: 'strength', label: 'Get Stronger', description: 'Increase squat, bench, deadlift, and overhead press', icon: Target },
  { value: 'powerbuilding', label: 'Powerbuilding', description: 'Blend strength and hypertrophy for size and power', icon: Zap },
  { value: 'general_fitness', label: 'General Fitness', description: 'Well-rounded training for health and performance', icon: Heart },
  { value: 'body_recomp', label: 'Body Recomp', description: 'Lose fat while maintaining or building muscle', icon: Scale },
];

// Step 2: Experience
const EXPERIENCE_LEVELS: { value: ExperienceLevel; label: string; description: string; stars: number }[] = [
  { value: 'beginner', label: 'Beginner', description: 'Less than 1 year of consistent training', stars: 1 },
  { value: 'intermediate', label: 'Intermediate', description: '1-3 years of structured training', stars: 2 },
  { value: 'advanced', label: 'Advanced', description: '3+ years with solid progression', stars: 3 },
];

// Step 4: Equipment with icons
const EQUIPMENT: { id: string; label: string; icon: string }[] = [
  { id: 'barbell', label: 'Barbell', icon: '🏋️' },
  { id: 'dumbbell', label: 'Dumbbells', icon: '💪' },
  { id: 'cable', label: 'Cables', icon: '🔗' },
  { id: 'machine', label: 'Machines', icon: '⚙️' },
  { id: 'bodyweight', label: 'Bodyweight', icon: '🤸' },
  { id: 'bands', label: 'Bands', icon: '〰️' },
];

// Step 5: Splits
const SPLITS: { value: SplitPreference; label: string; days: string; pattern: string }[] = [
  { value: 'push_pull_legs', label: 'Push / Pull / Legs', days: '3-6', pattern: 'P P L' },
  { value: 'upper_lower', label: 'Upper / Lower', days: '4-6', pattern: 'U L U L' },
  { value: 'full_body', label: 'Full Body', days: '3-4', pattern: 'FB FB FB' },
  { value: 'bro_split', label: 'Bro Split', days: '5-6', pattern: 'Ch Bk Sh Ar Lg' },
  { value: 'arnold_split', label: 'Arnold Split', days: '6', pattern: 'CB SA L' },
  { value: 'no_preference', label: 'You Decide', days: 'Any', pattern: 'AUTO' },
];

const MUSCLE_GROUPS = ['Chest', 'Back', 'Quads', 'Hamstrings', 'Glutes', 'Shoulders', 'Biceps', 'Triceps', 'Calves', 'Abs'];

const INJURY_AREAS = ['Lower Back', 'Shoulders', 'Knees', 'Wrists', 'Neck', 'Hips', 'Elbows', 'Ankles'];

export default function OnboardingPage() {
  const router = useRouter();
  const { user } = useAuth();
  const store = useOnboardingStore();
  const [saving, setSaving] = useState(false);
  const [showCelebration, setShowCelebration] = useState(false);
  const [error, setError] = useState('');
  const [animating, setAnimating] = useState(false);

  const progress = (store.currentStep / TOTAL_STEPS) * 100;

  // Animate step transitions
  const goToStep = (step: number) => {
    setAnimating(true);
    setTimeout(() => {
      if (step > store.currentStep) store.nextStep();
      else store.prevStep();
      setAnimating(false);
    }, 150);
  };

  const nextStep = () => goToStep(store.currentStep + 1);
  const prevStep = () => goToStep(store.currentStep - 1);

  // Validation hints per step
  const getValidationHint = (): string | null => {
    switch (store.currentStep) {
      case 1: return !store.goal ? 'Select a goal to continue' : null;
      case 2: return !store.experience ? 'Choose your experience level' : null;
      case 4: return store.equipment.length === 0 ? 'Select at least one equipment type' : null;
      case 5: return !store.splitPreference ? 'Pick a split or let Forge decide' : null;
      default: return null;
    }
  };

  const isNextDisabled = (): boolean => {
    switch (store.currentStep) {
      case 1: return !store.goal;
      case 2: return !store.experience;
      case 4: return store.equipment.length === 0;
      case 5: return !store.splitPreference;
      default: return false;
    }
  };

  const handleComplete = async () => {
    if (!user) return;
    setSaving(true);
    setError('');

    try {
      const supabase = createClient();

      // Save profile
      const { error: profileError } = await supabase.from('user_profiles').update({
        training_goal: store.goal,
        experience_level: store.experience,
        training_age_months: store.trainingAgeMonths,
        preferred_session_minutes: store.sessionMinutes,
        available_equipment: `{${store.equipment.join(',')}}`,
        preferred_split: store.splitPreference === 'no_preference' ? null : store.splitPreference,
        body_weight: store.bodyWeight,
        onboarding_completed: true,
      }).eq('id', user.id);

      if (profileError) throw new Error('Failed to save profile: ' + profileError.message);

      // Save priority muscles
      if (store.priorityMuscles.length > 0) {
        const { data: muscleGroups } = await supabase
          .from('muscle_groups').select('id, display_name').in('display_name', store.priorityMuscles);
        if (muscleGroups?.length) {
          await supabase.from('user_priority_muscles').insert(
            muscleGroups.map((mg) => ({ user_id: user.id, muscle_group_id: mg.id, priority_level: 1 }))
          );
        }
      }

      // Save injuries
      for (const injury of store.injuries) {
        await supabase.from('user_injuries').insert({
          user_id: user.id, body_area: injury.bodyArea, severity: injury.severity,
        });
      }

      // Generate first program
      let splitType: SplitType;
      if (store.splitPreference && store.splitPreference !== 'no_preference') {
        splitType = store.splitPreference as SplitType;
      } else {
        if (store.daysPerWeek <= 3) splitType = 'full_body';
        else if (store.daysPerWeek === 4) splitType = 'upper_lower';
        else splitType = 'push_pull_legs';
      }

      await generateProgram(supabase, {
        splitType,
        daysPerWeek: store.daysPerWeek,
        numWeeks: 5,
        hasDeload: true,
        availableEquipment: store.equipment as EquipmentType[],
        experienceLevel: (store.experience || 'intermediate') as Difficulty,
        userId: user.id,
        programName: `${store.goal === 'strength' ? 'Strength' : 'Hypertrophy'} Block 1`,
        sessionMinutes: store.sessionMinutes,
      });

      // Show celebration
      setSaving(false);
      setShowCelebration(true);
      store.reset();
    } catch (err: any) {
      console.error('Onboarding error:', err);
      setError(err.message || 'Something went wrong. Please try again.');
      setSaving(false);
      return;
    }

    setTimeout(() => {
      router.push('/dashboard');
    }, 2500);
  };

  // Celebration screen
  if (showCelebration) {
    return (
      <div className="flex flex-col items-center justify-center min-h-[60vh] text-center animate-in fade-in duration-500">
        <div className="h-20 w-20 rounded-full bg-green-500/20 flex items-center justify-center mb-6 animate-in zoom-in duration-300">
          <CheckCircle2 className="h-10 w-10 text-green-500" />
        </div>
        <h1 className="text-3xl font-bold mb-2">You&apos;re All Set!</h1>
        <p className="text-muted-foreground mb-2">Your first training block has been generated.</p>
        <p className="text-sm text-muted-foreground">Redirecting to dashboard...</p>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* Step dots */}
      <div className="flex items-center justify-center gap-2">
        {Array.from({ length: TOTAL_STEPS }, (_, i) => (
          <div
            key={i}
            className={cn(
              'h-2.5 rounded-full transition-all duration-300',
              i + 1 === store.currentStep ? 'w-8 bg-primary' :
              i + 1 < store.currentStep ? 'w-2.5 bg-primary/60' :
              'w-2.5 bg-border'
            )}
          />
        ))}
      </div>

      <p className="text-xs text-center text-muted-foreground">
        Step {store.currentStep} of {TOTAL_STEPS}
      </p>

      {/* Step content with transition */}
      <div className={cn('transition-all duration-150', animating ? 'opacity-0 translate-x-4' : 'opacity-100 translate-x-0')}>

        {/* Step 1: Goal */}
        {store.currentStep === 1 && (
          <div className="space-y-4">
            <div>
              <h2 className="text-2xl font-bold">What&apos;s your primary goal?</h2>
              <p className="text-muted-foreground mt-1 text-sm">This shapes how Forge programs your training.</p>
            </div>
            <div className="space-y-3">
              {GOALS.map((g) => (
                <Card key={g.value} className={cn('cursor-pointer transition-all', store.goal === g.value && 'border-primary bg-primary/5 scale-[1.01]')} onClick={() => store.setGoal(g.value)}>
                  <CardContent className="p-4 flex items-center gap-4">
                    <div className={cn('h-11 w-11 rounded-xl flex items-center justify-center shrink-0', store.goal === g.value ? 'bg-primary/20' : 'bg-secondary')}>
                      <g.icon className={cn('h-5 w-5', store.goal === g.value ? 'text-primary' : 'text-muted-foreground')} />
                    </div>
                    <div>
                      <p className="font-semibold">{g.label}</p>
                      <p className="text-xs text-muted-foreground">{g.description}</p>
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        )}

        {/* Step 2: Experience */}
        {store.currentStep === 2 && (
          <div className="space-y-4">
            <div>
              <h2 className="text-2xl font-bold">Your experience level?</h2>
              <p className="text-muted-foreground mt-1 text-sm">Helps set appropriate volume and intensity.</p>
            </div>
            <div className="space-y-3">
              {EXPERIENCE_LEVELS.map((e) => (
                <Card key={e.value} className={cn('cursor-pointer transition-all', store.experience === e.value && 'border-primary bg-primary/5 scale-[1.01]')} onClick={() => store.setExperience(e.value)}>
                  <CardContent className="p-4 flex items-center gap-4">
                    <div className="flex gap-0.5">
                      {Array.from({ length: 3 }, (_, i) => (
                        <Star key={i} className={cn('h-4 w-4', i < e.stars ? 'text-yellow-500 fill-yellow-500' : 'text-border')} />
                      ))}
                    </div>
                    <div>
                      <p className="font-semibold">{e.label}</p>
                      <p className="text-xs text-muted-foreground">{e.description}</p>
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        )}

        {/* Step 3: Schedule */}
        {store.currentStep === 3 && (
          <div className="space-y-6">
            <div>
              <h2 className="text-2xl font-bold">Your training schedule</h2>
              <p className="text-muted-foreground mt-1 text-sm">How often and how long do you train?</p>
            </div>
            <div className="space-y-2">
              <Label className="flex items-center gap-2"><Calendar className="h-4 w-4 text-muted-foreground" /> Days per week: {store.daysPerWeek}</Label>
              <div className="flex gap-2">
                {[2, 3, 4, 5, 6].map((d) => (
                  <button key={d} onClick={() => store.setDaysPerWeek(d)}
                    className={cn('flex-1 h-12 rounded-lg font-bold text-lg transition-all border', store.daysPerWeek === d ? 'bg-primary text-primary-foreground border-primary scale-105' : 'bg-secondary border-border hover:border-primary/50')}>
                    {d}
                  </button>
                ))}
              </div>
            </div>
            <div className="space-y-2">
              <Label className="flex items-center gap-2"><Clock className="h-4 w-4 text-muted-foreground" /> Session length: {store.sessionMinutes} min</Label>
              <Slider value={[store.sessionMinutes]} onValueChange={([v]) => store.setSessionMinutes(v)} min={30} max={120} step={15} />
              <div className="flex justify-between text-[10px] text-muted-foreground"><span>30 min</span><span>60 min</span><span>90 min</span><span>120 min</span></div>
            </div>
          </div>
        )}

        {/* Step 4: Equipment */}
        {store.currentStep === 4 && (
          <div className="space-y-4">
            <div>
              <h2 className="text-2xl font-bold">Available equipment</h2>
              <p className="text-muted-foreground mt-1 text-sm">Select everything you have access to.</p>
            </div>
            <div className="grid grid-cols-2 gap-3">
              {EQUIPMENT.map((eq) => {
                const selected = store.equipment.includes(eq.id);
                return (
                  <Card key={eq.id} className={cn('cursor-pointer transition-all min-h-[80px]', selected && 'border-primary bg-primary/5 scale-[1.02]')}
                    onClick={() => { const next = selected ? store.equipment.filter((e) => e !== eq.id) : [...store.equipment, eq.id]; store.setEquipment(next); }}>
                    <CardContent className="p-4 flex flex-col items-center justify-center text-center">
                      <span className="text-2xl mb-1">{eq.icon}</span>
                      <p className={cn('font-medium text-sm', selected && 'text-primary')}>{eq.label}</p>
                    </CardContent>
                  </Card>
                );
              })}
            </div>
          </div>
        )}

        {/* Step 5: Split */}
        {store.currentStep === 5 && (
          <div className="space-y-4">
            <div>
              <h2 className="text-2xl font-bold">Split preference</h2>
              <p className="text-muted-foreground mt-1 text-sm">Pick a split or let Forge choose for you.</p>
            </div>
            <div className="space-y-3">
              {SPLITS.map((s) => (
                <Card key={s.value} className={cn('cursor-pointer transition-all', store.splitPreference === s.value && 'border-primary bg-primary/5 scale-[1.01]')} onClick={() => store.setSplitPreference(s.value)}>
                  <CardContent className="p-4 flex items-center justify-between">
                    <div>
                      <p className="font-semibold">{s.label}</p>
                      <p className="text-xs text-muted-foreground font-mono mt-0.5">{s.pattern}</p>
                    </div>
                    <Badge variant="secondary">{s.days} days</Badge>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        )}

        {/* Step 6: Priority Muscles */}
        {store.currentStep === 6 && (
          <div className="space-y-4">
            <div>
              <h2 className="text-2xl font-bold">Priority muscles</h2>
              <p className="text-muted-foreground mt-1 text-sm">Select muscles you want to grow faster. These get +20-40% volume.</p>
            </div>
            <div className="flex flex-wrap gap-2">
              {MUSCLE_GROUPS.map((mg) => {
                const selected = store.priorityMuscles.includes(mg);
                return (
                  <button key={mg} onClick={() => { const next = selected ? store.priorityMuscles.filter((m) => m !== mg) : [...store.priorityMuscles, mg]; store.setPriorityMuscles(next); }}
                    className={cn('px-4 py-2.5 rounded-full text-sm font-medium border transition-all', selected ? 'bg-primary text-primary-foreground border-primary scale-105' : 'bg-secondary border-border hover:border-primary/50')}>
                    {mg}
                  </button>
                );
              })}
            </div>
            <p className="text-xs text-muted-foreground">Optional — skip if no priority.</p>
          </div>
        )}

        {/* Step 7: Injuries */}
        {store.currentStep === 7 && (
          <div className="space-y-4">
            <div>
              <h2 className="text-2xl font-bold">Any injuries or limitations?</h2>
              <p className="text-muted-foreground mt-1 text-sm">We&apos;ll avoid exercises that aggravate these areas.</p>
            </div>
            <div className="flex flex-wrap gap-2">
              {INJURY_AREAS.map((area) => {
                const exists = store.injuries.some((i) => i.bodyArea === area);
                return (
                  <button key={area} onClick={() => {
                    if (exists) store.removeInjury(store.injuries.findIndex((i) => i.bodyArea === area));
                    else store.addInjury({ bodyArea: area, severity: 'moderate' });
                  }}
                    className={cn('px-4 py-2.5 rounded-full text-sm font-medium border transition-all', exists ? 'bg-destructive/20 text-destructive border-destructive/50' : 'bg-secondary border-border hover:border-destructive/30')}>
                    {exists && <AlertTriangle className="h-3.5 w-3.5 inline mr-1.5" />}
                    {area}
                  </button>
                );
              })}
            </div>
            <p className="text-xs text-muted-foreground">Optional — skip if no injuries.</p>
          </div>
        )}

        {/* Step 8: Review */}
        {store.currentStep === 8 && (
          <div className="space-y-6">
            <div>
              <h2 className="text-2xl font-bold">Ready to train</h2>
              <p className="text-muted-foreground mt-1 text-sm">Review your setup and let&apos;s build your program.</p>
            </div>

            <div className="space-y-2">
              <Label htmlFor="bodyweight">Body weight (optional)</Label>
              <Input id="bodyweight" type="number" inputMode="numeric" placeholder="e.g. 180" value={store.bodyWeight ?? ''}
                onChange={(e) => store.setBodyWeight(parseFloat(e.target.value) || 0)} />
              <p className="text-xs text-muted-foreground">Used for relative strength tracking.</p>
            </div>

            <Card>
              <CardContent className="p-4 space-y-2">
                <p className="font-semibold text-sm mb-3">Your Setup</p>
                <div className="grid grid-cols-2 gap-y-2 gap-x-4 text-sm">
                  <span className="text-muted-foreground">Goal</span>
                  <span className="capitalize font-medium">{store.goal?.replace('_', ' ') || '—'}</span>
                  <span className="text-muted-foreground">Experience</span>
                  <span className="capitalize font-medium">{store.experience || '—'}</span>
                  <span className="text-muted-foreground">Schedule</span>
                  <span className="font-medium">{store.daysPerWeek} days, {store.sessionMinutes} min</span>
                  <span className="text-muted-foreground">Equipment</span>
                  <span className="font-medium">{store.equipment.length} types</span>
                  <span className="text-muted-foreground">Split</span>
                  <span className="capitalize font-medium">{store.splitPreference?.replace(/_/g, ' ') || '—'}</span>
                  {store.priorityMuscles.length > 0 && (
                    <><span className="text-muted-foreground">Priority</span><span className="font-medium">{store.priorityMuscles.join(', ')}</span></>
                  )}
                  {store.injuries.length > 0 && (
                    <><span className="text-muted-foreground">Injuries</span><span className="font-medium">{store.injuries.map((i) => i.bodyArea).join(', ')}</span></>
                  )}
                </div>
              </CardContent>
            </Card>

            {error && <p className="text-sm text-destructive text-center">{error}</p>}
          </div>
        )}
      </div>

      {/* Navigation */}
      <div className="space-y-2 pt-2">
        <div className="flex gap-3">
          {store.currentStep > 1 && (
            <Button variant="outline" onClick={prevStep} className="flex-1">
              <ChevronLeft className="h-4 w-4 mr-1" /> Back
            </Button>
          )}

          {store.currentStep < TOTAL_STEPS ? (
            <Button onClick={nextStep} className="flex-1" disabled={isNextDisabled()}>
              Next <ChevronRight className="h-4 w-4 ml-1" />
            </Button>
          ) : (
            <Button onClick={handleComplete} className="flex-1" disabled={saving}>
              {saving ? (
                <><Loader2 className="h-4 w-4 mr-2 animate-spin" /> Building your plan...</>
              ) : (
                <><CheckCircle2 className="h-4 w-4 mr-2" /> Start Training</>
              )}
            </Button>
          )}
        </div>

        {/* Validation hint */}
        {getValidationHint() && (
          <p className="text-xs text-muted-foreground text-center">{getValidationHint()}</p>
        )}
      </div>
    </div>
  );
}
