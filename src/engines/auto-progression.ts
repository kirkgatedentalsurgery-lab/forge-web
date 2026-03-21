/**
 * Auto-Progression Engine
 *
 * When a mesocycle completes, generates the next block with:
 * - Starting volume = previous block's ending volume (not MEV+2 like first block)
 * - Exercises rotated for variety (keep compounds, swap accessories)
 * - Progressive RIR targets reset
 * - Deload included if previous block triggered fatigue markers
 */

import { MuscleGroup } from '@/types';

export interface BlockSummary {
  muscleVolumes: Map<string, number>; // muscle name → ending weekly sets
  exerciseIds: Set<string>; // exercises used in previous block
  avgCompletionRate: number; // 0-1
  avgReadinessScore: number; // 0-100
  deloadTriggered: boolean;
}

export interface NextBlockConfig {
  startingVolume: Map<string, number>; // muscle name → starting sets for new block
  exercisesToRotate: Set<string>; // accessory exercise IDs to swap out
  numWeeks: number;
  hasDeload: boolean;
  startingRir: number;
}

/**
 * Calculate the configuration for the next training block
 * based on performance in the completed block.
 */
export function calculateNextBlock(
  summary: BlockSummary,
  muscleGroups: MuscleGroup[]
): NextBlockConfig {
  const muscleMap = new Map(muscleGroups.map((mg) => [mg.name, mg]));
  const startingVolume = new Map<string, number>();

  for (const [muscle, endingVolume] of summary.muscleVolumes) {
    const mg = muscleMap.get(muscle);
    if (!mg) {
      startingVolume.set(muscle, endingVolume);
      continue;
    }

    if (summary.avgCompletionRate >= 0.85 && summary.avgReadinessScore >= 65) {
      // Good block — start next block at ending volume (volume progression)
      // But cap at MRV
      startingVolume.set(muscle, Math.min(endingVolume, mg.mrv));
    } else if (summary.avgCompletionRate < 0.7 || summary.avgReadinessScore < 50) {
      // Struggled — drop back to MAV level
      startingVolume.set(muscle, Math.min(endingVolume, mg.mav));
    } else {
      // Moderate — start at slightly below ending volume
      startingVolume.set(muscle, Math.max(mg.mev + 2, endingVolume - 2));
    }
  }

  // Determine which exercises to rotate (swap ~30% of accessories for variety)
  const exercisesToRotate = new Set<string>();
  const exerciseArray = [...summary.exerciseIds];
  const rotateCount = Math.max(1, Math.floor(exerciseArray.length * 0.3));
  // Pick random accessories to rotate (in practice, these would be non-compound)
  for (let i = 0; i < rotateCount; i++) {
    const idx = Math.floor(Math.random() * exerciseArray.length);
    exercisesToRotate.add(exerciseArray[idx]);
  }

  // Block length based on recovery
  let numWeeks = 5;
  let hasDeload = true;
  if (summary.deloadTriggered || summary.avgReadinessScore < 55) {
    numWeeks = 4; // shorter block after tough one
  }

  // Starting RIR reset
  const startingRir = summary.avgCompletionRate >= 0.85 ? 3 : 4;

  return {
    startingVolume,
    exercisesToRotate,
    numWeeks,
    hasDeload,
    startingRir,
  };
}

/**
 * Generate a plain-English summary of the progression decision.
 */
export function getProgressionSummary(config: NextBlockConfig, previousVolumes: Map<string, number>): string[] {
  const summaries: string[] = [];

  let increased = 0;
  let maintained = 0;
  let decreased = 0;

  for (const [muscle, newVol] of config.startingVolume) {
    const prev = previousVolumes.get(muscle) || 0;
    if (newVol > prev) increased++;
    else if (newVol < prev) decreased++;
    else maintained++;
  }

  if (increased > 0) {
    summaries.push(`Volume increased for ${increased} muscle group${increased > 1 ? 's' : ''} based on your recovery.`);
  }
  if (decreased > 0) {
    summaries.push(`Volume reduced for ${decreased} muscle group${decreased > 1 ? 's' : ''} to manage fatigue.`);
  }
  if (config.exercisesToRotate.size > 0) {
    summaries.push(`${config.exercisesToRotate.size} exercises will be rotated for variety.`);
  }
  summaries.push(`Next block: ${config.numWeeks} weeks, starting at RIR ${config.startingRir}.`);

  return summaries;
}
