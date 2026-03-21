import {
  OverloadDecision,
  VolumeStatus,
  MuscleGroup,
} from '@/types';
import { WEIGHT_INCREMENTS } from '@/lib/constants';

interface ExercisePerformance {
  exerciseId: string;
  exerciseName: string;
  isCompound: boolean;
  completedSets: { weight: number; reps: number; rir: number }[];
  targetRepsMin: number;
  targetRepsMax: number;
  targetRir: number;
  currentWeight: number;
}

/**
 * Calculate progressive overload decisions after a completed workout.
 * Returns adjustment recommendations for each exercise.
 */
export function calculateOverload(
  performance: ExercisePerformance
): OverloadDecision {
  const { completedSets, targetRepsMax, targetRepsMin, targetRir, isCompound } =
    performance;

  if (completedSets.length === 0) {
    return {
      exerciseId: performance.exerciseId,
      action: 'maintain',
      reason: 'No sets completed',
    };
  }

  const avgReps = average(completedSets.map((s) => s.reps));
  const avgRir = average(completedSets.map((s) => s.rir));
  const currentWeight = completedSets[0].weight;
  const increment = isCompound
    ? WEIGHT_INCREMENTS.compound
    : WEIGHT_INCREMENTS.isolation;

  // Rule 1: User hit top of rep range at target RIR -> increase weight
  if (avgReps >= targetRepsMax && avgRir <= targetRir + 0.5) {
    return {
      exerciseId: performance.exerciseId,
      action: 'increase_weight',
      newWeight: currentWeight + increment,
      reason: `Hit ${Math.round(avgReps)} reps at RIR ${avgRir.toFixed(1)}. Adding ${increment} lbs.`,
    };
  }

  // Rule 2: RIR much higher than target -> weight too light, bigger jump
  if (avgRir > targetRir + 2) {
    const bigIncrement = isCompound
      ? WEIGHT_INCREMENTS.bigJump
      : WEIGHT_INCREMENTS.compound;
    return {
      exerciseId: performance.exerciseId,
      action: 'increase_weight',
      newWeight: currentWeight + bigIncrement,
      reason: `RIR ${avgRir.toFixed(1)} well above target ${targetRir}. Adding ${bigIncrement} lbs.`,
    };
  }

  // Rule 3: Reps fell below minimum at low RIR -> too heavy
  if (avgReps < targetRepsMin && avgRir <= 1) {
    return {
      exerciseId: performance.exerciseId,
      action: 'reduce_weight',
      newWeight: Math.round(currentWeight * 0.9 * 4) / 4, // Round to nearest 0.25
      reason: `Could not hit ${targetRepsMin} reps. Reducing weight 10%.`,
    };
  }

  // Default: maintain
  return {
    exerciseId: performance.exerciseId,
    action: 'maintain',
    reason: 'On track. Maintain current load.',
  };
}

/**
 * Calculate weekly volume status for each muscle group.
 * Compares current training volume against MEV/MAV/MRV landmarks.
 */
export function calculateVolumeStatus(
  weeklySetsByMuscle: Map<string, number>,
  muscleGroups: MuscleGroup[]
): VolumeStatus[] {
  return muscleGroups.map((mg) => {
    const currentSets = weeklySetsByMuscle.get(mg.name) || 0;

    let status: VolumeStatus['status'];
    if (currentSets < mg.mev) {
      status = 'below_mev';
    } else if (currentSets === mg.mev) {
      status = 'at_mev';
    } else if (currentSets > mg.mrv) {
      status = 'above_mrv';
    } else if (currentSets >= mg.mrv) {
      status = 'at_mrv';
    } else {
      status = 'in_range';
    }

    return {
      muscleGroupId: mg.id,
      muscleGroupName: mg.displayName,
      currentWeeklySets: currentSets,
      mev: mg.mev,
      mav: mg.mav,
      mrv: mg.mrv,
      status,
    };
  });
}

/**
 * Determine if weekly volume should increase for the next week.
 */
export function shouldIncreaseVolume(
  currentSets: number,
  mrv: number,
  avgCompletionRate: number,
  avgRirDelta: number // actual RIR - target RIR
): { newSets: number; reason: string } {
  // Don't exceed MRV
  if (currentSets >= mrv) {
    return { newSets: currentSets, reason: 'At MRV ceiling' };
  }

  // Completing sets well and RIR on target -> add volume
  if (avgCompletionRate >= 0.9 && avgRirDelta >= -0.5 && avgRirDelta <= 1) {
    return {
      newSets: currentSets + 1,
      reason: 'Good performance. Adding 1 set.',
    };
  }

  // Struggling (low completion or RIR way too low) -> hold or reduce
  if (avgCompletionRate < 0.75 || avgRirDelta < -1) {
    return {
      newSets: Math.max(currentSets - 1, 2),
      reason: 'Struggling to recover. Reducing 1 set.',
    };
  }

  return { newSets: currentSets, reason: 'Maintaining current volume.' };
}

/**
 * Estimate 1RM using the Epley formula.
 */
export function estimate1RM(weight: number, reps: number): number {
  if (reps <= 0) return 0;
  if (reps === 1) return weight;
  return Math.round(weight * (1 + reps / 30) * 100) / 100;
}

// Utility
function average(nums: number[]): number {
  if (nums.length === 0) return 0;
  return nums.reduce((sum, n) => sum + n, 0) / nums.length;
}
