import { describe, it, expect } from 'vitest';
import {
  calculateReadinessScore,
  getReadinessBand,
  getVolumeAdjustment,
  getRestTimeAdjustment,
  evaluateReadiness,
} from '../readiness-engine';

describe('calculateReadinessScore', () => {
  it('returns a high score when all inputs are 5', () => {
    const score = calculateReadinessScore({
      sleepQuality: 5,
      energyLevel: 5,
      sorenessLevel: 1, // low soreness = high readiness
      stressLevel: 1, // low stress = high readiness
      motivation: 5,
    });
    expect(score).toBe(100);
  });

  it('returns a low score when all inputs are worst-case', () => {
    const score = calculateReadinessScore({
      sleepQuality: 1,
      energyLevel: 1,
      sorenessLevel: 5,
      stressLevel: 5,
      motivation: 1,
    });
    expect(score).toBe(0);
  });

  it('applies correct weights (sleep 30%, energy 25%, soreness 20%, stress 15%, motivation 10%)', () => {
    // Only sleep at max, everything else at worst
    const sleepOnly = calculateReadinessScore({
      sleepQuality: 5,
      energyLevel: 1,
      sorenessLevel: 5,
      stressLevel: 5,
      motivation: 1,
    });
    expect(sleepOnly).toBe(30); // 100 * 0.3 = 30

    // Only energy at max, everything else at worst
    const energyOnly = calculateReadinessScore({
      sleepQuality: 1,
      energyLevel: 5,
      sorenessLevel: 5,
      stressLevel: 5,
      motivation: 1,
    });
    expect(energyOnly).toBe(25); // 100 * 0.25 = 25
  });

  it('inverts soreness correctly (high soreness = low contribution)', () => {
    const lowSoreness = calculateReadinessScore({
      sleepQuality: 3,
      energyLevel: 3,
      sorenessLevel: 1,
      stressLevel: 3,
      motivation: 3,
    });
    const highSoreness = calculateReadinessScore({
      sleepQuality: 3,
      energyLevel: 3,
      sorenessLevel: 5,
      stressLevel: 3,
      motivation: 3,
    });
    expect(lowSoreness).toBeGreaterThan(highSoreness);
  });

  it('inverts stress correctly (high stress = low contribution)', () => {
    const lowStress = calculateReadinessScore({
      sleepQuality: 3,
      energyLevel: 3,
      sorenessLevel: 3,
      stressLevel: 1,
      motivation: 3,
    });
    const highStress = calculateReadinessScore({
      sleepQuality: 3,
      energyLevel: 3,
      sorenessLevel: 3,
      stressLevel: 5,
      motivation: 3,
    });
    expect(lowStress).toBeGreaterThan(highStress);
  });

  it('clamps result between 0 and 100', () => {
    const score = calculateReadinessScore({
      sleepQuality: 5,
      energyLevel: 5,
      sorenessLevel: 1,
      stressLevel: 1,
      motivation: 5,
    });
    expect(score).toBeLessThanOrEqual(100);
    expect(score).toBeGreaterThanOrEqual(0);
  });

  it('returns a mid-range score for all 3s', () => {
    const score = calculateReadinessScore({
      sleepQuality: 3,
      energyLevel: 3,
      sorenessLevel: 3,
      stressLevel: 3,
      motivation: 3,
    });
    // normalize(3) = (3-1)/4 * 100 = 50, invert(3) = (5-3)/4 * 100 = 50
    // 50*0.3 + 50*0.25 + 50*0.2 + 50*0.15 + 50*0.1 = 50
    expect(score).toBe(50);
  });
});

describe('getReadinessBand', () => {
  it('returns push for score >= 85', () => {
    expect(getReadinessBand(85)).toBe('push');
    expect(getReadinessBand(100)).toBe('push');
  });

  it('returns normal for score >= 70 and < 85', () => {
    expect(getReadinessBand(70)).toBe('normal');
    expect(getReadinessBand(84)).toBe('normal');
  });

  it('returns conservative for score >= 55 and < 70', () => {
    expect(getReadinessBand(55)).toBe('conservative');
    expect(getReadinessBand(69)).toBe('conservative');
  });

  it('returns recovery for score < 55', () => {
    expect(getReadinessBand(54)).toBe('recovery');
    expect(getReadinessBand(0)).toBe('recovery');
  });
});

describe('getVolumeAdjustment', () => {
  it('returns 1.1 for push band', () => {
    expect(getVolumeAdjustment('push')).toBe(1.1);
  });

  it('returns 1.0 for normal band', () => {
    expect(getVolumeAdjustment('normal')).toBe(1.0);
  });

  it('returns 0.8 for conservative band', () => {
    expect(getVolumeAdjustment('conservative')).toBe(0.8);
  });

  it('returns 0.5 for recovery band', () => {
    expect(getVolumeAdjustment('recovery')).toBe(0.5);
  });
});

describe('getRestTimeAdjustment', () => {
  it('returns 0 for push band', () => {
    expect(getRestTimeAdjustment('push')).toBe(0);
  });

  it('returns 0 for normal band', () => {
    expect(getRestTimeAdjustment('normal')).toBe(0);
  });

  it('returns 30 for conservative band', () => {
    expect(getRestTimeAdjustment('conservative')).toBe(30);
  });

  it('returns 60 for recovery band', () => {
    expect(getRestTimeAdjustment('recovery')).toBe(60);
  });
});

describe('evaluateReadiness', () => {
  it('returns a complete result object with all fields', () => {
    const result = evaluateReadiness({
      sleepQuality: 5,
      energyLevel: 5,
      sorenessLevel: 1,
      stressLevel: 1,
      motivation: 5,
    });

    expect(result).toHaveProperty('score');
    expect(result).toHaveProperty('band');
    expect(result).toHaveProperty('volumeMultiplier');
    expect(result).toHaveProperty('restTimeAdjustment');
    expect(result).toHaveProperty('summary');
  });

  it('returns push band with correct summary for perfect inputs', () => {
    const result = evaluateReadiness({
      sleepQuality: 5,
      energyLevel: 5,
      sorenessLevel: 1,
      stressLevel: 1,
      motivation: 5,
    });

    expect(result.score).toBe(100);
    expect(result.band).toBe('push');
    expect(result.volumeMultiplier).toBe(1.1);
    expect(result.restTimeAdjustment).toBe(0);
    expect(result.summary).toContain('push the intensity');
  });

  it('returns recovery band for worst-case inputs', () => {
    const result = evaluateReadiness({
      sleepQuality: 1,
      energyLevel: 1,
      sorenessLevel: 5,
      stressLevel: 5,
      motivation: 1,
    });

    expect(result.score).toBe(0);
    expect(result.band).toBe('recovery');
    expect(result.volumeMultiplier).toBe(0.5);
    expect(result.restTimeAdjustment).toBe(60);
    expect(result.summary).toContain('active recovery');
  });
});
