import { create } from 'zustand';
import { createClient } from '@/lib/supabase/client';
import { calculateOverload } from '@/engines/progressive-overload';

export interface ActiveSet {
  setNumber: number;
  setType: 'working' | 'warmup';
  weight: number | null;
  reps: number | null;
  rir: number | null;
  isCompleted: boolean;
  painFlag: boolean;
}

export interface ActiveExercise {
  exerciseId: string;
  exerciseName: string;
  isCompound?: boolean;
  orderIndex: number;
  targetSets: number;
  targetRepsMin: number;
  targetRepsMax: number;
  targetRir: number | null;
  targetWeight: number | null;
  restSeconds: number;
  sets: ActiveSet[];
  previousBest?: string;
}

interface WorkoutState {
  sessionId: string | null;
  programId: string | null;
  programDayId: string | null;
  exercises: ActiveExercise[];
  currentExerciseIndex: number;
  startedAt: Date | null;
  isActive: boolean;
  sessionNotes: string;
  restTimer: { active: boolean; remaining: number; total: number; endTime: number };

  setSessionNotes: (notes: string) => void;

  startWorkout: (params: {
    exercises: ActiveExercise[];
    programId?: string;
    programDayId?: string;
    userId: string;
  }) => Promise<void>;

  logSet: (exerciseIndex: number, setIndex: number, data: Partial<ActiveSet>) => void;
  completeSet: (exerciseIndex: number, setIndex: number) => void;
  addSet: (exerciseIndex: number) => void;
  setCurrentExercise: (index: number) => void;
  togglePainFlag: (exerciseIndex: number, setIndex: number) => void;
  swapExercise: (exerciseIndex: number, newExerciseId: string, newExerciseName: string) => void;
  undoSet: (exerciseIndex: number, setIndex: number) => void;
  addWarmupSets: (exerciseIndex: number, workingWeight: number) => void;
  addExercise: (exerciseId: string, exerciseName: string, targetSets?: number) => void;
  reorderExercise: (fromIndex: number, direction: 'up' | 'down') => void;

  startRestTimer: (seconds: number) => void;
  tickRestTimer: () => void;
  stopRestTimer: () => void;

  finishWorkout: (params: {
    userId: string;
    overallFatigue?: number;
  }) => Promise<void>;

  cancelWorkout: () => void;
}

