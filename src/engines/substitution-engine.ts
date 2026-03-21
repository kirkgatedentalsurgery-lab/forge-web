import { SupabaseClient } from '@supabase/supabase-js';

export interface SubstituteCandidate {
  exerciseId: string;
  exerciseName: string;
  equipment: string;
  isCompound: boolean;
  similarityScore: number;
  reason: string;
}

/**
 * Find substitute exercises for a given exercise.
 * 1. Check pre-mapped substitutes in exercise_substitutions table
 * 2. Fallback: algorithmic match (same primary muscle, same movement pattern, compatible equipment)
 * 3. Filter out user-disliked exercises
 */
export async function findSubstitutes(
  supabase: SupabaseClient,
  exerciseId: string,
  userId: string,
  availableEquipment: string[]
): Promise<SubstituteCandidate[]> {
  const candidates: SubstituteCandidate[] = [];

  // Get the original exercise's muscle groups and movement pattern
  const { data: original } = await supabase
    .from('exercises')
    .select(`
      id, name, equipment, movement_pattern, is_compound,
      exercise_muscle_groups (role, muscle_group_id, muscle_groups(name))
    `)
    .eq('id', exerciseId)
    .single();

  if (!original) return [];

  const primaryMuscles = (original.exercise_muscle_groups || [])
    .filter((e: any) => e.role === 'primary')
    .map((e: any) => e.muscle_group_id);

  // 1. Pre-mapped substitutes
  const { data: mapped } = await supabase
    .from('exercise_substitutions')
    .select('substitute_id, similarity_score, exercises!exercise_substitutions_substitute_id_fkey(id, name, equipment, is_compound)')
    .eq('exercise_id', exerciseId);

  for (const sub of mapped || []) {
    const ex = sub.exercises as any;
    if (!ex || !availableEquipment.includes(ex.equipment)) continue;
    candidates.push({
      exerciseId: ex.id,
      exerciseName: ex.name,
      equipment: ex.equipment,
      isCompound: ex.is_compound,
      similarityScore: sub.similarity_score,
      reason: 'Pre-mapped substitute',
    });
  }

  // 2. Algorithmic match
  if (primaryMuscles.length > 0) {
    const { data: matchingExercises } = await supabase
      .from('exercises')
      .select(`
        id, name, equipment, movement_pattern, is_compound,
        exercise_muscle_groups!inner (role, muscle_group_id)
      `)
      .in('equipment', availableEquipment)
      .eq('is_system', true)
      .neq('id', exerciseId)
      .eq('exercise_muscle_groups.role', 'primary')
      .in('exercise_muscle_groups.muscle_group_id', primaryMuscles)
      .limit(20);

    for (const ex of matchingExercises || []) {
      // Skip if already in candidates
      if (candidates.some((c) => c.exerciseId === ex.id)) continue;

      let score = 0.5; // base
      if (ex.movement_pattern === original.movement_pattern) score += 0.2;
      if (ex.is_compound === original.is_compound) score += 0.1;
      if (ex.equipment === original.equipment) score += 0.1;

      candidates.push({
        exerciseId: ex.id,
        exerciseName: ex.name,
        equipment: ex.equipment,
        isCompound: ex.is_compound,
        similarityScore: Math.round(score * 100) / 100,
        reason: ex.movement_pattern === original.movement_pattern
          ? 'Same movement pattern'
          : 'Same primary muscle',
      });
    }
  }

  // 3. Filter out user-disliked exercises
  const { data: disliked } = await supabase
    .from('user_disliked_exercises')
    .select('exercise_id')
    .eq('user_id', userId);

  const dislikedIds = new Set((disliked || []).map((d: any) => d.exercise_id));

  return candidates
    .filter((c) => !dislikedIds.has(c.exerciseId))
    .sort((a, b) => b.similarityScore - a.similarityScore)
    .slice(0, 10);
}
