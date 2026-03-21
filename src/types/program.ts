export type SplitType =
  | 'push_pull_legs'
  | 'upper_lower'
  | 'full_body'
  | 'bro_split'
  | 'arnold_split'
  | 'custom';

export type ProgramStatus = 'active' | 'completed' | 'paused' | 'draft';

export interface Program {
  id: string;
  userId: string;
  name: string;
  splitType: SplitType;
  daysPerWeek: number;
  numWeeks: number;
  hasDeload: boolean;
  status: ProgramStatus;
  currentWeek: number;
  currentDay: number;
  startedAt?: string;
  completedAt?: string;
  createdAt: string;
  weeks?: ProgramWeek[];
}

export interface ProgramWeek {
  id: string;
  programId: string;
  weekNumber: number;
  isDeload: boolean;
  targetRir: number;
  volumeMultiplier: number;
  days?: ProgramDay[];
}

export interface ProgramDay {
  id: string;
  programWeekId: string;
  dayNumber: number;
  dayLabel: string;
  targetMuscleGroups: string[];
  exercises?: ProgramExercise[];
}

export interface ProgramExercise {
  id: string;
  programDayId: string;
  exerciseId: string;
  exercise?: import('./exercise').Exercise;
  orderIndex: number;
  targetSets: number;
  targetRepsMin: number;
  targetRepsMax: number;
  targetRir?: number;
  targetWeight?: number;
  restSeconds: number;
  notes?: string;
}

export interface DayTemplate {
  label: string;
  muscles: string[];
}

export interface SplitTemplate {
  name: string;
  description: string;
  templates: DayTemplate[];
  recommendedDays: number[];
}
