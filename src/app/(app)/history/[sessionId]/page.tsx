'use client';

import { useEffect, useState } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';
import { usePreferredUnit } from '@/hooks/use-user-profile';
import { useWorkoutStore, ActiveExercise } from '@/stores/workout-store';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
import { Button } from '@/components/ui/button';
import { formatDuration } from '@/lib/utils';
import { Clock, Dumbbell, AlertTriangle, Check, Repeat } from 'lucide-react';

interface SessionDetail {
  id: string;
  startedAt: string;
  completedAt: string | null;
  durationSeconds: number | null;
  overallFatigue: number | null;
  notes: string | null;
  dayLabel: string | null;
  exercises: ExerciseGroup[];
  feedback: any | null;
}

interface ExerciseGroup {
  exerciseId: string;
  exerciseName: string;
  sets: SetDetail[];
}

interface SetDetail {
  setNumber: number;
  weight: number | null;
  reps: number | null;
  rir: number | null;
  painFlag: boolean;
}

export default function SessionDetailPage() {
  const { sessionId } = useParams<{ sessionId: string }>();
  const router = useRouter();
  const { user } = useAuth();
  const unit = usePreferredUnit();
  const store = useWorkoutStore();
  const [session, setSession] = useState<SessionDetail | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!user || !sessionId) return;

    async function load() {
      const supabase = createClient();

      const { data: raw } = await supabase
        .from('workout_sessions')
        .select('*')
        .eq('id', sessionId)
        .eq('user_id', user!.id)
        .single();

      if (!raw) { setLoading(false); return; }

      // Day label
      let dayLabel: string | null = null;
      if (raw.program_day_id) {
        const { data: day } = await supabase
          .from('program_days')
          .select('day_label')
          .eq('id', raw.program_day_id)
          .single();
        dayLabel = day?.day_label || null;
      }

      // Sets grouped by exercise
      const { data: sets } = await supabase
        .from('workout_sets')
        .select('exercise_id, set_number, weight, reps, rir, pain_flag, exercises(name)')
        .eq('workout_session_id', sessionId)
        .eq('is_completed', true)
        .order('set_number');

      const exerciseMap = new Map<string, ExerciseGroup>();
      for (const s of sets || []) {
        const key = s.exercise_id;
        if (!exerciseMap.has(key)) {
          exerciseMap.set(key, {
            exerciseId: key,
            exerciseName: (s.exercises as any)?.name || 'Unknown',
            sets: [],
          });
        }
        exerciseMap.get(key)!.sets.push({
          setNumber: s.set_number,
          weight: s.weight,
          reps: s.reps,
          rir: s.rir,
          painFlag: s.pain_flag || false,
        });
      }

      // Feedback
      const { data: feedback } = await supabase
        .from('workout_feedback')
        .select('*')
        .eq('workout_session_id', sessionId)
        .single();

      setSession({
        id: raw.id,
        startedAt: raw.started_at,
        completedAt: raw.completed_at,
        durationSeconds: raw.duration_seconds,
        overallFatigue: raw.overall_fatigue,
        notes: raw.notes,
        dayLabel,
        exercises: [...exerciseMap.values()],
        feedback,
      });
      setLoading(false);
    }

    load();
  }, [sessionId, user]);

  if (loading) {
    return (
      <div className="p-4 lg:p-6 max-w-2xl mx-auto space-y-4">
        <Skeleton className="h-8 w-48" />
        <Skeleton className="h-32 w-full" />
        <Skeleton className="h-32 w-full" />
      </div>
    );
  }

  if (!session) {
    return <div className="p-4 text-center text-muted-foreground">Session not found.</div>;
  }

  const date = new Date(session.startedAt);
  const totalSets = session.exercises.reduce((c, e) => c + e.sets.length, 0);
  const totalVolume = session.exercises.reduce(
    (vol, e) => vol + e.sets.reduce((s, set) => s + (set.weight || 0) * (set.reps || 0), 0),
    0
  );

  return (
    <div className="p-4 lg:p-6 max-w-2xl mx-auto space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-2xl font-bold tracking-tight">
          {session.dayLabel || 'Workout'}
        </h1>
        <p className="text-sm text-muted-foreground">
          {date.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' })}
        </p>
      </div>

      {/* Summary stats */}
      <div className="grid grid-cols-3 gap-3">
        <Card>
          <CardContent className="p-3 text-center">
            <Dumbbell className="h-4 w-4 text-muted-foreground mx-auto mb-1" />
            <p className="text-lg font-bold">{totalSets}</p>
            <p className="text-[10px] text-muted-foreground uppercase">Sets</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-3 text-center">
            <Clock className="h-4 w-4 text-muted-foreground mx-auto mb-1" />
            <p className="text-lg font-bold">{session.durationSeconds ? formatDuration(session.durationSeconds) : '—'}</p>
            <p className="text-[10px] text-muted-foreground uppercase">Duration</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-3 text-center">
            <p className="text-lg font-bold">{Math.round(totalVolume).toLocaleString()}</p>
            <p className="text-[10px] text-muted-foreground uppercase">Volume ({unit})</p>
          </CardContent>
        </Card>
      </div>

      {/* Exercises */}
      {session.exercises.map((ex) => (
        <Card key={ex.exerciseId}>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm">{ex.exerciseName}</CardTitle>
          </CardHeader>
          <CardContent className="p-0">
            <div className="divide-y divide-border">
              {ex.sets.map((set) => (
                <div key={set.setNumber} className="flex items-center gap-3 px-4 py-2.5">
                  <div className="h-6 w-6 rounded-full bg-green-500/20 flex items-center justify-center">
                    <Check className="h-3.5 w-3.5 text-green-500" />
                  </div>
                  <span className="text-xs text-muted-foreground font-semibold w-10">Set {set.setNumber}</span>
                  <span className="text-sm font-semibold flex-1 tabular-nums">
                    {set.weight ?? '—'} {unit} × {set.reps ?? '—'}
                  </span>
                  {set.rir != null && <Badge variant="secondary" className="text-xs">RIR {set.rir}</Badge>}
                  {set.painFlag && <AlertTriangle className="h-4 w-4 text-destructive" />}
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      ))}

      {/* Notes */}
      {session.notes && (
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm">Session Notes</CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-sm text-muted-foreground">{session.notes}</p>
          </CardContent>
        </Card>
      )}

      {/* Feedback */}
      {session.feedback && (
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm">Post-Workout Feedback</CardTitle>
          </CardHeader>
          <CardContent className="space-y-1">
            <p className="text-sm">Difficulty: <span className="font-semibold">{session.feedback.perceived_difficulty}/10</span></p>
            <p className="text-sm">Pump: <span className="font-semibold">{session.feedback.overall_pump}/5</span></p>
          </CardContent>
        </Card>
      )}

      {/* Repeat this workout */}
      <Button
        variant="outline"
        className="w-full"
        onClick={async () => {
          if (!user || !session) return;
          const activeExercises: ActiveExercise[] = session.exercises.map((ex, i) => ({
            exerciseId: ex.exerciseId,
            exerciseName: ex.exerciseName,
            orderIndex: i,
            targetSets: ex.sets.length,
            targetRepsMin: 6,
            targetRepsMax: 12,
            targetRir: 2,
            targetWeight: ex.sets[0]?.weight || null,
            restSeconds: 120,
            previousBest: ex.sets[0] ? `${ex.sets[0].weight}×${ex.sets[0].reps}` : undefined,
            sets: ex.sets.map((s, j) => ({
              setNumber: j + 1,
              setType: 'working' as const,
              weight: s.weight,
              reps: null,
              rir: null,
              isCompleted: false,
              painFlag: false,
            })),
          }));
          try {
            await store.startWorkout({ exercises: activeExercises, userId: user.id });
            router.push('/workout');
          } catch (err: any) {
            alert('Failed: ' + (err.message || 'Unknown error'));
          }
        }}>
        <Repeat className="h-4 w-4 mr-2" /> Repeat This Workout
      </Button>
    </div>
  );
}
