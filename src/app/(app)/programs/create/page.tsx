'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/providers/auth-provider';
import { createClient } from '@/lib/supabase/client';
import { generateProgram } from '@/engines/program-generator';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Badge } from '@/components/ui/badge';
import { Slider } from '@/components/ui/slider';
import { cn } from '@/lib/utils';
import { SPLIT_INFO, SESSION_PRESETS } from '@/lib/constants';
import { SplitType } from '@/types';
import { Loader2, ChevronLeft, ChevronRight } from 'lucide-react';
import { ModeSelector, TrainingMode } from '@/components/programs/mode-selector';
import { StrengthSetup, StrengthLifts } from '@/components/programs/strength-setup';
import { ExercisePicker, SelectedExercise } from '@/components/programs/exercise-picker';
import { useUserProfile } from '@/hooks/use-user-profile';
import { resolveDaySchedule } from '@/engines/split-templates';

export default function CreateProgramPage() {
  const router = useRouter();
  const { user } = useAuth();
  const { data: profile } = useUserProfile();
  const [step, setStep] = useState(0);
  const [trainingMode, setTrainingMode] = useState<TrainingMode | null>(null);
  const [name, setName] = useState('');
  const [splitType, setSplitType] = useState<SplitType | null>(null);
  const [daysPerWeek, setDaysPerWeek] = useState(0);
  const [numWeeks, setNumWeeks] = useState(5);
  const [sessionMinutes, setSessionMinutes] = useState(profile?.preferredSessionMinutes || 60);
  const [generating, setGenerating] = useState(false);
  const [error, setError] = useState('');
  const [strengthLifts, setStrengthLifts] = useState<StrengthLifts>({ squat: null, bench: null, deadlift: null, ohp: null });
  const [builderExercises, setBuilderExercises] = useState<Map<number, SelectedExercise[]>>(new Map());

  const handleGenerate = async () => {
    if (!user || !splitType || !daysPerWeek) return;
    setGenerating(true);
    setError('');

    try {
      const supabase = createClient();

      // Deactivate existing active programs
      await supabase.from('programs').update({ status: 'paused' })
        .eq('user_id', user.id).eq('status', 'active');

      const result = await generateProgram(supabase, {
        splitType,
        daysPerWeek,
        numWeeks,
        hasDeload: true,
        availableEquipment: (profile?.availableEquipment || ['barbell', 'dumbbell', 'cable', 'machine', 'bodyweight']) as any,
        experienceLevel: (profile?.experienceLevel || 'intermediate') as any,
        userId: user.id,
        programName: name.trim(),
        sessionMinutes,
      });

      router.push('/programs');
    } catch (err: any) {
      setError(err.message || 'Failed to generate program');
    } finally {
      setGenerating(false);
    }
  };

  const splitOptions = Object.entries(SPLIT_INFO) as [SplitType, (typeof SPLIT_INFO)[keyof typeof SPLIT_INFO]][];

  return (
    <div className="p-4 lg:p-6 max-w-lg mx-auto space-y-6">
      <h1 className="text-2xl font-bold tracking-tight">Create Program</h1>

      {/* Step 0: Training Mode */}
      {step === 0 && (
        <div className="space-y-4">
          <div>
            <h2 className="text-lg font-semibold">How do you want to train?</h2>
            <p className="text-sm text-muted-foreground">Choose how much control Forge has over your programming.</p>
          </div>
          <ModeSelector value={trainingMode} onChange={setTrainingMode} />
          <Button
            onClick={() => {
              if (trainingMode === 'manual') {
                router.push('/dashboard');
              } else {
                setStep(1);
              }
            }}
            className="w-full"
            disabled={!trainingMode}>
            {trainingMode === 'manual' ? 'Go to Dashboard' : <>Next <ChevronRight className="h-4 w-4 ml-1" /></>}
          </Button>
        </div>
      )}

      {/* Step 1: Name */}
      {step === 1 && (
        <div className="space-y-4">
          <div>
            <h2 className="text-lg font-semibold">Name your program</h2>
            <p className="text-sm text-muted-foreground">Give it a name you'll recognize.</p>
          </div>
          <div className="space-y-2">
            <Label htmlFor="name">Program Name</Label>
            <Input
              id="name"
              placeholder="e.g. Hypertrophy Block 1"
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
          </div>
          <Button onClick={() => setStep(2)} className="w-full" disabled={!name.trim()}>
            Next <ChevronRight className="h-4 w-4 ml-1" />
          </Button>
        </div>
      )}

      {/* Step 2: Split */}
      {step === 2 && (
        <div className="space-y-4">
          <div>
            <h2 className="text-lg font-semibold">Choose your split</h2>
            <p className="text-sm text-muted-foreground">How do you want to organize training days?</p>
          </div>
          <div className="space-y-3">
            {splitOptions.map(([key, info]) => (
              <Card
                key={key}
                className={cn('cursor-pointer transition-colors', splitType === key && 'border-primary bg-primary/5')}
                onClick={() => setSplitType(key)}>
                <CardContent className="p-4 flex justify-between items-center">
                  <div>
                    <p className="font-semibold">{info.name}</p>
                    <p className="text-xs text-muted-foreground">{info.description}</p>
                  </div>
                  <Badge variant="secondary">{info.shortName}</Badge>
                </CardContent>
              </Card>
            ))}
          </div>
          <div className="flex gap-3">
            <Button variant="outline" onClick={() => setStep(1)} className="flex-1">
              <ChevronLeft className="h-4 w-4 mr-1" /> Back
            </Button>
            <Button onClick={() => setStep(3)} className="flex-1" disabled={!splitType}>
              Next <ChevronRight className="h-4 w-4 ml-1" />
            </Button>
          </div>
        </div>
      )}

      {/* Step 3: Days + Generate */}
      {step === 3 && (
        <div className="space-y-6">
          <div>
            <h2 className="text-lg font-semibold">Training days & duration</h2>
          </div>

          <div className="space-y-2">
            <Label>Days per week: {daysPerWeek || '—'}</Label>
            <div className="flex gap-2">
              {[3, 4, 5, 6].map((d) => {
                const recommended = splitType ? (SPLIT_INFO[splitType].recommendedDays as readonly number[]).includes(d) : false;
                return (
                  <button
                    key={d}
                    onClick={() => setDaysPerWeek(d)}
                    className={cn(
                      'flex-1 h-14 rounded-lg font-bold text-lg transition-colors border-2',
                      daysPerWeek === d
                        ? 'bg-primary text-primary-foreground border-primary'
                        : recommended
                        ? 'bg-secondary border-green-600/50 hover:border-primary/50'
                        : 'bg-secondary border-border hover:border-primary/50'
                    )}>
                    {d}
                  </button>
                );
              })}
            </div>
          </div>

          <div className="space-y-2">
            <Label>Session length</Label>
            <div className="grid grid-cols-4 gap-2">
              {SESSION_PRESETS.map((preset) => (
                <button
                  key={preset.value}
                  onClick={() => setSessionMinutes(preset.value)}
                  className={cn(
                    'py-3 rounded-lg text-center border-2 transition-colors',
                    sessionMinutes === preset.value
                      ? 'bg-primary text-primary-foreground border-primary'
                      : 'bg-secondary border-border hover:border-primary/50'
                  )}>
                  <span className="text-sm font-bold block">{preset.label}</span>
                  <span className="text-[10px] text-muted-foreground block mt-0.5">{preset.description.split('—')[1]?.trim()}</span>
                </button>
              ))}
            </div>
          </div>

          <div className="space-y-2">
            <Label>Mesocycle length: {numWeeks} weeks (including deload)</Label>
            <Slider
              value={[numWeeks]}
              onValueChange={([v]) => setNumWeeks(v)}
              min={4}
              max={8}
              step={1}
            />
          </div>

          {error && <p className="text-sm text-destructive text-center">{error}</p>}

          <div className="flex gap-3">
            <Button variant="outline" onClick={() => setStep(2)} className="flex-1">
              <ChevronLeft className="h-4 w-4 mr-1" /> Back
            </Button>
            {trainingMode === 'builder' ? (
              <Button onClick={() => setStep(4)} className="flex-1" disabled={!daysPerWeek}>
                Next <ChevronRight className="h-4 w-4 ml-1" />
              </Button>
            ) : profile?.trainingGoal === 'strength' || profile?.trainingGoal === 'powerbuilding' ? (
              <Button onClick={() => setStep(5)} className="flex-1" disabled={!daysPerWeek}>
                Next <ChevronRight className="h-4 w-4 ml-1" />
              </Button>
            ) : (
              <Button onClick={handleGenerate} className="flex-1" disabled={!daysPerWeek || generating}>
                {generating ? <><Loader2 className="h-4 w-4 mr-2 animate-spin" /> Generating...</> : 'Generate Program'}
              </Button>
            )}
          </div>
        </div>
      )}

      {/* Step 4: Builder Mode — Exercise Selection */}
      {step === 4 && trainingMode === 'builder' && splitType && daysPerWeek > 0 && (
        <div className="space-y-4">
          <div>
            <h2 className="text-lg font-semibold">Pick Your Exercises</h2>
            <p className="text-sm text-muted-foreground">Select exercises for each training day.</p>
          </div>

          {resolveDaySchedule(splitType, daysPerWeek).map((day, i) => (
            <ExercisePicker
              key={i}
              dayLabel={day.label}
              targetMuscles={day.muscles}
              selected={builderExercises.get(i) || []}
              onChange={(exercises) => {
                const next = new Map(builderExercises);
                next.set(i, exercises);
                setBuilderExercises(next);
              }}
            />
          ))}

          <div className="flex gap-3">
            <Button variant="outline" onClick={() => setStep(3)} className="flex-1">
              <ChevronLeft className="h-4 w-4 mr-1" /> Back
            </Button>
            <Button onClick={handleGenerate} className="flex-1" disabled={generating}>
              {generating ? <><Loader2 className="h-4 w-4 mr-2 animate-spin" /> Generating...</> : 'Generate Program'}
            </Button>
          </div>
        </div>
      )}

      {/* Step 5: Strength Mode — Main Lift Setup */}
      {step === 5 && (
        <div className="space-y-4">
          <StrengthSetup lifts={strengthLifts} onChange={setStrengthLifts} />

          <div className="flex gap-3">
            <Button variant="outline" onClick={() => setStep(3)} className="flex-1">
              <ChevronLeft className="h-4 w-4 mr-1" /> Back
            </Button>
            <Button onClick={handleGenerate} className="flex-1" disabled={generating}>
              {generating ? <><Loader2 className="h-4 w-4 mr-2 animate-spin" /> Generating...</> : 'Generate Program'}
            </Button>
          </div>
        </div>
      )}
    </div>
  );
}
