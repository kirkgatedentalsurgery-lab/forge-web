'use client';

import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';

export interface UserProfile {
  id: string;
  displayName: string | null;
  experienceLevel: string;
  availableEquipment: string[];
  defaultRestSeconds: number;
  preferredUnit: 'lbs' | 'kg';
  trainingGoal: string | null;
  trainingAgeMonths: number | null;
  preferredSessionMinutes: number;
  preferredSplit: string | null;
  onboardingCompleted: boolean;
  bodyWeight: number | null;
}

export function useUserProfile() {
  const { user } = useAuth();

  return useQuery({
    queryKey: ['user-profile', user?.id],
    enabled: !!user,
    queryFn: async (): Promise<UserProfile | null> => {
      const supabase = createClient();
      const { data, error } = await supabase
        .from('user_profiles')
        .select('*')
        .eq('id', user!.id)
        .single();

      if (error || !data) return null;

      return {
        id: data.id,
        displayName: data.display_name,
        experienceLevel: data.experience_level || 'intermediate',
        availableEquipment: data.available_equipment || ['barbell', 'dumbbell', 'cable', 'machine', 'bodyweight'],
        defaultRestSeconds: data.default_rest_seconds || 120,
        preferredUnit: data.preferred_unit || 'lbs',
        trainingGoal: data.training_goal,
        trainingAgeMonths: data.training_age_months,
        preferredSessionMinutes: data.preferred_session_minutes || 60,
        preferredSplit: data.preferred_split,
        onboardingCompleted: data.onboarding_completed || false,
        bodyWeight: data.body_weight,
      };
    },
    staleTime: 5 * 60 * 1000, // cache for 5 minutes
  });
}

/** Convenience hook to just get the unit */
export function usePreferredUnit(): 'lbs' | 'kg' {
  const { data: profile } = useUserProfile();
  return profile?.preferredUnit || 'lbs';
}
