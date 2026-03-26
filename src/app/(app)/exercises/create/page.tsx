'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/providers/auth-provider';
import { useMuscleGroups } from '@/hooks/use-exercises';
import { createClient } from '@/lib/supabase/client';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { cn } from '@/lib/utils';
import { ArrowLeft, Loader2, Dumbbell } from 'lucide-react';
import Link from 'next/link';
import { useQueryClient } from '@tanstack/react-query';

const EQUIPMENT_OPTIONS = [
  { value: 'barbell', label: 'Barbell' },
  { value: 'dumbbell', label: 'Dumbbell' },
  { value: 'cable', label: 'Cable' },
  { value: 'machine', label: 'Machine' },
  { value: 'bodyweight', label: 'Bodyweight' },
  { value: 'bands', label: 'Bands' },
];

const MOVEMENT_PATTERNS = [
  { value: 'horizontal_press', label: 'Horizontal Press' },
  { value: 'vertical_press', label: 'Vertical Press' },
  { value: 'horizontal_pull', label: 'Horizontal Pull' },
  { value: 'vertical_pull', label: 'Vertical Pull' },
  { value: 'squat', label: 'Squat' },
  { value: 'hinge', label: 'Hinge' },
  { value: 'isolation', label: 'Isolation' },
  { value: 'carry', label: 'Carry' },
];

const DIFFICULTY_OPTIONS = [
  { value: 'beginner', label: 'Beginner' },
  { value: 'intermediate', label: 'Intermediate' },
  { value: 'advanced', label: 'Advanced' },
];

