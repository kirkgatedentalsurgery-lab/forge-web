'use client';

import { useQuery } from '@tanstack/react-query';
import { createClient } from '@/lib/supabase/client';

export interface ExerciseListItem {
  id: string;
  name: string;
  equipment: string;
  movementPattern: string;
  difficulty: string;
  isCompound: boolean;
  videoUrl: string | null;
  aliases: string[];
  primaryMuscles: string[];
  secondaryMuscles: string[];
}

interface UseExercisesOptions {
  muscleGroup?: string;
  equipment?: string;
  search?: string;
  compoundOnly?: boolean;
}

export function useExercises(options: UseExercisesOptions = {}) {
  return useQuery({
    queryKey: ['exercises', options],
    queryFn: async (): Promise<ExerciseListItem[]> => {
      const supabase = createClient();

      let query = supabase
        .from('exercises')
        .select(`
          id, name, equipment, movement_pattern, difficulty, is_compound,
          video_url, aliases,
          exercise_muscle_groups (
            role, stimulus_magnitude,
            muscle_groups (name, display_name)
          )
        `)
        .eq('is_system', true)
        .order('name');

      if (options.equipment) {
        query = query.eq('equipment', options.equipment);
      }
      if (options.compoundOnly) {
        query = query.eq('is_compound', true);
      }
      if (options.search) {
        // Search name and aliases
        query = query.or(`name.ilike.%${options.search}%,aliases.cs.{${options.search}}`);
      }

      const { data, error } = await query;
      if (error) throw error;

      let results = (data || []).map((ex: any) => {
        const emgs = ex.exercise_muscle_groups || [];
        return {
          id: ex.id,
          name: ex.name,
          equipment: ex.equipment,
          movementPattern: ex.movement_pattern,
          difficulty: ex.difficulty,
          isCompound: ex.is_compound,
          videoUrl: ex.video_url,
          aliases: ex.aliases || [],
          primaryMuscles: emgs
            .filter((e: any) => e.role === 'primary')
            .map((e: any) => e.muscle_groups?.display_name)
            .filter(Boolean),
          secondaryMuscles: emgs
            .filter((e: any) => e.role === 'secondary')
            .map((e: any) => e.muscle_groups?.display_name)
            .filter(Boolean),
        };
      });

      // Client-side muscle group filter
      if (options.muscleGroup) {
        results = results.filter((ex) =>
          ex.primaryMuscles.some((m: string) => m.toLowerCase() === options.muscleGroup!.toLowerCase())
        );
      }

      return results;
    },
  });
}

export function useMuscleGroups() {
  return useQuery({
    queryKey: ['muscle-groups'],
    queryFn: async () => {
      const supabase = createClient();
      const { data } = await supabase
        .from('muscle_groups')
        .select('id, name, display_name, body_region')
        .order('name');
      return data || [];
    },
    staleTime: 60 * 60 * 1000, // 1 hour cache
  });
}
