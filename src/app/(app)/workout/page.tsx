'use client';

import { useEffect, useState, useCallback, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/providers/auth-provider';
import { createClient } from '@/lib/supabase/client';
import { useWorkoutStore, ActiveExercise } from '@/stores/workout-store';
import { usePreferredUnit } from '@/hooks/use-user-profile';
import { SetRow } from '@/components/workout/set-row';
import { RestTimer } from '@/components/workout/rest-timer';
import { FeedbackSheet, WorkoutFeedback } from '@/components/workout/feedback-sheet';
import { SubstitutionDialog } from '@/components/workout/substitution-dialog';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Progress } from '@/components/ui/progress';
import { Dialog, DialogContent } from '@/components/ui/dialog';
import { Skeleton } from '@/components/ui/skeleton';
import { cn, formatDuration } from '@/lib/utils';
import {
  Dumbbell, ChevronLeft, ChevronRight, Loader2, X, Play,
} from 'lucide-react';
import Link from 'next/link';

export default function WorkoutPage() {
  const router = useRouter();
  const { user } = useAuth();
  const store = useWorkoutStore();
  const unit = usePreferredUnit();

  const [todayWorkout, setTodayWorkout] = useState<{
    programId: string;
    programName: string;
    dayId: string;
    dayLabel: string;
    weekNumber: number;
    targetRir: number;
    exercises: ActiveExercise[];
  } | null>(null);
  const [loading, setLoading] = useState(true);
  const [finishing, setFinishing] = useState(false);
  const [showFeedback, setShowFeedback] = useState(false);
  const [showSwap, setShowSwap] = useState(false);
  const [expandedExercise, setExpandedExercise] = useState<number>(0);
  const [swapExerciseIdx, setSwapExerciseIdx] = useState<number>(0);

  // Elapsed timer
  const [elapsed, setElapsed] = useState('0:00');
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);

  useEffect(() => {
    if (store.isActive && store.startedAt) {
      timerRef.current = setInterval(() => {
        const diff = Math.floor((Date.now() - store.startedAt!.getTime()) / 1000);
        setElapsed(formatDuration(diff));
      }, 1000);
    } else if (timerRef.current) {
      clearInterval(timerRef.current);
    }
    return () => { if (timerRef.current) clearInterval(timerRef.current); };
  }, [store.isActive, store.startedAt]);

  // Recover timer when tab regains focus (after screen lock / tab switch)
  useEffect(() => {
    const handleVisibility = () => {
      if (document.visibilityState === 'visible' && store.isActive && store.startedAt) {
        const diff = Math.floor((Date.now() - store.startedAt.getTime()) / 1000);
        setElapsed(formatDuration(diff));
      }
    };
    document.addEventListener('visibilitychange', handleVisibility);
    return () => document.removeEventListener('visibilitychange', handleVisibility);
  }, [store.isActive, store.startedAt]);

  // Keep screen awake during workout
  useEffect(() => {
    if (!store.isActive) return;
    let wakeLock: any = null;
    const requestWakeLock = async () => {
      try {
        if ('wakeLock' in navigator) {
          wakeLock = await (navigator as any).wakeLock.request('screen');
        }
      } catch {}
    };
    requestWakeLock();
    // Re-acquire wake lock when tab regains focus (it gets released on blur)
    const handleVisibility = () => {
      if (document.visibilityState === 'visible') requestWakeLock();
    };
    document.addEventListener('visibilitychange', handleVisibility);
    return () => {
      wakeLock?.release();
      document.removeEventListener('visibilitychange', handleVisibility);
    };
  }, [store.isActive]);

  // Fetch today's workout
  const fetchToday = useCallback(async () => {
    if (!user || store.isActive) { setLoading(false); return; }

    const supabase = createClient();
    const { data: programs } = await supabase
      .from('programs')
      .select('id, name, current_week, current_day')
      .eq('user_id', user.id).eq('status', 'active')
      .limit(1);

    const program = programs?.[0];
    if (!program) { setTodayWorkout(null); setLoading(false); return; }

    const { data: week } = await supabase
      .from('program_weeks')
      .select('id, week_number, target_rir')
      .eq('program_id', program.id).eq('week_number', program.current_week).single();

    if (!week) { setTodayWorkout(null); setLoading(false); return; }

    const { data: day } = await supabase
      .from('program_days')
      .select('id, day_number, day_label')
      .eq('program_week_id', week.id).eq('day_number', program.current_day).single();

    if (!day) { setTodayWorkout(null); setLoading(false); return; }

    const { data: programExercises } = await supabase
      .from('program_exercises')
      .select('*, exercise:exercises (id, name, equipment, is_compound)')
      .eq('program_day_id', day.id).order('order_index');

    if (!programExercises?.length) { setTodayWorkout(null); setLoading(false); return; }

    const exerciseIds = programExercises.map((pe: any) => pe.exercise_id);
    const { data: history } = await supabase
      .from('user_exercise_history')
      .select('exercise_id, last_weight, last_reps')
      .eq('user_id', user.id).in('exercise_id', exerciseIds);

    const historyMap = new Map((history || []).map((h: any) => [h.exercise_id, h]));

    const activeExercises: ActiveExercise[] = programExercises.map((pe: any) => {
      const hist = historyMap.get(pe.exercise_id);
      const suggestedWeight = pe.target_weight || hist?.last_weight || null;
      const previousBest = hist ? `${hist.last_weight}×${hist.last_reps}` : undefined;

      return {
        exerciseId: pe.exercise_id,
        exerciseName: pe.exercise?.name || 'Unknown',
        isCompound: pe.exercise?.is_compound ?? true,
        orderIndex: pe.order_index,
        targetSets: pe.target_sets,
        targetRepsMin: pe.target_reps_min,
        targetRepsMax: pe.target_reps_max,
        targetRir: week.target_rir,
        targetWeight: suggestedWeight,
        restSeconds: pe.rest_seconds || 120,
        previousBest,
        sets: Array.from({ length: pe.target_sets }, (_, i) => ({
          setNumber: i + 1,
          setType: 'working' as const,
          weight: suggestedWeight,
          reps: null,
          rir: null,
          isCompleted: false,
          painFlag: false,
        })),
      };
    });

    setTodayWorkout({
      programId: program.id,
      programName: program.name,
      dayId: day.id,
      dayLabel: day.day_label,
      weekNumber: week.week_number,
      targetRir: week.target_rir,
      exercises: activeExercises,
    });
    setLoading(false);
  }, [user, store.isActive]);

  useEffect(() => { fetchToday(); }, [fetchToday]);

  const handleRepeatLast = async () => {
    if (!user) return;
    const supabase = createClient();

    // Get last completed session
    const { data: lastSession } = await supabase
      .from('workout_sessions')
      .select('id')
      .eq('user_id', user.id)
      .not('completed_at', 'is', null)
      .order('started_at', { ascending: false })
      .limit(1)
      .single();

    if (!lastSession) { alert('No previous workout found'); return; }

    // Get sets from that session
    const { data: sets } = await supabase
      .from('workout_sets')
      .select('exercise_id, set_number, weight, reps, rir, set_type, exercises(name)')
      .eq('workout_session_id', lastSession.id)
      .eq('is_completed', true)
      .order('set_number');

    if (!sets?.length) { alert('No sets found in previous workout'); return; }

    // Group by exercise
    const exerciseMap = new Map<string, { name: string; sets: any[] }>();
    for (const s of sets) {
      const key = s.exercise_id;
      if (!exerciseMap.has(key)) {
        exerciseMap.set(key, { name: (s.exercises as any)?.name || 'Unknown', sets: [] });
      }
      exerciseMap.get(key)!.sets.push(s);
    }

    const activeExercises: ActiveExercise[] = [...exerciseMap.entries()].map(([id, data], i) => ({
      exerciseId: id,
      exerciseName: data.name,
      orderIndex: i,
      targetSets: data.sets.length,
      targetRepsMin: 6,
      targetRepsMax: 12,
      targetRir: 2,
      targetWeight: data.sets[0]?.weight || null,
      restSeconds: 120,
      previousBest: data.sets[0] ? `${data.sets[0].weight}×${data.sets[0].reps}` : undefined,
      sets: data.sets.map((s: any, j: number) => ({
        setNumber: j + 1,
        setType: s.set_type || 'working',
        weight: s.weight,
        reps: null,
        rir: null,
        isCompleted: false,
        painFlag: false,
      })),
    }));

    try {
      await store.startWorkout({ exercises: activeExercises, userId: user.id });
    } catch (err: any) {
      alert('Failed to start: ' + (err.message || 'Unknown error'));
    }
  };

  const handleStart = async () => {
    if (!todayWorkout || !user) return;
    try {
      await store.startWorkout({
        exercises: todayWorkout.exercises,
        programId: todayWorkout.programId,
        programDayId: todayWorkout.dayId,
        userId: user.id,
      });
    } catch (err: any) {
      alert('Failed to start workout: ' + (err.message || 'Unknown error'));
    }
  };

  const handleCompleteSet = (exIdx: number, setIdx: number) => {
    store.completeSet(exIdx, setIdx);
    store.startRestTimer(store.exercises[exIdx].restSeconds);
  };

  const handleFinish = () => {
    const completedCount = store.exercises.reduce((c, e) => c + e.sets.filter((s) => s.isCompleted).length, 0);
    if (completedCount === 0) return;
    setShowFeedback(true);
  };

  const doFinish = async (feedback: WorkoutFeedback | null) => {
    if (!user) return;
    setShowFeedback(false);
    setFinishing(true);

    try {
      // Capture session ID before finishWorkout clears it
      const sessionId = store.sessionId;

      await store.finishWorkout({
        userId: user.id,
        overallFatigue: feedback?.difficulty,
      });

      // Save feedback
      if (feedback && sessionId) {
        const supabase = createClient();
        await supabase.from('workout_feedback').insert({
          workout_session_id: sessionId,
          perceived_difficulty: feedback.difficulty,
          overall_pump: feedback.pump,
          mood_after: feedback.mood,
        });
      }

      // Advance program
      if (todayWorkout) {
        const supabase = createClient();
        const { data: prog } = await supabase
          .from('programs')
          .select('days_per_week, num_weeks, current_week, current_day')
          .eq('id', todayWorkout.programId).single();

        if (prog) {
          let nextDay = prog.current_day + 1;
          let nextWeek = prog.current_week;
          if (nextDay > prog.days_per_week) { nextDay = 1; nextWeek++; }

          if (nextWeek > prog.num_weeks) {
            await supabase.from('programs')
              .update({ status: 'completed', completed_at: new Date().toISOString() })
              .eq('id', todayWorkout.programId);
          } else {
            await supabase.from('programs')
              .update({ current_day: nextDay, current_week: nextWeek })
              .eq('id', todayWorkout.programId);
          }
        }
      }
    } catch (err: any) {
      alert('Failed to save workout: ' + (err.message || 'Unknown error'));
      setFinishing(false);
      return;
    }

    setFinishing(false);
    router.push('/dashboard');
  };

  // Loading
  if (loading) {
    return (
      <div className="p-4 lg:p-6 max-w-2xl mx-auto space-y-4">
        <Skeleton className="h-8 w-48" />
        <Skeleton className="h-40 w-full" />
        <Skeleton className="h-40 w-full" />
      </div>
    );
  }

  // === ACTIVE WORKOUT ===
  if (store.isActive && store.exercises.length > 0) {
    const totalSets = store.exercises.reduce((c, e) => c + e.sets.length, 0);
    const completedSets = store.exercises.reduce((c, e) => c + e.sets.filter((s) => s.isCompleted).length, 0);
    return (
      <div className="max-w-2xl mx-auto pb-32">
        {/* Header */}
        <div className="sticky top-14 z-30 bg-background/95 backdrop-blur-sm border-b border-border px-4 py-3">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-lg font-bold">{todayWorkout?.dayLabel || 'Workout'}</h1>
              <p className="text-xs text-muted-foreground">
                {completedSets}/{totalSets} sets · Wk{todayWorkout?.weekNumber} · {elapsed}
              </p>
            </div>
            <Badge variant="secondary" className="tabular-nums text-sm">{elapsed}</Badge>
          </div>
          <Progress value={(completedSets / totalSets) * 100} className="h-1 mt-2" />
        </div>

        <div className="p-4 space-y-3">
          {/* All exercises */}
          {store.exercises.map((exercise, exIdx) => {
            const isExpanded = expandedExercise === exIdx;
            const exCompletedSets = exercise.sets.filter((s) => s.isCompleted).length;
            const currentSetIndex = exercise.sets.findIndex((s) => !s.isCompleted);
            const prevWeight = exercise.previousBest ? parseFloat(exercise.previousBest.split('×')[0]) : 0;
            const prevReps = exercise.previousBest ? parseInt(exercise.previousBest.split('×')[1]) : 0;

            return (
              <Card key={`${exercise.exerciseId}-${exIdx}`} className={cn(
                'transition-colors overflow-hidden',
                isExpanded && 'border-primary',
                exCompletedSets === exercise.sets.length && exCompletedSets > 0 && 'opacity-70'
              )}>
                {/* Exercise header — always visible */}
                <button
                  className="w-full px-4 py-3 flex items-center justify-between"
                  onClick={() => setExpandedExercise(isExpanded ? -1 : exIdx)}>
                  <div className="flex items-center gap-3 min-w-0">
                    <span className="text-sm font-bold text-primary w-5 shrink-0">{exIdx + 1}</span>
                    <div className="text-left min-w-0">
                      <p className="text-sm font-semibold truncate">{exercise.exerciseName}</p>
                      <p className="text-xs text-muted-foreground">
                        {exCompletedSets}/{exercise.sets.length} sets
                        {exercise.previousBest && ` · Prev: ${exercise.previousBest}`}
                      </p>
                    </div>
                  </div>
                  <div className="flex items-center gap-1 shrink-0">
                    {/* Reorder buttons */}
                    <button
                      className="p-1 text-muted-foreground hover:text-foreground disabled:opacity-30"
                      disabled={exIdx === 0}
                      onClick={(e) => { e.stopPropagation(); store.reorderExercise(exIdx, 'up'); setExpandedExercise(exIdx - 1); }}>
                      <ChevronLeft className="h-4 w-4 rotate-90" />
                    </button>
                    <button
                      className="p-1 text-muted-foreground hover:text-foreground disabled:opacity-30"
                      disabled={exIdx === store.exercises.length - 1}
                      onClick={(e) => { e.stopPropagation(); store.reorderExercise(exIdx, 'down'); setExpandedExercise(exIdx + 1); }}>
                      <ChevronRight className="h-4 w-4 rotate-90" />
                    </button>
                    {isExpanded
                      ? <ChevronLeft className="h-4 w-4 rotate-90 text-primary" />
                      : <ChevronRight className="h-4 w-4 -rotate-90 text-muted-foreground" />}
                  </div>
                </button>

                {/* Expanded: sets + controls */}
                {isExpanded && (
                  <div className="px-4 pb-4 space-y-2 border-t border-border pt-3">
                    <div className="flex items-center justify-between mb-2">
                      <p className="text-xs text-muted-foreground">
                        {exercise.targetSets} sets × {exercise.targetRepsMin}-{exercise.targetRepsMax} reps · RIR {exercise.targetRir}
                      </p>
                      <Button
                        variant="ghost" size="sm"
                        className="text-xs text-muted-foreground h-7"
                        onClick={() => { setSwapExerciseIdx(exIdx); setShowSwap(true); }}>
                        Swap
                      </Button>
                    </div>

                    {/* Warm-up generator */}
                    {exercise.sets.every((s) => s.setType !== 'warmup') && exercise.targetWeight && (
                      <Button
                        variant="ghost" size="sm" className="w-full mb-1 text-muted-foreground"
                        onClick={() => store.addWarmupSets(exIdx, exercise.targetWeight!)}>
                        + Add Warm-Up Ramp
                      </Button>
                    )}

                    {/* Sets */}
                    {exercise.sets.map((set, setIdx) => {
                      const isPR = set.isCompleted && set.setType === 'working' &&
                        (set.weight ?? 0) * (set.reps ?? 0) > prevWeight * prevReps && prevWeight > 0;

                      return (
                        <SetRow
                          key={setIdx}
                          set={set}
                          isCurrent={setIdx === currentSetIndex}
                          targetRepsMin={exercise.targetRepsMin}
                          targetRepsMax={exercise.targetRepsMax}
                          unit={unit}
                          previousBest={prevWeight > 0 ? { weight: prevWeight, reps: prevReps } : null}
                          isPR={isPR}
                          onUpdate={(data) => store.logSet(exIdx, setIdx, data)}
                          onComplete={() => handleCompleteSet(exIdx, setIdx)}
                          onUndo={set.isCompleted ? () => store.undoSet(exIdx, setIdx) : undefined}
                          onTogglePain={() => store.togglePainFlag(exIdx, setIdx)}
                        />
                      );
                    })}

                    <Button
                      variant="ghost" size="sm" className="w-full mt-1 text-muted-foreground"
                      onClick={() => store.addSet(exIdx)}>
                      + Add Set
                    </Button>
                  </div>
                )}
              </Card>
            );
          })}

          {/* Session notes */}
          <div className="pt-2">
            <label className="text-[10px] font-semibold uppercase tracking-wider text-muted-foreground mb-1 block">
              Session Notes (optional)
            </label>
            <textarea
              className="w-full h-16 px-3 py-2 rounded-lg bg-secondary border border-border text-sm resize-none focus:outline-none focus:ring-1 focus:ring-primary"
              placeholder="How did the session feel? Any observations..."
              value={store.sessionNotes}
              onChange={(e) => store.setSessionNotes(e.target.value)}
            />
          </div>

          {/* Finish */}
          <div className="pt-2 space-y-2">
            <Button className="w-full h-12 text-sm font-bold uppercase tracking-wider" onClick={handleFinish} disabled={finishing}>
              {finishing ? <><Loader2 className="h-4 w-4 mr-2 animate-spin" /> Saving...</> : 'Finish Workout'}
            </Button>
            <Button
              variant="ghost" className="w-full text-destructive"
              onClick={() => {
                if (confirm('Cancel workout? All progress will be lost.')) store.cancelWorkout();
              }}>
              Cancel Workout
            </Button>
          </div>
        </div>

        <RestTimer />

        <Dialog open={showFeedback} onOpenChange={setShowFeedback}>
          <DialogContent className="sm:max-w-md">
            <FeedbackSheet onSubmit={(fb) => doFinish(fb)} onSkip={() => doFinish(null)} />
          </DialogContent>
        </Dialog>

        <SubstitutionDialog
          open={showSwap}
          onOpenChange={setShowSwap}
          exerciseId={store.exercises[swapExerciseIdx]?.exerciseId || ''}
          exerciseName={store.exercises[swapExerciseIdx]?.exerciseName || ''}
          onSelect={(newId, newName) => {
            store.swapExercise(swapExerciseIdx, newId, newName);
          }}
        />
      </div>
    );
  }

  // === PREVIEW ===
  if (todayWorkout) {
    return (
      <div className="p-4 lg:p-6 max-w-2xl mx-auto space-y-6">
        <Card className="border-l-4 border-l-primary">
          <CardHeader className="pb-2">
            <p className="text-xs text-muted-foreground uppercase tracking-wider">
              {todayWorkout.programName} · Week {todayWorkout.weekNumber}
            </p>
            <CardTitle className="text-2xl">{todayWorkout.dayLabel}</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="flex gap-2 mb-4">
              <Badge>RIR {todayWorkout.targetRir}</Badge>
              <Badge variant="secondary">{todayWorkout.exercises.length} exercises</Badge>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-0 divide-y divide-border">
            {todayWorkout.exercises.map((ex, i) => (
              <div key={ex.exerciseId} className="flex items-center gap-3 px-4 py-3">
                <span className="text-sm font-bold text-primary w-6">{i + 1}</span>
                <div className="flex-1">
                  <p className="text-sm font-semibold">{ex.exerciseName}</p>
                  <p className="text-xs text-muted-foreground">
                    {ex.targetSets}×{ex.targetRepsMin}-{ex.targetRepsMax}
                    {ex.targetWeight ? ` · ${ex.targetWeight} ${unit}` : ''}
                    {ex.previousBest ? ` · Prev: ${ex.previousBest}` : ''}
                    {ex.targetWeight && ex.previousBest && (() => {
                      const prevW = parseFloat(ex.previousBest.split('×')[0]);
                      if (ex.targetWeight! > prevW) return <span className="text-green-400 ml-1">↑ +{(ex.targetWeight! - prevW).toFixed(1)}</span>;
                      if (ex.targetWeight! < prevW) return <span className="text-yellow-400 ml-1">↓ {(ex.targetWeight! - prevW).toFixed(1)}</span>;
                      return null;
                    })()}
                  </p>
                </div>
              </div>
            ))}
          </CardContent>
        </Card>

        <Button className="w-full h-14 text-base font-bold uppercase tracking-wider" onClick={handleStart}>
          <Play className="h-5 w-5 mr-2" /> Start Workout
        </Button>
      </div>
    );
  }

  // === NO PROGRAM ===
  return (
    <div className="p-4 lg:p-6 max-w-2xl mx-auto flex flex-col items-center justify-center py-20 text-center">
      <div className="h-16 w-16 rounded-full bg-primary/10 flex items-center justify-center mb-4">
        <Dumbbell className="h-8 w-8 text-primary" />
      </div>
      <h2 className="text-xl font-semibold mb-2">No Active Workout</h2>
      <p className="text-muted-foreground mb-6 max-w-sm">
        Activate a program to get your daily workout, or repeat a previous session.
      </p>
      <div className="flex flex-col gap-3 w-full max-w-xs">
        <Link href="/programs">
          <Button className="w-full">Go to Programs</Button>
        </Link>
        <Button variant="outline" className="w-full" onClick={handleRepeatLast}>
          Repeat Last Workout
        </Button>
      </div>
    </div>
  );
}
