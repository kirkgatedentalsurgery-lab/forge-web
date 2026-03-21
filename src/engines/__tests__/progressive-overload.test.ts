import { describe, it, expect } from 'vitest';
import {
  calculateOverload,
  calculateVolumeStatus,
  shouldIncreaseVolume,
  estimate1RM,
} from '../progressive-overload';

describe('calculateOverload', () => {
  const basePerformance = {
    exerciseId: 'bench-press',
    exerciseName: 'Bench Press',
    isCompound: true,
    targetRepsMin: 6,
    targetRepsMax: 10,
    targetRir: 2,
    currentWeight: 185,
  };

  it('returns maintain when no sets are completed', () => {
    const result = calculateOverload({
      ...basePerformance,
      completedSets: [],
    });
    expect(result.action).toBe('maintain');
    expect(result.reason).toContain('No sets completed');
  });

  it('increases weight by 5 lbs (compound) when hitting top of rep range at target RIR', () => {
    const result = calculateOverload({
      ...basePerformance,
      completedSets: [
        { weight: 185, reps: 10, rir: 2 },
        { weight: 185, reps: 10, rir: 2 },
        { weight: 185, reps: 10, rir: 2 },
      ],
    });
    expect(result.action).toBe('increase_weight');
    expect(result.newWeight).toBe(190);
  });

  it('increases weight by 2.5 lbs for isolation exercises when hitting top of rep range', () => {
    const result = calculateOverload({
      ...basePerformance,
      isCompound: false,
      completedSets: [
        { weight: 30, reps: 10, rir: 2 },
        { weight: 30, reps: 10, rir: 2 },
      ],
    });
    expect(result.action).toBe('increase_weight');
    expect(result.newWeight).toBe(32.5);
  });

  it('makes a bigger jump (10 lbs compound) when RIR is way above target', () => {
    const result = calculateOverload({
      ...basePerformance,
      completedSets: [
        { weight: 185, reps: 8, rir: 5 },
        { weight: 185, reps: 8, rir: 5 },
      ],
    });
    expect(result.action).toBe('increase_weight');
    expect(result.newWeight).toBe(195); // 185 + 10
    expect(result.reason).toContain('well above target');
  });

  it('makes a 5 lb jump for isolation when RIR is way above target', () => {
    const result = calculateOverload({
      ...basePerformance,
      isCompound: false,
      completedSets: [
        { weight: 30, reps: 8, rir: 5 },
        { weight: 30, reps: 8, rir: 5 },
      ],
    });
    expect(result.action).toBe('increase_weight');
    expect(result.newWeight).toBe(35); // 30 + 5 (compound increment for isolation big jump)
  });

  it('reduces weight by 10% when reps fall below minimum at low RIR', () => {
    const result = calculateOverload({
      ...basePerformance,
      completedSets: [
        { weight: 200, reps: 4, rir: 0 },
        { weight: 200, reps: 5, rir: 1 },
        { weight: 200, reps: 4, rir: 1 },
      ],
    });
    expect(result.action).toBe('reduce_weight');
    // avgReps ~4.33 < 6 (targetRepsMin), avgRir ~0.67 <= 1
    expect(result.newWeight).toBeLessThan(200);
  });

  it('maintains weight when performance is in acceptable range', () => {
    const result = calculateOverload({
      ...basePerformance,
      completedSets: [
        { weight: 185, reps: 8, rir: 2 },
        { weight: 185, reps: 8, rir: 2 },
        { weight: 185, reps: 7, rir: 2 },
      ],
    });
    expect(result.action).toBe('maintain');
    expect(result.reason).toContain('On track');
  });

  it('allows weight increase when RIR is at target + 0.5 boundary', () => {
    const result = calculateOverload({
      ...basePerformance,
      targetRir: 2,
      completedSets: [
        { weight: 185, reps: 10, rir: 2.5 },
        { weight: 185, reps: 10, rir: 2.5 },
      ],
    });
    expect(result.action).toBe('increase_weight');
  });
});

