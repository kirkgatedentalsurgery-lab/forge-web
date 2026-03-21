import { SplitType, DayTemplate, SplitTemplate } from '@/types';

export const SPLIT_TEMPLATES: Record<SplitType, SplitTemplate> = {
  push_pull_legs: {
    name: 'Push / Pull / Legs',
    description: 'Train pushing muscles, pulling muscles, and legs on separate days',
    recommendedDays: [3, 6],
    templates: [
      { label: 'Push', muscles: ['chest', 'front_delts', 'side_delts', 'triceps'] },
      { label: 'Pull', muscles: ['back', 'rear_delts', 'biceps'] },
      { label: 'Legs', muscles: ['quads', 'hamstrings', 'glutes', 'calves'] },
    ],
  },
  upper_lower: {
    name: 'Upper / Lower',
    description: 'Alternate between upper body and lower body training days',
    recommendedDays: [4, 5, 6],
    templates: [
      { label: 'Upper', muscles: ['chest', 'back', 'front_delts', 'side_delts', 'rear_delts', 'biceps', 'triceps'] },
      { label: 'Lower', muscles: ['quads', 'hamstrings', 'glutes', 'calves', 'abs'] },
    ],
  },
  full_body: {
    name: 'Full Body',
    description: 'Train all major muscle groups each session',
    recommendedDays: [3, 4],
    templates: [
      { label: 'Full Body', muscles: ['chest', 'back', 'quads', 'hamstrings', 'side_delts', 'biceps', 'triceps'] },
    ],
  },
  bro_split: {
    name: 'Bro Split',
    description: 'Dedicate each day to one or two muscle groups',
    recommendedDays: [5, 6],
    templates: [
      { label: 'Chest', muscles: ['chest', 'front_delts'] },
      { label: 'Back', muscles: ['back', 'rear_delts', 'traps'] },
      { label: 'Shoulders', muscles: ['front_delts', 'side_delts', 'rear_delts'] },
      { label: 'Arms', muscles: ['biceps', 'triceps', 'forearms'] },
      { label: 'Legs', muscles: ['quads', 'hamstrings', 'glutes', 'calves'] },
    ],
  },
  arnold_split: {
    name: 'Arnold Split',
    description: 'Chest/Back, Shoulders/Arms, Legs - high frequency',
    recommendedDays: [6],
    templates: [
      { label: 'Chest & Back', muscles: ['chest', 'back'] },
      { label: 'Shoulders & Arms', muscles: ['front_delts', 'side_delts', 'rear_delts', 'biceps', 'triceps'] },
      { label: 'Legs', muscles: ['quads', 'hamstrings', 'glutes', 'calves'] },
    ],
  },
  custom: {
    name: 'Custom',
    description: 'Build your own split from scratch',
    recommendedDays: [3, 4, 5, 6, 7],
    templates: [],
  },
};

/**
 * Resolve how many training days map to which templates.
 * For PPL with 6 days: Push A, Pull A, Legs A, Push B, Pull B, Legs B
 * For Upper/Lower with 5 days: Upper A, Lower A, Upper B, Lower B, Upper C
 */
export function resolveDaySchedule(
  splitType: SplitType,
  daysPerWeek: number
): DayTemplate[] {
  const split = SPLIT_TEMPLATES[splitType];
  if (splitType === 'custom' || split.templates.length === 0) {
    return [];
  }

  const templates = split.templates;
  const schedule: DayTemplate[] = [];
  const templateCounts: Record<string, number> = {};

  for (let i = 0; i < daysPerWeek; i++) {
    const template = templates[i % templates.length];
    const count = (templateCounts[template.label] || 0) + 1;
    templateCounts[template.label] = count;

    const needsSuffix = daysPerWeek > templates.length;
    const suffix = needsSuffix ? ` ${String.fromCharCode(64 + count)}` : '';

    schedule.push({
      label: `${template.label}${suffix}`,
      muscles: [...template.muscles],
    });
  }

  return schedule;
}
