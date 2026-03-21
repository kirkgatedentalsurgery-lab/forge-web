import { MuscleGroup } from '@/types';

// Research-based volume landmarks (sets per week)
// Sources: RP Strength, Mike Israetel's Scientific Principles of Hypertrophy Training
export const MUSCLE_GROUP_DEFAULTS: Omit<MuscleGroup, 'id'>[] = [
  { name: 'chest', displayName: 'Chest', bodyRegion: 'upper', mev: 8, mav: 14, mrv: 20 },
  { name: 'back', displayName: 'Back', bodyRegion: 'upper', mev: 8, mav: 16, mrv: 22 },
  { name: 'front_delts', displayName: 'Front Delts', bodyRegion: 'upper', mev: 0, mav: 6, mrv: 12 },
  { name: 'side_delts', displayName: 'Side Delts', bodyRegion: 'upper', mev: 6, mav: 16, mrv: 22 },
  { name: 'rear_delts', displayName: 'Rear Delts', bodyRegion: 'upper', mev: 0, mav: 12, mrv: 18 },
  { name: 'biceps', displayName: 'Biceps', bodyRegion: 'upper', mev: 4, mav: 12, mrv: 18 },
  { name: 'triceps', displayName: 'Triceps', bodyRegion: 'upper', mev: 4, mav: 10, mrv: 16 },
  { name: 'traps', displayName: 'Traps', bodyRegion: 'upper', mev: 0, mav: 10, mrv: 18 },
  { name: 'quads', displayName: 'Quads', bodyRegion: 'lower', mev: 6, mav: 14, mrv: 20 },
  { name: 'hamstrings', displayName: 'Hamstrings', bodyRegion: 'lower', mev: 4, mav: 10, mrv: 16 },
  { name: 'glutes', displayName: 'Glutes', bodyRegion: 'lower', mev: 0, mav: 8, mrv: 16 },
  { name: 'calves', displayName: 'Calves', bodyRegion: 'lower', mev: 6, mav: 10, mrv: 16 },
  { name: 'abs', displayName: 'Abs', bodyRegion: 'core', mev: 0, mav: 10, mrv: 16 },
  { name: 'forearms', displayName: 'Forearms', bodyRegion: 'upper', mev: 0, mav: 6, mrv: 12 },
];