export default function CreateExercisePage() {
  const router = useRouter();
  const { user } = useAuth();
  const queryClient = useQueryClient();
  const { data: muscleGroups } = useMuscleGroups();

  const [name, setName] = useState('');
  const [equipment, setEquipment] = useState('');
  const [movementPattern, setMovementPattern] = useState('');
  const [difficulty, setDifficulty] = useState('intermediate');
  const [isCompound, setIsCompound] = useState(false);
  const [instructions, setInstructions] = useState('');
  const [primaryMuscles, setPrimaryMuscles] = useState<string[]>([]);
  const [secondaryMuscles, setSecondaryMuscles] = useState<string[]>([]);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');

  const toggleMuscle = (muscleId: string, type: 'primary' | 'secondary') => {
    if (type === 'primary') {
      setPrimaryMuscles((prev) =>
        prev.includes(muscleId) ? prev.filter((m) => m !== muscleId) : [...prev, muscleId]
      );
      // Remove from secondary if being added to primary
      setSecondaryMuscles((prev) => prev.filter((m) => m !== muscleId));
    } else {
      setSecondaryMuscles((prev) =>
        prev.includes(muscleId) ? prev.filter((m) => m !== muscleId) : [...prev, muscleId]
      );
      // Remove from primary if being added to secondary
      setPrimaryMuscles((prev) => prev.filter((m) => m !== muscleId));
    }
  };

  const canSubmit = name.trim().length >= 2 && equipment && movementPattern && primaryMuscles.length > 0;

  const handleSubmit = async () => {
    if (!canSubmit || !user) return;
    setSaving(true);
    setError('');

    try {
      const supabase = createClient();

      // Insert exercise
      const { data: exercise, error: exError } = await supabase
        .from('exercises')
        .insert({
          name: name.trim(),
          equipment,
          movement_pattern: movementPattern,
          difficulty,
          is_compound: isCompound,
          instructions: instructions.trim() || null,
          is_system: false,
          created_by: user.id,
        })
        .select('id')
        .single();

      if (exError) throw new Error('Failed to create exercise: ' + exError.message);

      // Insert muscle group mappings
      const mappings = [
        ...primaryMuscles.map((mgId) => ({
          exercise_id: exercise.id,
          muscle_group_id: mgId,
          role: 'primary' as const,
          stimulus_magnitude: 1.0,
        })),
        ...secondaryMuscles.map((mgId) => ({
          exercise_id: exercise.id,
          muscle_group_id: mgId,
          role: 'secondary' as const,
          stimulus_magnitude: 0.5,
        })),
      ];

      if (mappings.length > 0) {
        const { error: mapError } = await supabase
          .from('exercise_muscle_groups')
          .insert(mappings);
        if (mapError) throw new Error('Failed to save muscle groups: ' + mapError.message);
      }

      // Invalidate exercise cache so the new exercise appears
      queryClient.invalidateQueries({ queryKey: ['exercises'] });

      router.push('/exercises');
    } catch (err: any) {
      console.error('Create exercise error:', err);
      setError(err.message || 'Something went wrong.');
      setSaving(false);
    }
  };

  return (
    <div className="p-4 lg:p-6 max-w-2xl mx-auto space-y-4">
      {/* Header */}
      <div className="flex items-center gap-3">
        <Link href="/exercises">
          <Button variant="ghost" size="sm" className="h-8 w-8 p-0">
            <ArrowLeft className="h-4 w-4" />
          </Button>
        </Link>
        <h1 className="text-2xl font-bold tracking-tight">Create Exercise</h1>
      </div>

      {/* Name */}
      <Card>
        <CardContent className="pt-4 space-y-3">
          <div>
            <Label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
              Exercise Name *
            </Label>
            <Input
              placeholder="e.g., Cable Hammer Curl"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="mt-1"
            />
          </div>

          {/* Equipment */}
          <div>
            <Label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
              Equipment *
            </Label>
            <div className="flex flex-wrap gap-2 mt-1.5">
              {EQUIPMENT_OPTIONS.map((eq) => (
                <button
                  key={eq.value}
                  onClick={() => setEquipment(equipment === eq.value ? '' : eq.value)}
                  className={cn(
                    'px-3 py-1.5 rounded-lg text-xs font-medium border transition-colors',
                    equipment === eq.value
                      ? 'bg-primary text-primary-foreground border-primary'
                      : 'bg-secondary border-border text-muted-foreground'
                  )}>
                  {eq.label}
                </button>
              ))}
            </div>
          </div>

          {/* Movement Pattern */}
          <div>
            <Label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
              Movement Pattern *
            </Label>
            <div className="flex flex-wrap gap-2 mt-1.5">
              {MOVEMENT_PATTERNS.map((mp) => (
                <button
                  key={mp.value}
                  onClick={() => setMovementPattern(movementPattern === mp.value ? '' : mp.value)}
                  className={cn(
                    'px-3 py-1.5 rounded-lg text-xs font-medium border transition-colors',
                    movementPattern === mp.value
                      ? 'bg-primary text-primary-foreground border-primary'
                      : 'bg-secondary border-border text-muted-foreground'
                  )}>
                  {mp.label}
                </button>
              ))}
            </div>
          </div>

          {/* Difficulty + Compound */}
          <div className="flex gap-4">
            <div className="flex-1">
              <Label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                Difficulty
              </Label>
              <div className="flex gap-2 mt-1.5">
                {DIFFICULTY_OPTIONS.map((d) => (
                  <button
                    key={d.value}
                    onClick={() => setDifficulty(d.value)}
                    className={cn(
                      'px-3 py-1.5 rounded-lg text-xs font-medium border transition-colors flex-1',
                      difficulty === d.value
                        ? 'bg-primary text-primary-foreground border-primary'
                        : 'bg-secondary border-border text-muted-foreground'
                    )}>
                    {d.label}
                  </button>
                ))}
              </div>
            </div>
          </div>

          <button
            onClick={() => setIsCompound(!isCompound)}
            className={cn(
              'flex items-center gap-2 px-3 py-2 rounded-lg border text-sm transition-colors w-full',
              isCompound
                ? 'bg-primary/10 border-primary text-primary'
                : 'bg-secondary border-border text-muted-foreground'
            )}>
            <div className={cn(
              'h-4 w-4 rounded border-2 flex items-center justify-center transition-colors',
              isCompound ? 'border-primary bg-primary' : 'border-muted-foreground'
            )}>
              {isCompound && <span className="text-primary-foreground text-[10px] font-bold">✓</span>}
            </div>
            Compound exercise (works multiple muscle groups)
          </button>
        </CardContent>
      </Card>

      {/* Muscle Groups */}
      <Card>
        <CardHeader className="pb-2">
          <CardTitle className="text-sm">Primary Muscles *</CardTitle>
          <p className="text-xs text-muted-foreground">Select at least one primary muscle group</p>
        </CardHeader>
        <CardContent>
          <div className="flex flex-wrap gap-2">
            {(muscleGroups || []).map((mg: any) => {
              const isPrimary = primaryMuscles.includes(mg.id);
              const isSecondary = secondaryMuscles.includes(mg.id);
              return (
                <button
                  key={mg.id}
                  onClick={() => toggleMuscle(mg.id, 'primary')}
                  className={cn(
                    'px-3 py-1.5 rounded-lg text-xs font-medium border transition-colors',
                    isPrimary
                      ? 'bg-primary text-primary-foreground border-primary'
                      : isSecondary
                        ? 'bg-secondary border-border text-muted-foreground opacity-50'
                        : 'bg-secondary border-border text-muted-foreground'
                  )}>
                  {mg.display_name}
                </button>
              );
            })}
          </div>
        </CardContent>
      </Card>

      <Card>
        <CardHeader className="pb-2">
          <CardTitle className="text-sm">Secondary Muscles</CardTitle>
          <p className="text-xs text-muted-foreground">Optional — muscles that assist the movement</p>
        </CardHeader>
        <CardContent>
          <div className="flex flex-wrap gap-2">
            {(muscleGroups || []).map((mg: any) => {
              const isPrimary = primaryMuscles.includes(mg.id);
              const isSecondary = secondaryMuscles.includes(mg.id);
              return (
                <button
                  key={mg.id}
                  onClick={() => toggleMuscle(mg.id, 'secondary')}
                  disabled={isPrimary}
                  className={cn(
                    'px-3 py-1.5 rounded-lg text-xs font-medium border transition-colors',
                    isSecondary
                      ? 'bg-primary text-primary-foreground border-primary'
                      : isPrimary
                        ? 'bg-secondary border-border text-muted-foreground opacity-30 cursor-not-allowed'
                        : 'bg-secondary border-border text-muted-foreground'
                  )}>
                  {mg.display_name}
                </button>
              );
            })}
          </div>
        </CardContent>
      </Card>

      {/* Instructions */}
      <Card>
        <CardContent className="pt-4">
          <Label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
            Instructions (optional)
          </Label>
          <textarea
            className="w-full h-20 mt-1.5 px-3 py-2 rounded-lg bg-secondary border border-border text-sm resize-none focus:outline-none focus:ring-1 focus:ring-primary"
            placeholder="Describe how to perform this exercise..."
            value={instructions}
            onChange={(e) => setInstructions(e.target.value)}
          />
        </CardContent>
      </Card>

      {/* Error */}
      {error && (
        <p className="text-sm text-destructive bg-destructive/10 px-3 py-2 rounded-lg">{error}</p>
      )}

      {/* Submit */}
      <Button
        className="w-full h-12 font-bold uppercase tracking-wider"
        disabled={!canSubmit || saving}
        onClick={handleSubmit}>
        {saving ? (
          <><Loader2 className="h-4 w-4 mr-2 animate-spin" /> Creating...</>
        ) : (
          <><Dumbbell className="h-4 w-4 mr-2" /> Create Exercise</>
        )}
      </Button>
    </div>
  );
}
