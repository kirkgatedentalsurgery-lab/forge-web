import { create } from 'zustand';

export type TrainingGoal = 'hypertrophy' | 'strength' | 'powerbuilding' | 'general_fitness' | 'body_recomp';
export type ExperienceLevel = 'beginner' | 'intermediate' | 'advanced';
export type SplitPreference = 'push_pull_legs' | 'upper_lower' | 'full_body' | 'bro_split' | 'arnold_split' | 'no_preference';

export interface OnboardingState {
  // Step 1: Goal
  goal: TrainingGoal | null;
  // Step 2: Experience
  experience: ExperienceLevel | null;
  trainingAgeMonths: number | null;
  // Step 3: Schedule
  daysPerWeek: number;
  sessionMinutes: number;
  // Step 4: Equipment
  equipment: string[];
  // Step 5: Split
  splitPreference: SplitPreference | null;
  // Step 6: Exercises (stored as IDs)
  favoriteExercises: string[];
  dislikedExercises: string[];
  // Step 7: Body / Injuries
  priorityMuscles: string[];
  injuries: { bodyArea: string; severity: string }[];
  bodyWeight: number | null;
  // Current step
  currentStep: number;

  // Actions
  setGoal: (goal: TrainingGoal) => void;
  setExperience: (exp: ExperienceLevel) => void;
  setTrainingAge: (months: number) => void;
  setDaysPerWeek: (days: number) => void;
  setSessionMinutes: (mins: number) => void;
  setEquipment: (eq: string[]) => void;
  setSplitPreference: (split: SplitPreference) => void;
  toggleFavoriteExercise: (id: string) => void;
  toggleDislikedExercise: (id: string) => void;
  setPriorityMuscles: (muscles: string[]) => void;
  addInjury: (injury: { bodyArea: string; severity: string }) => void;
  removeInjury: (index: number) => void;
  setBodyWeight: (weight: number) => void;
  nextStep: () => void;
  prevStep: () => void;
  reset: () => void;
}

const initialState = {
  goal: null,
  experience: null,
  trainingAgeMonths: null,
  daysPerWeek: 4,
  sessionMinutes: 60,
  equipment: ['barbell', 'dumbbell', 'cable', 'machine', 'bodyweight'],
  splitPreference: null,
  favoriteExercises: [],
  dislikedExercises: [],
  priorityMuscles: [],
  injuries: [],
  bodyWeight: null,
  currentStep: 1,
};

export const useOnboardingStore = create<OnboardingState>((set) => ({
  ...initialState,

  setGoal: (goal) => set({ goal }),
  setExperience: (experience) => set({ experience }),
  setTrainingAge: (trainingAgeMonths) => set({ trainingAgeMonths }),
  setDaysPerWeek: (daysPerWeek) => set({ daysPerWeek }),
  setSessionMinutes: (sessionMinutes) => set({ sessionMinutes }),
  setEquipment: (equipment) => set({ equipment }),
  setSplitPreference: (splitPreference) => set({ splitPreference }),

  toggleFavoriteExercise: (id) =>
    set((s) => ({
      favoriteExercises: s.favoriteExercises.includes(id)
        ? s.favoriteExercises.filter((e) => e !== id)
        : [...s.favoriteExercises, id],
    })),

  toggleDislikedExercise: (id) =>
    set((s) => ({
      dislikedExercises: s.dislikedExercises.includes(id)
        ? s.dislikedExercises.filter((e) => e !== id)
        : [...s.dislikedExercises, id],
    })),

  setPriorityMuscles: (priorityMuscles) => set({ priorityMuscles }),

  addInjury: (injury) =>
    set((s) => ({ injuries: [...s.injuries, injury] })),

  removeInjury: (index) =>
    set((s) => ({ injuries: s.injuries.filter((_, i) => i !== index) })),

  setBodyWeight: (bodyWeight) => set({ bodyWeight }),
  nextStep: () => set((s) => ({ currentStep: s.currentStep + 1 })),
  prevStep: () => set((s) => ({ currentStep: Math.max(1, s.currentStep - 1) })),
  reset: () => set(initialState),
}));
