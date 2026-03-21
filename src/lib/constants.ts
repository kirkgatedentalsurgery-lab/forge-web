// Default rest times in seconds
export const REST_TIMES = {
  compound: 180,
  accessory: 120,
  isolation: 90,
} as const;

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
