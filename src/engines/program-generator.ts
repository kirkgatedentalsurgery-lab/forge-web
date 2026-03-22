import { SupabaseClient } from '@supabase/supabase-js';
import {
  GenerateProgramInput,
  Exercise,
  MuscleGroup,
} from '@/types';
import { resolveDaySchedule } from './split-templates';
import { DEFAULT_MESOCYCLE, REP_RANGES, REST_TIMES, calculateMaxSets, calculateMaxExercises } from '@/lib/constants';

export interface GeneratedProgram {
  programId: string;
  weeks: GeneratedWeek[];
}

interface GeneratedWeek {
  weekNumber: number;
  isDeload: boolean;
  targetRir: number;
  volumeMultiplier: number;
  days: GeneratedDay[];
}

interface GeneratedDay {
  dayNumber: number;
  dayLabel: string;
  targetMuscleGroupIds: string[];
  exercises: GeneratedExercise[];
}

interface GeneratedExercise {
  exerciseId: string;
  exerciseName: string;
  orderIndex: number;
  targetSets: number;
  targetRepsMin: number;
  targetRepsMax: number;
  targetRir: number;
  restSeconds: number;
}

/**
 * Main program generation function.
 * Accepts a Supabase client so it works from both client and server.
 */
export async function generateProgram(
  supabase: SupabaseClient,
  input: GenerateProgramInput
): Promise<GeneratedProgram> {
  const [muscleGroups, exercises] = await Promise.all([
    fetchMuscleGroups(supabase),
    fetchExercises(supabase, input.availableEquipment, input.experienceLevel),
  ]);

  const muscleMap = new Map(muscleGroups.map((mg) => [mg.name, mg]));

  const daySchedule = input.customDaySchedule && input.customDaySchedule.length > 0
    ? input.customDaySchedule
    : resolveDaySchedule(input.splitType, input.daysPerWeek);
  if (daySchedule.length === 0) {
    throw new Error('Could not resolve day schedule for this split type');
  }

  const sessionMinutes = input.sessionMinutes || 60;
  const maxSetsPerDay = calculateMaxSets(sessionMinutes);
  const targetExercises = calculateMaxExercises(sessionMinutes);

  const usedExerciseIds = new Set<string>();
  const dayExercises = daySchedule.map((day, dayIndex) => {
    const dayMuscles = day.muscles
      .map((m) => muscleMap.get(m))
      .filter(Boolean) as MuscleGroup[];

    const selected = selectExercisesForDay(dayMuscles, exercises, usedExerciseIds, maxSetsPerDay, targetExercises);
    selected.forEach((ex) => usedExerciseIds.add(ex.exerciseId));

    return {
      dayNumber: dayIndex + 1,
      dayLabel: day.label,
      targetMuscleGroupIds: dayMuscles.map((dm) => dm.id),
      exercises: selected,
    };
  });

  const numTrainingWeeks = input.hasDeload ? input.numWeeks - 1 : input.numWeeks;
  const rirStep =
    (DEFAULT_MESOCYCLE.rirProgression[0] - DEFAULT_MESOCYCLE.rirProgression[numTrainingWeeks - 1]) /
    Math.max(numTrainingWeeks - 1, 1);

  const weeks: GeneratedWeek[] = [];
  for (let w = 0; w < input.numWeeks; w++) {
    const isDeload = input.hasDeload && w === input.numWeeks - 1;
    const targetRir = isDeload
      ? 4
      : Math.max(0, Math.round(DEFAULT_MESOCYCLE.rirProgression[0] - w * rirStep));
    const volumeMultiplier = isDeload ? 0.5 : w >= numTrainingWeeks - 2 ? 1.1 : 1.0;

    weeks.push({
      weekNumber: w + 1,
      isDeload,
      targetRir,
      volumeMultiplier,
      days: dayExercises.map((day) => ({
        ...day,
        exercises: day.exercises.map((ex) => ({
          ...ex,
          targetRir,
          targetSets: isDeload
            ? Math.max(2, Math.round(ex.targetSets * 0.5))
            : Math.round(ex.targetSets * volumeMultiplier),
        })),
      })),
    });
  }

  const programId = await persistProgram(supabase, input, weeks);
  return { programId, weeks };
}

// ---- Helpers ----

async function fetchMuscleGroups(supabase: SupabaseClient): Promise<MuscleGroup[]> {
  const { data, error } = await supabase.from('muscle_groups').select('*');
  if (error) throw error;
  return (data || []).map((mg: any) => ({
    id: mg.id,
    name: mg.name,
    displayName: mg.display_name,
    bodyRegion: mg.body_region,
    mev: mg.mev,
    mav: mg.mav,
    mrv: mg.mrv,
  }));
}

