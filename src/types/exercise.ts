export type EquipmentType = 'barbell' | 'dumbbell' | 'cable' | 'machine' | 'bodyweight' | 'bands' | 'other';

export type MovementPattern =
  | 'horizontal_push'
  | 'horizontal_pull'
  | 'vertical_push'
  | 'vertical_pull'
  | 'hip_hinge'
  | 'squat'
  | 'lunge'
  | 'isolation'
  | 'carry'
  | 'rotation';

export type Difficulty = 'beginner' | 'intermediate' | 'advanced';

export type MuscleRole = 'primary' | 'secondary';

export interface MuscleGroup {
  id: string;
  name: string;
  displayName: string;
  bodyRegion: 'upper' | 'lower' | 'core';
  mev: number;
  mav: number;
  mrv: number;
}

export interface ExerciseMuscleGroup {
  muscleGroupId: string;
  muscleGroup?: MuscleGroup;
  role: MuscleRole;
  stimulusMagnitude: number;
}

export interface Exercise {
  id: string;
  name: string;
  equipment: EquipmentType;
  movementPattern: MovementPattern;
  difficulty: Difficulty;
  instructions?: string;
  isCompound: boolean;
  isSystem: boolean;
  createdBy?: string;
  muscleGroups: ExerciseMuscleGroup[];

  // Forge spec fields
  fatigueScore?: number;
  jointStress?: number;
  spineLoad?: number;
  skillScore?: number;
  hypertrophyScore?: number;
  strengthScore?: number;
  isUnilateral?: boolean;
}
