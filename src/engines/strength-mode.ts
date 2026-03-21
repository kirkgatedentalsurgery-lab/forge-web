/**
 * Strength Mode Engine
 *
 * Provides percentage-based loading for main lifts (squat, bench, deadlift, OHP).
 * Uses training max (90% of e1RM) as the basis for all calculations.
 */

export type StrengthPhase = 'accumulation' | 'intensification' | 'deload' | 'peaking';

export interface StrengthPrescription {
  sets: number;
  reps: number;
  percentageOfTM: number;
  weight: number; // calculated from training max
  rpe: number;
}

export function calculateTrainingMax(e1rm: number): number {
  return Math.round(e1rm * 0.9 * 100) / 100;
}

/**
 * Get the strength prescription for a given phase and week within that phase.
 */
export function getStrengthPrescription(
  trainingMax: number,
  phase: StrengthPhase,
  weekInPhase: number // 1-indexed
): StrengthPrescription[] {
  switch (phase) {
    case 'accumulation':
      return getAccumulationSets(trainingMax, weekInPhase);
    case 'intensification':
      return getIntensificationSets(trainingMax, weekInPhase);
    case 'deload':
      return getDeloadSets(trainingMax);
    case 'peaking':
      return getPeakingSets(trainingMax, weekInPhase);
  }
}

// Accumulation: 65-75% TM, 3-5 sets of 5-8 reps
function getAccumulationSets(tm: number, week: number): StrengthPrescription[] {
  const percentages = [
    [0.65, 0.65, 0.70, 0.70, 0.70], // week 1
    [0.67, 0.70, 0.72, 0.72, 0.72], // week 2
    [0.70, 0.72, 0.75, 0.75, 0.75], // week 3
  ];

  const weekPercentages = percentages[Math.min(week - 1, percentages.length - 1)];
  const reps = week === 1 ? 8 : week === 2 ? 6 : 5;

  return weekPercentages.map((pct) => ({
    sets: 1,
    reps,
    percentageOfTM: Math.round(pct * 100),
    weight: roundToNearest(tm * pct, 2.5),
    rpe: 6 + week * 0.5,
  }));
}

// Intensification: 80-90% TM, 3-5 sets of 2-5 reps
function getIntensificationSets(tm: number, week: number): StrengthPrescription[] {
  const configs = [
    { pcts: [0.78, 0.82, 0.85, 0.85], reps: 5 },      // week 1
    { pcts: [0.80, 0.85, 0.87, 0.87], reps: 3 },       // week 2
    { pcts: [0.82, 0.87, 0.90, 0.90], reps: 2 },       // week 3
  ];

  const config = configs[Math.min(week - 1, configs.length - 1)];

  return config.pcts.map((pct) => ({
    sets: 1,
    reps: config.reps,
    percentageOfTM: Math.round(pct * 100),
    weight: roundToNearest(tm * pct, 2.5),
    rpe: 7 + week * 0.5,
  }));
}

// Deload: 50-60% TM, 3x5
function getDeloadSets(tm: number): StrengthPrescription[] {
  return [0.50, 0.55, 0.60].map((pct) => ({
    sets: 1,
    reps: 5,
    percentageOfTM: Math.round(pct * 100),
    weight: roundToNearest(tm * pct, 2.5),
    rpe: 5,
  }));
}

// Peaking: 90-100% TM, singles/doubles
function getPeakingSets(tm: number, week: number): StrengthPrescription[] {
  const configs = [
    { pcts: [0.85, 0.90, 0.95], reps: 2 },     // week 1
    { pcts: [0.90, 0.95, 1.00], reps: 1 },      // week 2
  ];

  const config = configs[Math.min(week - 1, configs.length - 1)];

  return config.pcts.map((pct) => ({
    sets: 1,
    reps: config.reps,
    percentageOfTM: Math.round(pct * 100),
    weight: roundToNearest(tm * pct, 2.5),
    rpe: 8 + week,
  }));
}

function roundToNearest(value: number, increment: number): number {
  return Math.round(value / increment) * increment;
}

/**
 * Get the full block structure for a strength mesocycle.
 */
export function getStrengthBlockStructure(numWeeks: number): { week: number; phase: StrengthPhase; weekInPhase: number }[] {
  if (numWeeks <= 4) {
    return [
      { week: 1, phase: 'accumulation', weekInPhase: 1 },
      { week: 2, phase: 'accumulation', weekInPhase: 2 },
      { week: 3, phase: 'intensification', weekInPhase: 1 },
      { week: 4, phase: 'deload', weekInPhase: 1 },
    ];
  }

  // Standard 7-week block
  return [
    { week: 1, phase: 'accumulation', weekInPhase: 1 },
    { week: 2, phase: 'accumulation', weekInPhase: 2 },
    { week: 3, phase: 'accumulation', weekInPhase: 3 },
    { week: 4, phase: 'intensification', weekInPhase: 1 },
    { week: 5, phase: 'intensification', weekInPhase: 2 },
    { week: 6, phase: 'intensification', weekInPhase: 3 },
    { week: 7, phase: 'deload', weekInPhase: 1 },
  ];
}
