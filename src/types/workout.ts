export type SetType = 'working' | 'warmup' | 'dropset' | 'amrap';

export interface WorkoutSession {
  id: string;
  userId: string;
  programId?: string;
  programDayId?: string;
  startedAt: string;
  completedAt?: string;
  durationSeconds?: number;
  notes?: string;
  overallFatigue?: number;
}

export interface WorkoutSet {
  id: string;
  workoutSessionId: string;
  exerciseId: string;
  setNumber: number;
  setType: SetType;
  weight?: number;
  reps?: number;
  rir?: number;
  rpe?: number;
  isCompleted: boolean;
  notes?: string;
  loggedAt: string;

  // Pain tracking fields
  painFlag?: boolean;
  painLocation?: string;
  painSeverity?: number;
}

export interface UserExerciseHistory {
  id: string;
  userId: string;
  exerciseId: string;
  estimated1rm?: number;
  lastWeight?: number;
  lastReps?: number;
  bestWeight?: number;
  bestRepsAtBestWeight?: number;
  totalSessions: number;
  lastPerformedAt?: string;
}

export interface ActiveExercise {
  exerciseId: string;
  exerciseName: string;
  orderIndex: number;
  targetSets: number;
  targetRepsMin: number;
  targetRepsMax: number;
  targetRir?: number;
  targetWeight?: number;
  restSeconds: number;
  sets: ActiveSet[];
}

export interface ActiveSet {
  setNumber: number;
  setType: SetType;
  weight?: number;
  reps?: number;
  rir?: number;
  isCompleted: boolean;
}