describe('calculateVolumeStatus', () => {
  const muscleGroups = [
    { id: 'chest-1', name: 'chest', displayName: 'Chest', mev: 10, mav: 16, mrv: 22 },
    { id: 'back-1', name: 'back', displayName: 'Back', mev: 12, mav: 18, mrv: 25 },
  ];

  it('reports below_mev when sets are under minimum effective volume', () => {
    const weekly = new Map([['chest', 8], ['back', 10]]);
    const result = calculateVolumeStatus(weekly, muscleGroups);
    expect(result[0].status).toBe('below_mev');
    expect(result[1].status).toBe('below_mev');
  });

  it('reports at_mev when sets exactly equal MEV', () => {
    const weekly = new Map([['chest', 10]]);
    const result = calculateVolumeStatus(weekly, muscleGroups);
    expect(result[0].status).toBe('at_mev');
  });

  it('reports in_range when sets are between MEV and MRV', () => {
    const weekly = new Map([['chest', 16]]);
    const result = calculateVolumeStatus(weekly, muscleGroups);
    expect(result[0].status).toBe('in_range');
  });

  it('reports above_mrv when sets exceed MRV', () => {
    const weekly = new Map([['chest', 25]]);
    const result = calculateVolumeStatus(weekly, muscleGroups);
    expect(result[0].status).toBe('above_mrv');
  });

  it('defaults to 0 sets when muscle is not in the map', () => {
    const weekly = new Map<string, number>();
    const result = calculateVolumeStatus(weekly, muscleGroups);
    expect(result[0].currentWeeklySets).toBe(0);
    expect(result[0].status).toBe('below_mev');
  });
});

describe('shouldIncreaseVolume', () => {
  it('adds a set when completion is high and RIR delta is on target', () => {
    const result = shouldIncreaseVolume(14, 22, 0.95, 0.5);
    expect(result.newSets).toBe(15);
    expect(result.reason).toContain('Adding 1 set');
  });

  it('caps volume at MRV', () => {
    const result = shouldIncreaseVolume(22, 22, 0.95, 0.5);
    expect(result.newSets).toBe(22);
    expect(result.reason).toContain('MRV');
  });

  it('reduces a set when completion rate is below 75%', () => {
    const result = shouldIncreaseVolume(14, 22, 0.6, 0);
    expect(result.newSets).toBe(13);
    expect(result.reason).toContain('Reducing');
  });

  it('reduces a set when RIR delta is below -1', () => {
    const result = shouldIncreaseVolume(14, 22, 0.9, -1.5);
    expect(result.newSets).toBe(13);
    expect(result.reason).toContain('Reducing');
  });

  it('does not reduce below 2 sets', () => {
    const result = shouldIncreaseVolume(2, 22, 0.5, -2);
    expect(result.newSets).toBe(2);
  });

  it('maintains volume when performance is borderline', () => {
    const result = shouldIncreaseVolume(14, 22, 0.85, 0);
    expect(result.newSets).toBe(14);
    expect(result.reason).toContain('Maintaining');
  });
});

describe('estimate1RM', () => {
  it('returns the weight itself when reps is 1', () => {
    expect(estimate1RM(225, 1)).toBe(225);
  });

  it('returns 0 when reps is 0', () => {
    expect(estimate1RM(225, 0)).toBe(0);
  });

  it('returns 0 when reps is negative', () => {
    expect(estimate1RM(225, -1)).toBe(0);
  });

  it('calculates e1RM using Epley formula for multiple reps', () => {
    // Epley: weight * (1 + reps/30)
    // 200 * (1 + 5/30) = 200 * 1.1667 = 233.33
    const result = estimate1RM(200, 5);
    expect(result).toBeCloseTo(233.33, 1);
  });

  it('returns a higher e1RM for more reps at same weight', () => {
    expect(estimate1RM(200, 10)).toBeGreaterThan(estimate1RM(200, 5));
  });
});
