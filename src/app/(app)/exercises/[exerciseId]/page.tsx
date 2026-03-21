'use client';

import { useEffect, useState } from 'react';
import { useParams } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';
import { usePreferredUnit } from '@/hooks/use-user-profile';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Skeleton } from '@/components/ui/skeleton';
import { ExternalLink, Video, Dumbbell } from 'lucide-react';

export default function ExerciseDetailPage() {
  const { exerciseId } = useParams<{ exerciseId: string }>();
  const { user } = useAuth();
  const unit = usePreferredUnit();
  const [exercise, setExercise] = useState<any>(null);
  const [history, setHistory] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function load() {
      const supabase = createClient();

      const { data: ex } = await supabase
        .from('exercises')
        .select(`
          *, exercise_muscle_groups (
            role, stimulus_magnitude,
            muscle_groups (name, display_name)
          )
        `)
        .eq('id', exerciseId)
        .single();

      setExercise(ex);

      // Fetch user's history for this exercise
      if (user) {
        const { data: sets } = await supabase
          .from('workout_sets')
          .select('weight, reps, rir, logged_at, workout_sessions!inner(user_id)')
          .eq('exercise_id', exerciseId)
          .eq('workout_sessions.user_id', user.id)
          .eq('is_completed', true)
          .order('logged_at', { ascending: false })
          .limit(20);

        setHistory(sets || []);
      }

      setLoading(false);
    }
    load();
  }, [exerciseId, user]);

  if (loading) {
    return (
      <div className="p-4 lg:p-6 max-w-2xl mx-auto space-y-4">
        <Skeleton className="h-8 w-64" />
        <Skeleton className="h-40 w-full" />
      </div>
    );
  }

  if (!exercise) {
    return <div className="p-4 text-center text-muted-foreground">Exercise not found.</div>;
  }

  const primaryMuscles = (exercise.exercise_muscle_groups || [])
    .filter((e: any) => e.role === 'primary')
    .map((e: any) => e.muscle_groups?.display_name)
    .filter(Boolean);

  const secondaryMuscles = (exercise.exercise_muscle_groups || [])
    .filter((e: any) => e.role === 'secondary')
    .map((e: any) => e.muscle_groups?.display_name)
    .filter(Boolean);

  return (
    <div className="p-4 lg:p-6 max-w-2xl mx-auto space-y-6">
      <div>
        <h1 className="text-2xl font-bold tracking-tight">{exercise.name}</h1>
        {exercise.aliases?.length > 0 && (
          <p className="text-sm text-muted-foreground mt-1">
            Also known as: {exercise.aliases.join(', ')}
          </p>
        )}
      </div>

      {/* Video button */}
      {exercise.video_url && (
        <a href={exercise.video_url} target="_blank" rel="noopener noreferrer">
          <Button variant="outline" className="w-full gap-2">
            <Video className="h-4 w-4 text-primary" />
            Watch Form Video
            <ExternalLink className="h-3.5 w-3.5 ml-auto" />
          </Button>
        </a>
      )}

      {/* Details */}
      <Card>
        <CardContent className="p-4 space-y-3">
          <div className="flex flex-wrap gap-2">
            <Badge>{exercise.equipment}</Badge>
            <Badge variant="secondary">{exercise.movement_pattern?.replace(/_/g, ' ')}</Badge>
            <Badge variant="secondary">{exercise.difficulty}</Badge>
            {exercise.is_compound && <Badge>Compound</Badge>}
            {exercise.is_unilateral && <Badge variant="secondary">Unilateral</Badge>}
          </div>

          <div className="grid grid-cols-2 gap-3 pt-2">
            <div>
              <p className="text-xs text-muted-foreground uppercase tracking-wider mb-1">Primary</p>
              <div className="flex flex-wrap gap-1">
                {primaryMuscles.map((m: string) => (
                  <Badge key={m} variant="secondary" className="text-xs">{m}</Badge>
                ))}
              </div>
            </div>
            {secondaryMuscles.length > 0 && (
              <div>
                <p className="text-xs text-muted-foreground uppercase tracking-wider mb-1">Secondary</p>
                <div className="flex flex-wrap gap-1">
                  {secondaryMuscles.map((m: string) => (
                    <Badge key={m} variant="secondary" className="text-[10px]">{m}</Badge>
                  ))}
                </div>
              </div>
            )}
          </div>

          {/* Scores */}
          <div className="grid grid-cols-3 gap-2 pt-2 border-t border-border">
            {[
              { label: 'Fatigue', value: exercise.fatigue_score },
              { label: 'Joint Stress', value: exercise.joint_stress },
              { label: 'Spine Load', value: exercise.spine_load },
              { label: 'Skill', value: exercise.skill_score },
              { label: 'Hypertrophy', value: exercise.hypertrophy_score },
              { label: 'Strength', value: exercise.strength_score },
            ].map((s) => (
              <div key={s.label} className="text-center">
                <p className="text-lg font-bold tabular-nums">{s.value ?? '—'}</p>
                <p className="text-[10px] text-muted-foreground uppercase">{s.label}</p>
              </div>
            ))}
          </div>

          {exercise.instructions && (
            <div className="pt-2 border-t border-border">
              <p className="text-xs text-muted-foreground uppercase tracking-wider mb-1">Instructions</p>
              <p className="text-sm">{exercise.instructions}</p>
            </div>
          )}
        </CardContent>
      </Card>

      {/* History */}
      {history.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle className="text-base">Your History</CardTitle>
          </CardHeader>
          <CardContent className="p-0">
            <div className="divide-y divide-border">
              {history.map((set: any, i: number) => (
                <div key={i} className="flex items-center justify-between px-4 py-2.5">
                  <span className="text-xs text-muted-foreground">
                    {new Date(set.logged_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}
                  </span>
                  <span className="text-sm font-semibold tabular-nums">
                    {set.weight} {unit} × {set.reps}
                  </span>
                  {set.rir != null && (
                    <Badge variant="secondary" className="text-xs">RIR {set.rir}</Badge>
                  )}
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