export const useWorkoutStore = create<WorkoutState>((set, get) => ({
  sessionId: null,
  programId: null,
  programDayId: null,
  exercises: [],
  currentExerciseIndex: 0,
  startedAt: null,
  isActive: false,
  sessionNotes: '',
  restTimer: { active: false, remaining: 0, total: 0, endTime: 0 },

  setSessionNotes: (notes) => set({ sessionNotes: notes }),

  startWorkout: async ({ exercises, programId, programDayId, userId }) => {
    const supabase = createClient();
    const { data, error } = await supabase
      .from('workout_sessions')
      .insert({
        user_id: userId,
        program_id: programId || null,
        program_day_id: programDayId || null,
        started_at: new Date().toISOString(),
      })
      .select()
      .single();

    if (error) throw error;

    const now = new Date();
    if (typeof window !== 'undefined') {
      localStorage.setItem('workout_startedAt', now.toISOString());
      localStorage.setItem('workout_sessionId', data.id);
    }
    set({
      sessionId: data.id,
      programId: programId || null,
      programDayId: programDayId || null,
      exercises,
      currentExerciseIndex: 0,
      startedAt: now,
      isActive: true,
    });
  },

  logSet: (exerciseIndex, setIndex, data) => {
    set((state) => {
      const exercises = [...state.exercises];
      const exercise = { ...exercises[exerciseIndex] };
      const sets = [...exercise.sets];
      sets[setIndex] = { ...sets[setIndex], ...data };
      exercise.sets = sets;
      exercises[exerciseIndex] = exercise;
      return { exercises };
    });
  },

  completeSet: (exerciseIndex, setIndex) => {
    set((state) => {
      const exercises = [...state.exercises];
      const exercise = { ...exercises[exerciseIndex] };
      const sets = [...exercise.sets];
      const completedSet = sets[setIndex];
      sets[setIndex] = { ...completedSet, isCompleted: true };

      // Auto-fill next set's weight, reps, and RIR if they're empty
      const nextIdx = setIndex + 1;
      if (nextIdx < sets.length && !sets[nextIdx].isCompleted) {
        const next = { ...sets[nextIdx] };
        if (next.weight === null && completedSet.weight !== null) next.weight = completedSet.weight;
        if (next.reps === null && completedSet.reps !== null) next.reps = completedSet.reps;
        if (next.rir === null && completedSet.rir !== null) next.rir = completedSet.rir;
        sets[nextIdx] = next;
      }

      exercise.sets = sets;
      exercises[exerciseIndex] = exercise;
      return { exercises };
    });
  },

  addSet: (exerciseIndex) => {
    set((state) => {
      const exercises = [...state.exercises];
      const exercise = { ...exercises[exerciseIndex] };
      const lastSet = exercise.sets[exercise.sets.length - 1];
      exercise.sets = [
        ...exercise.sets,
        {
          setNumber: exercise.sets.length + 1,
          setType: 'working',
          weight: lastSet?.weight ?? null,
          reps: lastSet?.isCompleted ? lastSet.reps : null,
          rir: lastSet?.isCompleted ? lastSet.rir : null,
          isCompleted: false,
          painFlag: false,
        },
      ];
      exercises[exerciseIndex] = exercise;
      return { exercises };
    });
  },

  setCurrentExercise: (index) => set({ currentExerciseIndex: index }),

  togglePainFlag: (exerciseIndex, setIndex) => {
    set((state) => {
      const exercises = [...state.exercises];
      const exercise = { ...exercises[exerciseIndex] };
      const sets = [...exercise.sets];
      sets[setIndex] = { ...sets[setIndex], painFlag: !sets[setIndex].painFlag };
      exercise.sets = sets;
      exercises[exerciseIndex] = exercise;
      return { exercises };
    });
  },

  addExercise: (exerciseId, exerciseName, targetSets = 3) => {
    set((state) => {
      const newExercise: ActiveExercise = {
        exerciseId,
        exerciseName,
        orderIndex: state.exercises.length,
        targetSets,
        targetRepsMin: 8,
        targetRepsMax: 12,
        targetRir: 2,
        targetWeight: null,
        restSeconds: 120,
        sets: Array.from({ length: targetSets }, (_, i) => ({
          setNumber: i + 1,
          setType: 'working' as const,
          weight: null,
          reps: null,
          rir: null,
          isCompleted: false,
          painFlag: false,
        })),
      };
      return { exercises: [...state.exercises, newExercise] };
    });
  },

  swapExercise: (exerciseIndex, newExerciseId, newExerciseName) => {
    set((state) => {
      const exercises = [...state.exercises];
      const exercise = { ...exercises[exerciseIndex] };
      // Reset sets (keep structure, clear completed data)
      exercise.exerciseId = newExerciseId;
      exercise.exerciseName = newExerciseName;
      exercise.previousBest = undefined;
      exercise.sets = exercise.sets.map((s) => ({
        ...s,
        weight: null,
        reps: null,
        rir: null,
        isCompleted: false,
        painFlag: false,
      }));
      exercises[exerciseIndex] = exercise;
      return { exercises };
    });
  },

  undoSet: (exerciseIndex, setIndex) => {
    set((state) => {
      const exercises = [...state.exercises];
      const exercise = { ...exercises[exerciseIndex] };
      const sets = [...exercise.sets];
      sets[setIndex] = { ...sets[setIndex], isCompleted: false };
      exercise.sets = sets;
      exercises[exerciseIndex] = exercise;
      return { exercises };
    });
  },

  addWarmupSets: (exerciseIndex, workingWeight) => {
    set((state) => {
      const exercises = [...state.exercises];
      const exercise = { ...exercises[exerciseIndex] };

      // Generate warm-up ramp: bar, 40%, 60%, 80% of working weight
      const warmups: ActiveSet[] = [];
      const bar = 45; // or 20 for kg
      const ramps = [0.4, 0.6, 0.8];

      // Bar only
      warmups.push({
        setNumber: 0,
        setType: 'warmup',
        weight: bar,
        reps: 10,
        rir: null,
        isCompleted: false,
        painFlag: false,
      });

      for (const pct of ramps) {
        const w = Math.round((workingWeight * pct) / 5) * 5;
        if (w <= bar) continue;
        warmups.push({
          setNumber: 0,
          setType: 'warmup',
          weight: w,
          reps: pct <= 0.5 ? 8 : pct <= 0.7 ? 5 : 3,
          rir: null,
          isCompleted: false,
          painFlag: false,
        });
      }

      // Renumber all sets
      const allSets = [...warmups, ...exercise.sets];
      allSets.forEach((s, i) => { s.setNumber = i + 1; });

      exercise.sets = allSets;
      exercises[exerciseIndex] = exercise;
      return { exercises };
    });
  },

  reorderExercise: (fromIndex, direction) => {
    set((state) => {
      const toIndex = direction === 'up' ? fromIndex - 1 : fromIndex + 1;
      if (toIndex < 0 || toIndex >= state.exercises.length) return state;
      const exercises = [...state.exercises];
      [exercises[fromIndex], exercises[toIndex]] = [exercises[toIndex], exercises[fromIndex]];
      // Update currentExerciseIndex if affected
      let newCurrent = state.currentExerciseIndex;
      if (state.currentExerciseIndex === fromIndex) newCurrent = toIndex;
      else if (state.currentExerciseIndex === toIndex) newCurrent = fromIndex;
      return { exercises, currentExerciseIndex: newCurrent };
    });
  },

  startRestTimer: (seconds) => {
    const endTime = Date.now() + seconds * 1000;
    set({ restTimer: { active: true, remaining: seconds, total: seconds, endTime } });
  },

  tickRestTimer: () => {
    set((state) => {
      const remaining = Math.max(0, Math.ceil((state.restTimer.endTime - Date.now()) / 1000));
      if (remaining <= 0) {
        return { restTimer: { ...state.restTimer, active: false, remaining: 0 } };
      }
      return { restTimer: { ...state.restTimer, remaining } };
    });
  },

  stopRestTimer: () => {
    set({ restTimer: { active: false, remaining: 0, total: 0, endTime: 0 } });
  },

  finishWorkout: async ({ userId, overallFatigue }) => {
    const state = get();
    if (!state.sessionId) return;

    const supabase = createClient();
    const completedAt = new Date();
    const durationSeconds = state.startedAt
      ? Math.floor((completedAt.getTime() - state.startedAt.getTime()) / 1000)
      : 0;

    // Batch insert all completed sets
    const setsToInsert = state.exercises.flatMap((exercise) =>
      exercise.sets
        .filter((s) => s.isCompleted)
        .map((s) => ({
          workout_session_id: state.sessionId!,
          exercise_id: exercise.exerciseId,
          set_number: s.setNumber,
          set_type: s.setType,
          weight: s.weight,
          reps: s.reps,
          rir: s.rir,
          rpe: s.rir != null ? 10 - s.rir : null,
          is_completed: true,
          pain_flag: s.painFlag,
        }))
    );

    if (setsToInsert.length > 0) {
      await supabase.from('workout_sets').insert(setsToInsert);
    }

    // Update session
    await supabase
      .from('workout_sessions')
      .update({
        completed_at: completedAt.toISOString(),
        duration_seconds: durationSeconds,
        overall_fatigue: overallFatigue || null,
        notes: state.sessionNotes || null,
      })
      .eq('id', state.sessionId);

    // Update exercise history + e1RM
    for (const exercise of state.exercises) {
      const completedSets = exercise.sets.filter((s) => s.isCompleted && s.weight && s.reps);
      if (completedSets.length === 0) continue;

      const bestSet = completedSets.reduce((best, s) =>
        (s.weight || 0) > (best.weight || 0) ? s : best
      );

      const e1rm =
        bestSet.weight && bestSet.reps
          ? bestSet.reps === 1
            ? bestSet.weight
            : Math.round(bestSet.weight * (1 + bestSet.reps / 30) * 100) / 100
          : null;

      await supabase.from('user_exercise_history').upsert(
        {
          user_id: userId,
          exercise_id: exercise.exerciseId,
          last_weight: bestSet.weight,
          last_reps: bestSet.reps,
          estimated_1rm: e1rm,
          best_weight: bestSet.weight,
          best_reps_at_best_weight: bestSet.reps,
          last_performed_at: completedAt.toISOString(),
          updated_at: completedAt.toISOString(),
        },
        { onConflict: 'user_id,exercise_id' }
      );

      // Record e1RM history
      if (e1rm) {
        await supabase.from('e1rm_history').insert({
          user_id: userId,
          exercise_id: exercise.exerciseId,
          e1rm,
          source: 'calculated',
        });
      }

      // Progressive overload: calculate next session's weight (non-blocking)
      try {
        const workingSets = completedSets.filter((s) => s.setType === 'working' && s.weight && s.reps);
        if (workingSets.length > 0 && state.programDayId) {
          const decision = calculateOverload({
            exerciseId: exercise.exerciseId,
            exerciseName: exercise.exerciseName,
            isCompound: exercise.isCompound ?? true,
            completedSets: workingSets.map((s) => ({
              weight: s.weight!, reps: s.reps!, rir: s.rir ?? 2,
            })),
            targetRepsMin: exercise.targetRepsMin,
            targetRepsMax: exercise.targetRepsMax,
            targetRir: exercise.targetRir ?? 2,
            currentWeight: workingSets[0].weight!,
          });

          if (decision.newWeight) {
            await supabase.from('program_exercises')
              .update({ target_weight: decision.newWeight })
              .eq('exercise_id', exercise.exerciseId)
              .eq('program_day_id', state.programDayId);
          }
        }
      } catch (e) {
        console.error('Overload calculation failed for', exercise.exerciseName, e);
      }
    }

    // Reset
    if (typeof window !== 'undefined') {
      localStorage.removeItem('workout_startedAt');
      localStorage.removeItem('workout_sessionId');
    }
    set({
      sessionId: null, programId: null, programDayId: null,
      exercises: [], currentExerciseIndex: 0, startedAt: null, isActive: false,
      sessionNotes: '', restTimer: { active: false, remaining: 0, total: 0, endTime: 0 },
    });
  },

  cancelWorkout: () => {
    const state = get();
    if (state.sessionId) {
      const supabase = createClient();
      supabase.from('workout_sessions').delete().eq('id', state.sessionId);
    }
    if (typeof window !== 'undefined') {
      localStorage.removeItem('workout_startedAt');
      localStorage.removeItem('workout_sessionId');
    }
    set({
      sessionId: null, programId: null, programDayId: null,
      exercises: [], currentExerciseIndex: 0, startedAt: null, isActive: false,
      sessionNotes: '', restTimer: { active: false, remaining: 0, total: 0, endTime: 0 },
    });
  },
}));
