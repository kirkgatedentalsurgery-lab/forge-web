import { describe, it, expect } from 'vitest';
import {
  calculateTrainingMax,
  getStrengthPrescription,
  getStrengthBlockStructure,
} from '../strength-mode';

describe('calculateTrainingMax', () => {
  it('returns 90% of the input e1RM', () => {
    expect(calculateTrainingMax(300)).toBe(270);
  });

  it('handles decimal e1RM values', () => {
    // 233.33 * 0.9 = 209.997 -> rounds to 210
    expect(calculateTrainingMax(233.33)).toBeCloseTo(210, 1);
  });

  it('returns 0 for 0 input', () => {
    expect(calculateTrainingMax(0)).toBe(0);
  });
});

describe('getStrengthPrescription', () => {
  const tm = 270; // training max

  describe('accumulation phase', () => {
    it('returns 5 sets for week 1 with 8 reps', () => {
      const sets = getStrengthPrescription(tm, 'accumulation', 1);
      expect(sets).toHaveLength(5);
      sets.forEach((s) => expect(s.reps).toBe(8));
    });

    it('uses 65-70% TM percentages in week 1', () => {
      const sets = getStrengthPrescription(tm, 'accumulation', 1);
      expect(sets[0].percentageOfTM).toBe(65);
      expect(sets[4].percentageOfTM).toBe(70);
    });

    it('prescribes 6 reps in week 2', () => {
      const sets = getStrengthPrescription(tm, 'accumulation', 2);
      sets.forEach((s) => expect(s.reps).toBe(6));
    });

    it('prescribes 5 reps in week 3', () => {
      const sets = getStrengthPrescription(tm, 'accumulation', 3);
      sets.forEach((s) => expect(s.reps).toBe(5));
    });

    it('rounds weights to nearest 2.5', () => {
      const sets = getStrengthPrescription(tm, 'accumulation', 1);
      sets.forEach((s) => {
        expect(s.weight % 2.5).toBe(0);
      });
    });
  });

  describe('intensification phase', () => {
    it('returns 4 sets for week 1 with 5 reps', () => {
      const sets = getStrengthPrescription(tm, 'intensification', 1);
      expect(sets).toHaveLength(4);
      sets.forEach((s) => expect(s.reps).toBe(5));
    });

    it('prescribes 3 reps in week 2', () => {
      const sets = getStrengthPrescription(tm, 'intensification', 2);
      sets.forEach((s) => expect(s.reps).toBe(3));
    });

    it('prescribes 2 reps in week 3 with higher percentages', () => {
      const sets = getStrengthPrescription(tm, 'intensification', 3);
      sets.forEach((s) => expect(s.reps).toBe(2));
      expect(sets[sets.length - 1].percentageOfTM).toBe(90);
    });
  });

  describe('deload phase', () => {
    it('returns 3 sets of 5 reps at 50-60% TM', () => {
      const sets = getStrengthPrescription(tm, 'deload', 1);
      expect(sets).toHaveLength(3);
      sets.forEach((s) => {
        expect(s.reps).toBe(5);
        expect(s.rpe).toBe(5);
      });
      expect(sets[0].percentageOfTM).toBe(50);
      expect(sets[2].percentageOfTM).toBe(60);
    });
  });

  describe('peaking phase', () => {
    it('returns 3 sets of doubles in week 1', () => {
      const sets = getStrengthPrescription(tm, 'peaking', 1);
      expect(sets).toHaveLength(3);
      sets.forEach((s) => expect(s.reps).toBe(2));
    });

    it('prescribes singles up to 100% TM in week 2', () => {
      const sets = getStrengthPrescription(tm, 'peaking', 2);
      expect(sets).toHaveLength(3);
      sets.forEach((s) => expect(s.reps).toBe(1));
      expect(sets[2].percentageOfTM).toBe(100);
    });

    it('rounds peaking weights to nearest 2.5', () => {
      const sets = getStrengthPrescription(tm, 'peaking', 2);
      sets.forEach((s) => {
        expect(s.weight % 2.5).toBe(0);
      });
    });
  });
});

describe('getStrengthBlockStructure', () => {
  it('returns a 4-week block for numWeeks <= 4', () => {
    const block = getStrengthBlockStructure(4);
    expect(block).toHaveLength(4);
    expect(block[0].phase).toBe('accumulation');
    expect(block[1].phase).toBe('accumulation');
    expect(block[2].phase).toBe('intensification');
    expect(block[3].phase).toBe('deload');
  });

  it('returns a 7-week block for numWeeks > 4', () => {
    const block = getStrengthBlockStructure(7);
    expect(block).toHaveLength(7);
    expect(block[0].phase).toBe('accumulation');
    expect(block[2].phase).toBe('accumulation');
    expect(block[3].phase).toBe('intensification');
    expect(block[5].phase).toBe('intensification');
    expect(block[6].phase).toBe('deload');
  });

  it('tracks weekInPhase correctly for 7-week block', () => {
    const block = getStrengthBlockStructure(7);
    expect(block[0].weekInPhase).toBe(1);
    expect(block[1].weekInPhase).toBe(2);
    expect(block[2].weekInPhase).toBe(3);
    expect(block[3].weekInPhase).toBe(1); // intensification restarts
    expect(block[6].weekInPhase).toBe(1); // deload
  });

  it('uses 4-week block for numWeeks of 3', () => {
    const block = getStrengthBlockStructure(3);
    expect(block).toHaveLength(4); // still returns 4-week template
  });
});