async function fetchExercises(
  supabase: SupabaseClient,
  equipment: string[],
  difficulty: string
): Promise<Exercise[]> {
  const difficultyOrder = ['beginner', 'intermediate', 'advanced'];
  const maxDiffIndex = difficultyOrder.indexOf(difficulty);
  const allowedDifficulties = difficultyOrder.slice(0, maxDiffIndex + 1);

  const { data, error } = await supabase
    .from('exercises')
    .select(`*, exercise_muscle_groups (role, stimulus_magnitude, muscle_group_id, muscle_groups (*))`)
    .in('equipment', equipment)
    .in('difficulty', allowedDifficulties)
    .eq('is_system', true);

  if (error) throw error;

  return (data || []).map((raw: any) => ({
    id: raw.id,
    name: raw.name,
    equipment: raw.equipment,
    movementPattern: raw.movement_pattern,
    difficulty: raw.difficulty,
    instructions: raw.instructions,
    isCompound: raw.is_compound,
    isSystem: raw.is_system,
    createdBy: raw.created_by,
    muscleGroups: (raw.exercise_muscle_groups || []).map((emg: any) => ({
      muscleGroupId: emg.muscle_group_id,
      muscleGroup: emg.muscle_groups
        ? {
            id: emg.muscle_groups.id,
            name: emg.muscle_groups.name,
            displayName: emg.muscle_groups.display_name,
            bodyRegion: emg.muscle_groups.body_region,
            mev: emg.muscle_groups.mev,
            mav: emg.muscle_groups.mav,
            mrv: emg.muscle_groups.mrv,
          }
        : undefined,
      role: emg.role,
      stimulusMagnitude: parseFloat(emg.stimulus_magnitude),
    })),
  }));
}

