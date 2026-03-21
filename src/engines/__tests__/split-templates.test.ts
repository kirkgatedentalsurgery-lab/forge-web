import { describe, it, expect } from 'vitest';
import { resolveDaySchedule, SPLIT_TEMPLATES } from '../split-templates';

describe('resolveDaySchedule', () => {
  describe('Push/Pull/Legs', () => {
    it('returns 3 days without suffixes for 3 days/week', () => {
      const schedule = resolveDaySchedule('push_pull_legs', 3);
      expect(schedule).toHaveLength(3);
      expect(schedule[0].label).toBe('Push');
      expect(schedule[1].label).toBe('Pull');
      expect(schedule[2].label).toBe('Legs');
    });

    it('returns 6 days with A/B suffixes for 6 days/week', () => {
      const schedule = resolveDaySchedule('push_pull_legs', 6);
      expect(schedule).toHaveLength(6);
      expect(schedule[0].label).toBe('Push A');
      expect(schedule[1].label).toBe('Pull A');
      expect(schedule[2].label).toBe('Legs A');
      expect(schedule[3].label).toBe('Push B');
      expect(schedule[4].label).toBe('Pull B');
      expect(schedule[5].label).toBe('Legs B');
    });

    it('includes correct muscles for Push day', () => {
      const schedule = resolveDaySchedule('push_pull_legs', 3);
      expect(schedule[0].muscles).toContain('chest');
      expect(schedule[0].muscles).toContain('triceps');
    });

    it('returns 4 days with suffixes wrapping around templates', () => {
      const schedule = resolveDaySchedule('push_pull_legs', 4);
      expect(schedule).toHaveLength(4);
      expect(schedule[0].label).toBe('Push A');
      expect(schedule[1].label).toBe('Pull A');
      expect(schedule[2].label).toBe('Legs A');
      expect(schedule[3].label).toBe('Push B');
    });
  });

  describe('Upper/Lower', () => {
    it('returns 4 days with A/B suffixes for 4 days/week', () => {
      const schedule = resolveDaySchedule('upper_lower', 4);
      expect(schedule).toHaveLength(4);
      expect(schedule[0].label).toBe('Upper A');
      expect(schedule[1].label).toBe('Lower A');
      expect(schedule[2].label).toBe('Upper B');
      expect(schedule[3].label).toBe('Lower B');
    });

    it('returns 2 days without suffixes for 2 days/week', () => {
      const schedule = resolveDaySchedule('upper_lower', 2);
      expect(schedule).toHaveLength(2);
      expect(schedule[0].label).toBe('Upper');
      expect(schedule[1].label).toBe('Lower');
    });

    it('includes upper body muscles in Upper template', () => {
      const schedule = resolveDaySchedule('upper_lower', 2);
      expect(schedule[0].muscles).toContain('chest');
      expect(schedule[0].muscles).toContain('back');
      expect(schedule[0].muscles).toContain('biceps');
    });
  });

  describe('Full Body', () => {
    it('returns 3 days with A/B/C suffixes for 3 days/week', () => {
      const schedule = resolveDaySchedule('full_body', 3);
      expect(schedule).toHaveLength(3);
      expect(schedule[0].label).toBe('Full Body A');
      expect(schedule[1].label).toBe('Full Body B');
      expect(schedule[2].label).toBe('Full Body C');
    });

    it('returns 1 day without suffix for 1 day/week', () => {
      const schedule = resolveDaySchedule('full_body', 1);
      expect(schedule).toHaveLength(1);
      expect(schedule[0].label).toBe('Full Body');
    });
  });

  describe('Custom', () => {
    it('returns an empty array for custom split', () => {
      const schedule = resolveDaySchedule('custom', 4);
      expect(schedule).toEqual([]);
    });
  });

  describe('muscle arrays', () => {
    it('returns copies of muscle arrays (not references)', () => {
      const schedule = resolveDaySchedule('push_pull_legs', 3);
      const originalMuscles = SPLIT_TEMPLATES.push_pull_legs.templates[0].muscles;
      schedule[0].muscles.push('test_muscle');
      expect(originalMuscles).not.toContain('test_muscle');
    });
  });

  describe('suffix logic', () => {
    it('does NOT add suffixes when daysPerWeek equals templates length', () => {
      // Arnold split has 3 templates
      const schedule = resolveDaySchedule('arnold_split', 3);
      expect(schedule[0].label).toBe('Chest & Back');
      expect(schedule[1].label).toBe('Shoulders & Arms');
      expect(schedule[2].label).toBe('Legs');
    });

    it('adds suffixes when daysPerWeek exceeds templates length', () => {
      const schedule = resolveDaySchedule('arnold_split', 6);
      expect(schedule[0].label).toBe('Chest & Back A');
      expect(schedule[3].label).toBe('Chest & Back B');
    });
  });
});
