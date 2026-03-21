'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/providers/auth-provider';
import { createClient } from '@/lib/supabase/client';
import { useOnboardingStore, TrainingGoal, ExperienceLevel, SplitPreference } from '@/stores/onboarding-store';
import { generateProgram } from '@/engines/program-generator';
import { SplitType } from '@/types';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Progress } from '@/components/ui/progress';
import { Badge } from '@/components/ui/badge';
import { Slider } from '@/components/ui/slider';
import { cn } from '@/lib/utils';
import {
  Target, Dumbbell, Calendar, Wrench, LayoutList, Heart, Shield, CheckCircle2,
  ChevronLeft, ChevronRight, Loader2,
} from 'lucide-react';

const TOTAL_STEPS = 7;

const GOALS: { value: TrainingGoal; label: string; description: string }[] = [
  { value: 'hypertrophy', label: 'Build Muscle', description: 'Maximise muscle growth with volume-focused training' },
  { value: 'strength', label: 'Get Stronger', description: 'Increase squat, bench, deadlift, and overhead press' },
  { value: 'powerbuilding', label: 'Powerbuilding', description: 'Blend strength and hypertrophy for both size and power' },
  { value: 'general_fitness', label: 'General Fitness', description: 'Well-rounded training for health and performance' },
  { value: 'body_recomp', label: 'Body Recomp', description: 'Lose fat while maintaining or building muscle' },
];

const EXPERIENCE_LEVELS: { value: ExperienceLevel; label: string; description: string }[] = [
  { value: 'beginner', label: 'Beginner', description: 'Less than 1 year of consistent training' },
  { value: 'intermediate', label: 'Intermediate', description: '1-3 years of structured training' },
  { value: 'advanced', label: 'Advanced', description: '3+ years with solid progression' },
];

const EQUIPMENT = [
  { id: 'barbell', label: 'Barbell' },
  { id: 'dumbbell', label: 'Dumbbells' },
  { id: 'cable', label: 'Cables' },
  { id: 'machine', label: 'Machines' },
  { id: 'bodyweight', label: 'Bodyweight' },
  { id: 'bands', label: 'Bands' },
];

const SPLITS: { value: SplitPreference; label: string; days: string }[] = [
  { value: 'push_pull_legs', label: 'Push / Pull / Legs', days: '3-6' },
  { value: 'upper_lower', label: 'Upper / Lower', days: '4-6' },
  { value: 'full_body', label: 'Full Body', days: '3-4' },
  { value: 'bro_split', label: 'Bro Split', days: '5-6' },
  { value: 'arnold_split', label: 'Arnold Split', days: '6' },
  { value: 'no_preference', label: 'No Preference', days: 'You decide' },
];

const MUSCLE_GROUPS = [
  'Chest', 'Back', 'Quads', 'Hamstrings', 'Glutes',
  'Shoulders', 'Biceps', 'Triceps', 'Calves', 'Abs',
];