function selectExercisesForDay(
  dayMuscles: MuscleGroup[],
  allExercises: Exercise[],
  usedExerciseIds: Set<string>,
  maxSetsPerDay: number,
  targetExerciseCount: number
): GeneratedExercise[] {
  const selected: GeneratedExercise[] = [];
  let orderIndex = 0;
  let totalSetsUsed = 0;

  // Determine how many compounds vs isolations
  const numCompounds = Math.min(Math.ceil(targetExerciseCount * 0.4), dayMuscles.length);
  const numIsolations = targetExerciseCount - numCompounds;

  // Sort muscles: larger muscle groups first (they get compounds)
  const largeMuscles = ['chest', 'back', 'quads', 'hamstrings', 'glutes', 'shoulders'];
  const sortedMuscles = [...dayMuscles].sort((a, b) => {
    const aLarge = largeMuscles.includes(a.name) ? 0 : 1;
    const bLarge = largeMuscles.includes(b.name) ? 0 : 1;
    return aLarge - bLarge;
  });

  // Phase 1: Compounds — 1 per large muscle group, 3-4 sets each
  const compounds = allExercises.filter((ex) => ex.isCompound && !usedExerciseIds.has(ex.id));
  const coveredMuscles = new Set<string>();

  for (const muscle of sortedMuscles) {
    if (selected.length >= numCompounds || totalSetsUsed >= maxSetsPerDay) break;

    const matching = compounds.filter((ex) =>
      ex.muscleGroups.some((mg) => mg.muscleGroup?.name === muscle.name && mg.role === 'primary')
    );

    if (matching.length > 0) {
      const pick = matching[Math.floor(Math.random() * Math.min(3, matching.length))];
      const sets = Math.min(4, maxSetsPerDay - totalSetsUsed);
      if (sets <= 0) break;
      selected.push({
        exerciseId: pick.id, exerciseName: pick.name, orderIndex: orderIndex++,
        targetSets: sets, targetRepsMin: REP_RANGES.compound.min, targetRepsMax: REP_RANGES.compound.max,
        targetRir: 3, restSeconds: REST_TIMES.compound,
      });
      totalSetsUsed += sets;
      coveredMuscles.add(muscle.name);
      // Track secondary muscles covered
      for (const mg of pick.muscleGroups) {
        if (mg.muscleGroup) coveredMuscles.add(mg.muscleGroup.name);
      }
      const idx = compounds.indexOf(pick);
      if (idx >= 0) compounds.splice(idx, 1);
    }
  }

  // Phase 2: Isolations — fill remaining slots, 3 sets each
  // Prioritize muscles not yet covered, then repeat for more volume
  const isolations = allExercises.filter(
    (ex) => !ex.isCompound && !usedExerciseIds.has(ex.id) && !selected.some((s) => s.exerciseId === ex.id)
  );

  // First pass: uncovered muscles
  for (const muscle of sortedMuscles) {
    if (selected.length >= targetExerciseCount || totalSetsUsed >= maxSetsPerDay) break;
    if (coveredMuscles.has(muscle.name)) continue;

    const matching = isolations.filter((ex) =>
      ex.muscleGroups.some((mg) => mg.muscleGroup?.name === muscle.name && mg.role === 'primary')
    );
    if (matching.length > 0) {
      const pick = matching[Math.floor(Math.random() * Math.min(3, matching.length))];
      const sets = Math.min(3, maxSetsPerDay - totalSetsUsed);
      if (sets <= 0) break;
      selected.push({
        exerciseId: pick.id, exerciseName: pick.name, orderIndex: orderIndex++,
        targetSets: sets, targetRepsMin: REP_RANGES.isolation.min, targetRepsMax: REP_RANGES.isolation.max,
        targetRir: 3, restSeconds: REST_TIMES.isolation,
      });
      totalSetsUsed += sets;
      coveredMuscles.add(muscle.name);
      const idx = isolations.indexOf(pick);
      if (idx >= 0) isolations.splice(idx, 1);
    }
  }

  // Second pass: additional exercises for more volume on any muscle
  for (const muscle of sortedMuscles) {
    if (selected.length >= targetExerciseCount || totalSetsUsed >= maxSetsPerDay) break;

    const matching = isolations.filter((ex) =>
      ex.muscleGroups.some((mg) => mg.muscleGroup?.name === muscle.name && mg.role === 'primary')
    );
    if (matching.length > 0) {
      const pick = matching[Math.floor(Math.random() * Math.min(3, matching.length))];
      const sets = Math.min(3, maxSetsPerDay - totalSetsUsed);
      if (sets <= 0) break;
      selected.push({
        exerciseId: pick.id, exerciseName: pick.name, orderIndex: orderIndex++,
        targetSets: sets, targetRepsMin: REP_RANGES.isolation.min, targetRepsMax: REP_RANGES.isolation.max,
        targetRir: 3, restSeconds: REST_TIMES.isolation,
      });
      totalSetsUsed += sets;
      const idx = isolations.indexOf(pick);
      if (idx >= 0) isolations.splice(idx, 1);
    }
  }

  return selected;
}

async function persistProgram(
  supabase: SupabaseClient,
  input: GenerateProgramInput,
  weeks: GeneratedWeek[]
): Promise<string> {
  const { data: program, error: programError } = await supabase
    .from('programs')
    .insert({
      user_id: input.userId, name: input.programName, split_type: input.splitType,
      days_per_week: input.daysPerWeek, num_weeks: input.numWeeks,
      has_deload: input.hasDeload, status: 'active',
      started_at: new Date().toISOString(),
    })
    .select().single();

  if (programError || !program) throw programError || new Error('Failed to create program');

  for (const week of weeks) {
    const { data: weekRow, error: weekError } = await supabase
      .from('program_weeks')
      .insert({
        program_id: program.id, week_number: week.weekNumber,
        is_deload: week.isDeload, target_rir: week.targetRir,
        volume_multiplier: week.volumeMultiplier,
      })
      .select().single();

    if (weekError || !weekRow) throw weekError || new Error('Failed to create week');

    for (const day of week.days) {
      const { data: dayRow, error: dayError } = await supabase
        .from('program_days')
        .insert({
          program_week_id: weekRow.id, day_number: day.dayNumber,
          day_label: day.dayLabel, target_muscle_groups: day.targetMuscleGroupIds,
        })
        .select().single();

      if (dayError || !dayRow) throw dayError || new Error('Failed to create day');

      if (day.exercises.length > 0) {
        const { error: exError } = await supabase
          .from('program_exercises')
          .insert(
            day.exercises.map((ex) => ({
              program_day_id: dayRow.id, exercise_id: ex.exerciseId,
              order_index: ex.orderIndex, target_sets: ex.targetSets,
              target_reps_min: ex.targetRepsMin, target_reps_max: ex.targetRepsMax,
              target_rir: ex.targetRir, rest_seconds: ex.restSeconds,
            }))
          );
        if (exError) throw exError;
      }
    }
  }

  return program.id;
}
