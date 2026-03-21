import { create } from 'zustand';
import { createClient } from '@/lib/supabase/client';

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
  restTimer: { active: boolean; remaining: number; total: number };

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
  restTimer: { active: false, remaining: 0, total: 0 },

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

    set({
      sessionId: data.id,
      programId: programId || null,
      programDayId: programDayId || null,
      exercises,
      currentExerciseIndex: 0,
      startedAt: new Date(),
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
      sets[setIndex] = { ...sets[setIndex], isCompleted: true };
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
          reps: null,
          rir: null,
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

  startRestTimer: (seconds) => {
    set({ restTimer: { active: true, remaining: seconds, total: seconds } });
  },

  tickRestTimer: () => {
    set((state) => {
      const remaining = state.restTimer.remaining - 1;
      if (remaining <= 0) {
        return { restTimer: { ...state.restTimer, active: false, remaining: 0 } };
      }
      return { restTimer: { ...state.restTimer, remaining } };
    });
  },

  stopRestTimer: () => {
    set({ restTimer: { active: false, remaining: 0, total: 0 } });
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
    }

    // Reset
    set({
      sessionId: null, programId: null, programDayId: null,
      exercises: [], currentExerciseIndex: 0, startedAt: null, isActive: false,
      sessionNotes: '', restTimer: { active: false, remaining: 0, total: 0 },
    });
  },

  cancelWorkout: () => {
    const state = get();
    if (state.sessionId) {
      const supabase = createClient();
      supabase.from('workout_sessions').delete().eq('id', state.sessionId);
    }
    set({
      sessionId: null, programId: null, programDayId: null,
      exercises: [], currentExerciseIndex: 0, startedAt: null, isActive: false,
      sessionNotes: '', restTimer: { active: false, remaining: 0, total: 0 },
    });
  },
}));
