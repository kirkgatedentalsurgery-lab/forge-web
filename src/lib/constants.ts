// Default rest times in seconds
export const REST_TIMES = {
  compound: 180,
  accessory: 120,
  isolation: 90,
} as const;

// Time per set in minutes (execution + rest + transition)
export const TIME_PER_SET = {
  compound: 3.5,
  accessory: 2.5,
  isolation: 2.0,
} as const;

// Fixed overhead per session in minutes
export const SESSION_OVERHEAD = 10; // warm-up + cooldown + transitions

/**
 * Calculate maximum total sets for a given session duration.
 * Uses average time per set (~2.5 min) after subtracting overhead.
 */
export function calculateMaxSets(sessionMinutes: number): number {
  const availableMinutes = Math.max(0, sessionMinutes - SESSION_OVERHEAD);
  const avgTimePerSet = 2.5; // weighted average across set types
  return Math.floor(availableMinutes / avgTimePerSet);
}

/**
 * Calculate maximum exercises for a given session duration.
 */
export function calculateMaxExercises(sessionMinutes: number): number {
  const maxSets = calculateMaxSets(sessionMinutes);
  // Average ~3 sets per exercise
  return Math.max(2, Math.ceil(maxSets / 3));
}

// Session duration presets
export const SESSION_PRESETS = [
  { value: 30, label: '30 min', description: 'Quick session — 2-3 exercises' },
  { value: 45, label: '45 min', description: 'Standard — 3-4 exercises' },
  { value: 60, label: '60 min', description: 'Full session — 4-5 exercises' },
  { value: 90, label: '90 min', description: 'Extended — 6-8 exercises' },
] as const;

// Weight increments in lbs
export const WEIGHT_INCREMENTS = {
  compound: 5,
  isolation: 2.5,
  bigJump: 10,
} as const;

// RIR progression across a mesocycle
export const DEFAULT_MESOCYCLE = {
  numWeeks: 5,
  rirProgression: [3, 2, 1, 0, 4], // last week is deload
  volumeMultipliers: [1.0, 1.0, 1.1, 1.1, 0.5],
} as const;

// Rep ranges by exercise type
export const REP_RANGES = {
  compound: { min: 6, max: 10 },
  accessory: { min: 8, max: 12 },
  isolation: { min: 10, max: 15 },
} as const;

// Split type display info
export const SPLIT_INFO = {
  push_pull_legs: {
    name: 'Push / Pull / Legs',
    shortName: 'PPL',
    description: 'Train pushing muscles, pulling muscles, and legs on separate days',
    recommendedDays: [3, 6],
  },
  upper_lower: {
    name: 'Upper / Lower',
    shortName: 'U/L',
    description: 'Alternate between upper body and lower body training days',
    recommendedDays: [4, 5, 6],
  },
  full_body: {
    name: 'Full Body',
    shortName: 'FB',
    description: 'Train all major muscle groups each session',
    recommendedDays: [3, 4],
  },
  bro_split: {
    name: 'Bro Split',
    shortName: 'Bro',
    description: 'Dedicate each day to one or two muscle groups',
    recommendedDays: [5, 6],
  },
  arnold_split: {
    name: 'Arnold Split',
    shortName: 'Arnold',
    description: 'Chest/Back, Shoulders/Arms, Legs — high frequency',
    recommendedDays: [6],
  },
  custom: {
    name: 'Custom',
    shortName: 'Custom',
    description: 'Build your own split from scratch',
    recommendedDays: [3, 4, 5, 6, 7],
  },
} as const;

export const EQUIPMENT_LABELS: Record<string, string> = {
  barbell: 'Barbell',
  dumbbell: 'Dumbbell',
  cable: 'Cable',
  machine: 'Machine',
  bodyweight: 'Bodyweight',
  bands: 'Bands',
  other: 'Other',
};
