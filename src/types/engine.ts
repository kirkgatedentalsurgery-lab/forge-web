export type OverloadAction = 'increase_weight' | 'maintain' | 'add_set' | 'reduce_weight';

export interface OverloadDecision {
  exerciseId: string;
  action: OverloadAction;
  newWeight?: number;
  newSets?: number;
  reason: string;
}

export interface VolumeStatus {
  muscleGroupId: string;
  muscleGroupName: string;
  currentWeeklySets: number;
  mev: number;
  mav: number;
  mrv: number;
  status: 'below_mev' | 'at_mev' | 'in_range' | 'at_mrv' | 'above_mrv';
}

export interface MesocycleConfig {
  numWeeks: number;
  hasDeload: boolean;
  startingRir: number;
  endingRir: number;
  volumeStartMultiplier: number;
  volumePeakMultiplier: number;
}

export interface GenerateProgramInput {
  splitType: import('./program').SplitType;
  daysPerWeek: number;
  numWeeks: number;
  hasDeload: boolean;
  availableEquipment: import('./exercise').EquipmentType[];
  experienceLevel: import('./exercise').Difficulty;
  userId: string;
  programName: string;
}

export interface ReadinessInput {
  sleepQuality: number;   // 1-5
  sleepHours?: number;
  stressLevel: number;    // 1-5
  energyLevel: number;    // 1-5
  sorenessLevel: number;  // 1-5
  motivation: number;     // 1-5
}

export interface ReadinessResult {
  score: number;          // 0-100
  band: import('./readiness').ReadinessBand;
  volumeMultiplier: number;
  restTimeAdjustment: number; // seconds to add
  summary: string;
}
