import { ReadinessBand } from '@/types/readiness';
import { ReadinessInput, ReadinessResult } from '@/types/engine';

/**
 * Calculate a readiness score (0-100) from subjective inputs.
 *
 * Weights:
 *   sleep quality  30%
 *   energy level   25%
 *   soreness       20% (inverted: high soreness = low readiness)
 *   stress         15% (inverted: high stress = low readiness)
 *   motivation     10%
 *
 * Each input is 1-5. We normalize to 0-100, invert where needed,
 * then compute the weighted average.
 */
export function calculateReadinessScore(input: ReadinessInput): number {
  const normalize = (value: number) => ((value - 1) / 4) * 100;
  const invert = (value: number) => ((5 - value) / 4) * 100;

  const weighted =
    normalize(input.sleepQuality) * 0.3 +
    normalize(input.energyLevel) * 0.25 +
    invert(input.sorenessLevel) * 0.2 +
    invert(input.stressLevel) * 0.15 +
    normalize(input.motivation) * 0.1;

  return Math.round(Math.min(100, Math.max(0, weighted)));
}

/**
 * Map a readiness score to a training band.
 *   push:         >= 85
 *   normal:       >= 70
 *   conservative: >= 55
 *   recovery:     < 55
 */
export function getReadinessBand(score: number): ReadinessBand {
  if (score >= 85) return 'push';
  if (score >= 70) return 'normal';
  if (score >= 55) return 'conservative';
  return 'recovery';
}

/**
 * Return a volume multiplier based on readiness band.
 *   push:         1.1  (10% more volume)
 *   normal:       1.0
 *   conservative: 0.8  (20% less volume)
 *   recovery:     0.5  (50% less volume)
 */
export function getVolumeAdjustment(band: ReadinessBand): number {
  switch (band) {
    case 'push':
      return 1.1;
    case 'normal':
      return 1.0;
    case 'conservative':
      return 0.8;
    case 'recovery':
      return 0.5;
  }
}

/**
 * Return additional rest time (in seconds) based on readiness band.
 *   push:         0   (no extra rest)
 *   normal:       0
 *   conservative: 30  (30s extra)
 *   recovery:     60  (60s extra)
 */
export function getRestTimeAdjustment(band: ReadinessBand): number {
  switch (band) {
    case 'push':
      return 0;
    case 'normal':
      return 0;
    case 'conservative':
      return 30;
    case 'recovery':
      return 60;
  }
}

/**
 * Convenience: compute the full readiness result from raw inputs.
 */
export function evaluateReadiness(input: ReadinessInput): ReadinessResult {
  const score = calculateReadinessScore(input);
  const band = getReadinessBand(score);
  const volumeMultiplier = getVolumeAdjustment(band);
  const restTimeAdjustment = getRestTimeAdjustment(band);

  const summaries: Record<ReadinessBand, string> = {
    push: 'Feeling great — push the intensity today.',
    normal: 'Ready for a standard training session.',
    conservative: 'Below baseline — reduce volume and take it easier.',
    recovery: 'Significantly fatigued — light session or active recovery recommended.',
  };

  return {
    score,
    band,
    volumeMultiplier,
    restTimeAdjustment,
    summary: summaries[band],
  };
}
