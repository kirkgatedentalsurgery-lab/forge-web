import { describe, it, expect } from 'vitest';
import { detectDeload, DeloadInput } from '../deload-detector';

const baseline: DeloadInput = {
  recentSessionRatings: [5, 5, 5],
  recentReadinessScores: [70, 75, 72, 68, 71],
  e1rmTrending: 'up',
  recentSleepScores: [4, 4, 3, 4, 4],
  painFlagCount: 0,
  recentCompletionRates: [1.0, 0.95, 0.9],
};

describe('detectDeload', () => {
  it('returns none urgency when 0 criteria are triggered', () => {
    const result = detectDeload(baseline);
    expect(result.shouldDeload).toBe(false);
    expect(result.urgency).toBe('none');
    expect(result.triggeredCriteria).toHaveLength(0);
    expect(result.message).toContain('progressing well');
  });

  it('returns suggested when exactly 2 criteria are triggered', () => {
    const result = detectDeload({
      ...baseline,
      recentSessionRatings: [8, 9, 5], // criterion 1: 2 hard sessions
      e1rmTrending: 'down',            // criterion 3
    });
    expect(result.shouldDeload).toBe(true);
    expect(result.urgency).toBe('suggested');
    expect(result.triggeredCriteria).toHaveLength(2);
    expect(result.message).toContain('Monitor closely');
  });

  it('returns recommended when 3 criteria are triggered', () => {
    const result = detectDeload({
      ...baseline,
      recentSessionRatings: [8, 9, 5], // criterion 1
      e1rmTrending: 'down',            // criterion 3
      painFlagCount: 3,                // criterion 5
    });
    expect(result.shouldDeload).toBe(true);
    expect(result.urgency).toBe('recommended');
    expect(result.triggeredCriteria).toHaveLength(3);
    expect(result.message).toContain('Consider a deload');
  });

  it('returns urgent when 4+ criteria are triggered', () => {
    const result = detectDeload({
      ...baseline,
      recentSessionRatings: [8, 9, 8],        // criterion 1
      recentReadinessScores: [40, 45, 50, 48], // criterion 2: avg < 55
      e1rmTrending: 'down',                    // criterion 3
      painFlagCount: 2,                        // criterion 5
    });
    expect(result.shouldDeload).toBe(true);
    expect(result.urgency).toBe('urgent');
    expect(result.triggeredCriteria.length).toBeGreaterThanOrEqual(4);
    expect(result.message).toContain('strongly recommended');
  });

  // Individual criterion tests
  it('triggers criterion 1: multiple brutal sessions (2+ rated 8+)', () => {
    const result = detectDeload({
      ...baseline,
      recentSessionRatings: [8, 9, 7],
      painFlagCount: 2, // add a second trigger so shouldDeload is true
    });
    expect(result.triggeredCriteria).toContain('Multiple brutal sessions recently');
  });

  it('does NOT trigger criterion 1 when only 1 session is rated 8+', () => {
    const result = detectDeload({
      ...baseline,
      recentSessionRatings: [8, 5, 6],
    });
    expect(result.triggeredCriteria).not.toContain('Multiple brutal sessions recently');
  });

  it('triggers criterion 2: low readiness average (below 55)', () => {
    const result = detectDeload({
      ...baseline,
      recentReadinessScores: [50, 45, 55, 40, 52],
      painFlagCount: 2,
    });
    expect(result.triggeredCriteria).toContain('Readiness score consistently low');
  });

  it('does NOT trigger criterion 2 when fewer than 3 readiness scores', () => {
    const result = detectDeload({
      ...baseline,
      recentReadinessScores: [30, 20], // only 2 scores, even though avg < 55
    });
    expect(result.triggeredCriteria).not.toContain('Readiness score consistently low');
  });

  it('triggers criterion 3: e1RM trending down', () => {
    const result = detectDeload({
      ...baseline,
      e1rmTrending: 'down',
      painFlagCount: 2,
    });
    expect(result.triggeredCriteria).toContain('Strength trending downward');
  });

  it('triggers criterion 4: poor sleep (average below 2.5)', () => {
    const result = detectDeload({
      ...baseline,
      recentSleepScores: [2, 1, 2, 2, 3],
      painFlagCount: 2,
    });
    expect(result.triggeredCriteria).toContain('Sleep quality persistently poor');
  });

  it('triggers criterion 5: 2+ pain flags in last 3 sessions', () => {
    const result = detectDeload({
      ...baseline,
      painFlagCount: 2,
      e1rmTrending: 'down',
    });
    expect(result.triggeredCriteria).toContain('Pain flags increasing');
  });

  it('triggers criterion 6: low completion rate (below 75% for 2+ sessions)', () => {
    const result = detectDeload({
      ...baseline,
      recentCompletionRates: [0.6, 0.7, 0.9],
      painFlagCount: 2,
    });
    expect(result.triggeredCriteria).toContain('Unable to complete prescribed sets');
  });

  it('returns shouldDeload false when only 1 criterion is triggered', () => {
    const result = detectDeload({
      ...baseline,
      e1rmTrending: 'down', // only 1 criterion
    });
    expect(result.shouldDeload).toBe(false);
    expect(result.urgency).toBe('none');
    expect(result.triggeredCriteria).toHaveLength(1);
  });
});