export default function OnboardingPage() {
  const router = useRouter();
  const { user } = useAuth();
  const store = useOnboardingStore();
  const [saving, setSaving] = useState(false);

  const progress = (store.currentStep / TOTAL_STEPS) * 100;

  const handleComplete = async () => {
    if (!user) return;
    setSaving(true);

    const supabase = createClient();

    // Update user profile
    await supabase.from('user_profiles').update({
      training_goal: store.goal,
      experience_level: store.experience,
      training_age_months: store.trainingAgeMonths,
      preferred_session_minutes: store.sessionMinutes,
      available_equipment: `{${store.equipment.join(',')}}`,
      preferred_split: store.splitPreference === 'no_preference' ? null : store.splitPreference,
      body_weight: store.bodyWeight,
      onboarding_completed: true,
    }).eq('id', user.id);

    // Save priority muscles
    if (store.priorityMuscles.length > 0) {
      const { data: muscleGroups } = await supabase
        .from('muscle_groups')
        .select('id, display_name')
        .in('display_name', store.priorityMuscles);

      if (muscleGroups) {
        await supabase.from('user_priority_muscles').insert(
          muscleGroups.map((mg) => ({
            user_id: user.id,
            muscle_group_id: mg.id,
            priority_level: 1,
          }))
        );
      }
    }

    // Save injuries
    for (const injury of store.injuries) {
      await supabase.from('user_injuries').insert({
        user_id: user.id,
        body_area: injury.bodyArea,
        severity: injury.severity,
      });
    }

    // Auto-generate first program
    try {
      let splitType: SplitType;
      if (store.splitPreference && store.splitPreference !== 'no_preference') {
        splitType = store.splitPreference as SplitType;
      } else {
        // Auto-select based on days per week
        if (store.daysPerWeek <= 3) splitType = 'full_body';
        else if (store.daysPerWeek === 4) splitType = 'upper_lower';
        else splitType = 'push_pull_legs';
      }

      await generateProgram(supabase, {
        splitType,
        daysPerWeek: store.daysPerWeek,
        numWeeks: 5,
        hasDeload: true,
        availableEquipment: store.equipment as import('@/types').EquipmentType[],
        experienceLevel: (store.experience || 'intermediate') as import('@/types').Difficulty,
        userId: user.id,
        programName: `${store.goal === 'strength' ? 'Strength' : 'Hypertrophy'} Block 1`,
      });
    } catch (err) {
      console.error('Failed to generate initial program:', err);
    }

    store.reset();
    router.push('/dashboard');
  };

  return (
    <div className="space-y-6">
      <Progress value={progress} className="h-1.5" />

      <div className="flex items-center gap-2 text-sm text-muted-foreground">
        <span>Step {store.currentStep} of {TOTAL_STEPS}</span>
      </div>

      {/* Step 1: Goal */}
      {store.currentStep === 1 && (
        <div className="space-y-4">
          <div>
            <h2 className="text-2xl font-bold">What&apos;s your primary goal?</h2>
            <p className="text-muted-foreground mt-1">This shapes how Forge programs your training.</p>
          </div>
          <div className="space-y-3">
            {GOALS.map((g) => (
              <Card
                key={g.value}
                className={cn(
                  'cursor-pointer transition-colors',
                  store.goal === g.value && 'border-primary bg-primary/5'
                )}
                onClick={() => store.setGoal(g.value)}>
                <CardContent className="p-4">
                  <p className="font-semibold">{g.label}</p>
                  <p className="text-sm text-muted-foreground">{g.description}</p>
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
            <p className="text-muted-foreground mt-1">Helps set appropriate volume and intensity.</p>
          </div>
          <div className="space-y-3">
            {EXPERIENCE_LEVELS.map((e) => (
              <Card
                key={e.value}
                className={cn(
                  'cursor-pointer transition-colors',
                  store.experience === e.value && 'border-primary bg-primary/5'
                )}
                onClick={() => store.setExperience(e.value)}>
                <CardContent className="p-4">
                  <p className="font-semibold">{e.label}</p>
                  <p className="text-sm text-muted-foreground">{e.description}</p>
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
            <p className="text-muted-foreground mt-1">How often and how long do you train?</p>
          </div>

          <div className="space-y-2">
            <Label>Days per week: {store.daysPerWeek}</Label>
            <div className="flex gap-2">
              {[2, 3, 4, 5, 6].map((d) => (
                <button
                  key={d}
                  onClick={() => store.setDaysPerWeek(d)}
                  className={cn(
                    'flex-1 h-12 rounded-lg font-bold text-lg transition-colors border',
                    store.daysPerWeek === d
                      ? 'bg-primary text-primary-foreground border-primary'
                      : 'bg-secondary border-border hover:border-primary/50'
                  )}>
                  {d}
                </button>
              ))}
            </div>
          </div>

          <div className="space-y-2">
            <Label>Session length: {store.sessionMinutes} min</Label>
            <Slider
              value={[store.sessionMinutes]}
              onValueChange={([v]) => store.setSessionMinutes(v)}
              min={30}
              max={120}
              step={15}
            />
            <div className="flex justify-between text-xs text-muted-foreground">
              <span>30 min</span><span>120 min</span>
            </div>
          </div>
        </div>
      )}

      {/* Step 4: Equipment */}
      {store.currentStep === 4 && (
        <div className="space-y-4">
          <div>
            <h2 className="text-2xl font-bold">Available equipment</h2>
            <p className="text-muted-foreground mt-1">Select everything you have access to.</p>
          </div>
          <div className="grid grid-cols-2 gap-3">
            {EQUIPMENT.map((eq) => {
              const selected = store.equipment.includes(eq.id);
              return (
                <Card
                  key={eq.id}
                  className={cn(
                    'cursor-pointer transition-colors text-center',
                    selected && 'border-primary bg-primary/5'
                  )}
                  onClick={() => {
                    const next = selected
                      ? store.equipment.filter((e) => e !== eq.id)
                      : [...store.equipment, eq.id];
                    store.setEquipment(next);
                  }}>
                  <CardContent className="p-4">
                    <Wrench className={cn('h-5 w-5 mx-auto mb-1', selected ? 'text-primary' : 'text-muted-foreground')} />
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
            <p className="text-muted-foreground mt-1">Pick a split or let Forge choose for you.</p>
          </div>
          <div className="space-y-3">
            {SPLITS.map((s) => (
              <Card
                key={s.value}
                className={cn(
                  'cursor-pointer transition-colors',
                  store.splitPreference === s.value && 'border-primary bg-primary/5'
                )}
                onClick={() => store.setSplitPreference(s.value)}>
                <CardContent className="p-4 flex justify-between items-center">
                  <p className="font-semibold">{s.label}</p>
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
            <p className="text-muted-foreground mt-1">Select muscles you want to grow faster. These get +20-40% volume.</p>
          </div>
          <div className="flex flex-wrap gap-2">
            {MUSCLE_GROUPS.map((mg) => {
              const selected = store.priorityMuscles.includes(mg);
              return (
                <button
                  key={mg}
                  onClick={() => {
                    const next = selected
                      ? store.priorityMuscles.filter((m) => m !== mg)
                      : [...store.priorityMuscles, mg];
                    store.setPriorityMuscles(next);
                  }}
                  className={cn(
                    'px-4 py-2 rounded-full text-sm font-medium border transition-colors',
                    selected
                      ? 'bg-primary text-primary-foreground border-primary'
                      : 'bg-secondary border-border hover:border-primary/50'
                  )}>
                  {mg}
                </button>
              );
            })}
          </div>
          <p className="text-xs text-muted-foreground">Optional — skip if no priority.</p>
        </div>
      )}

      {/* Step 7: Body / Review */}
      {store.currentStep === 7 && (
        <div className="space-y-6">
          <div>
            <h2 className="text-2xl font-bold">Almost done</h2>
            <p className="text-muted-foreground mt-1">Optional details to personalise your plan.</p>
          </div>

          <div className="space-y-2">
            <Label htmlFor="bodyweight">Body weight (optional)</Label>
            <Input
              id="bodyweight"
              type="number"
              placeholder="e.g. 180"
              value={store.bodyWeight ?? ''}
              onChange={(e) => store.setBodyWeight(parseFloat(e.target.value) || 0)}
            />
            <p className="text-xs text-muted-foreground">In lbs. Used for relative strength tracking.</p>
          </div>

          <Card>
            <CardContent className="p-4 space-y-2">
              <p className="font-semibold text-sm">Your Setup</p>
              <div className="grid grid-cols-2 gap-2 text-sm">
                <span className="text-muted-foreground">Goal:</span>
                <span className="capitalize">{store.goal?.replace('_', ' ') || '—'}</span>
                <span className="text-muted-foreground">Experience:</span>
                <span className="capitalize">{store.experience || '—'}</span>
                <span className="text-muted-foreground">Schedule:</span>
                <span>{store.daysPerWeek} days, {store.sessionMinutes} min</span>
                <span className="text-muted-foreground">Equipment:</span>
                <span>{store.equipment.length} types</span>
                <span className="text-muted-foreground">Split:</span>
                <span className="capitalize">{store.splitPreference?.replace(/_/g, ' ') || '—'}</span>
                {store.priorityMuscles.length > 0 && (
                  <>
                    <span className="text-muted-foreground">Priority:</span>
                    <span>{store.priorityMuscles.join(', ')}</span>
                  </>
                )}
              </div>
            </CardContent>
          </Card>
        </div>
      )}

      {/* Navigation */}
      <div className="flex gap-3 pt-4">
        {store.currentStep > 1 && (
          <Button variant="outline" onClick={store.prevStep} className="flex-1">
            <ChevronLeft className="h-4 w-4 mr-1" /> Back
          </Button>
        )}

        {store.currentStep < TOTAL_STEPS ? (
          <Button
            onClick={store.nextStep}
            className="flex-1"
            disabled={
              (store.currentStep === 1 && !store.goal) ||
              (store.currentStep === 2 && !store.experience) ||
              (store.currentStep === 4 && store.equipment.length === 0) ||
              (store.currentStep === 5 && !store.splitPreference)
            }>
            Next <ChevronRight className="h-4 w-4 ml-1" />
          </Button>
        ) : (
          <Button onClick={handleComplete} className="flex-1" disabled={saving}>
            {saving ? (
              <><Loader2 className="h-4 w-4 mr-2 animate-spin" /> Creating your plan...</>
            ) : (
              <><CheckCircle2 className="h-4 w-4 mr-2" /> Start Training</>
            )}
          </Button>
        )}
      </div>
    </div>
  );
}
