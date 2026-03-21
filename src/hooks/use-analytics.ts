'use client';

import { useQuery } from '@tanstack/react-query';
import { createClient } from '@/lib/supabase/client';

// Weekly volume per muscle group
export function useVolumeData(userId: string | undefined, weeks: number = 8) {
  return useQuery({
    queryKey: ['analytics', 'volume', userId, weeks],
    enabled: !!userId,
    queryFn: async () => {
      const supabase = createClient();
      const since = new Date();
      since.setDate(since.getDate() - weeks * 7);

      const { data: sessions } = await supabase
        .from('workout_sessions')
        .select('id, started_at')
        .eq('user_id', userId!)
        .gte('started_at', since.toISOString())
        .not('completed_at', 'is', null)
        .order('started_at');

      if (!sessions?.length) return { chartData: [] as Record<string, string | number>[], muscles: [] as string[] };

      const sessionIds = sessions.map((s) => s.id);
      const { data: sets } = await supabase
        .from('workout_sets')
        .select('workout_session_id, exercise_id, is_completed')
        .in('workout_session_id', sessionIds)
        .eq('is_completed', true);

      if (!sets?.length) return { chartData: [] as Record<string, string | number>[], muscles: [] as string[] };

      // Get exercise → muscle group mapping
      const exerciseIds = [...new Set(sets.map((s) => s.exercise_id))];
      const { data: emgs } = await supabase
        .from('exercise_muscle_groups')
        .select('exercise_id, muscle_group_id, role, stimulus_magnitude, muscle_groups(name, display_name)')
        .in('exercise_id', exerciseIds)
        .eq('role', 'primary');

      const exerciseMuscleMap = new Map<string, { name: string; displayName: string }>();
      for (const emg of emgs || []) {
        const mg = emg.muscle_groups as any;
        if (mg) exerciseMuscleMap.set(emg.exercise_id, { name: mg.name, displayName: mg.display_name });
      }

      // Group by week and muscle
      const sessionDateMap = new Map(sessions.map((s) => [s.id, new Date(s.started_at)]));
      const weeklyVolume = new Map<string, Map<string, number>>();

      for (const set of sets) {
        const date = sessionDateMap.get(set.workout_session_id);
        if (!date) continue;
        const weekLabel = getWeekLabel(date);
        const muscle = exerciseMuscleMap.get(set.exercise_id);
        if (!muscle) continue;

        if (!weeklyVolume.has(weekLabel)) weeklyVolume.set(weekLabel, new Map());
        const weekMap = weeklyVolume.get(weekLabel)!;
        weekMap.set(muscle.displayName, (weekMap.get(muscle.displayName) || 0) + 1);
      }

      // Convert to chart data
      const allMuscles = [...new Set([...exerciseMuscleMap.values()].map((m) => m.displayName))];
      const chartData = [...weeklyVolume.entries()]
        .sort(([a], [b]) => a.localeCompare(b))
        .map(([week, muscles]) => {
          const row: Record<string, string | number> = { week };
          for (const muscle of allMuscles) {
            row[muscle] = muscles.get(muscle) || 0;
          }
          return row;
        });

      return { chartData, muscles: allMuscles };
    },
  });
}

// e1RM trends per exercise
export function useE1rmTrends(userId: string | undefined, exerciseId?: string) {
  return useQuery({
    queryKey: ['analytics', 'e1rm', userId, exerciseId],
    enabled: !!userId,
    queryFn: async () => {
      const supabase = createClient();
      let query = supabase
        .from('e1rm_history')
        .select('exercise_id, e1rm, recorded_at, exercises(name)')
        .eq('user_id', userId!)
        .order('recorded_at');

      if (exerciseId) {
        query = query.eq('exercise_id', exerciseId);
      }

      const { data } = await query;
      if (!data?.length) return [];

      return data.map((d: any) => ({
        date: new Date(d.recorded_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric' }),
        e1rm: Math.round(d.e1rm),
        exerciseName: d.exercises?.name || 'Unknown',
        exerciseId: d.exercise_id,
      }));
    },
  });
}

// Personal records
export function usePersonalRecords(userId: string | undefined) {
  return useQuery({
    queryKey: ['analytics', 'prs', userId],
    enabled: !!userId,
    queryFn: async () => {
      const supabase = createClient();
      const { data } = await supabase
        .from('user_exercise_history')
        .select('exercise_id, best_weight, best_reps_at_best_weight, estimated_1rm, last_performed_at, exercises(name)')
        .eq('user_id', userId!)
        .not('best_weight', 'is', null)
        .order('estimated_1rm', { ascending: false })
        .limit(20);

      return (data || []).map((d: any) => ({
        exerciseName: d.exercises?.name || 'Unknown',
        bestWeight: d.best_weight,
        bestReps: d.best_reps_at_best_weight,
        e1rm: d.estimated_1rm ? Math.round(d.estimated_1rm) : null,
        lastPerformed: d.last_performed_at,
      }));
    },
  });
}

// Workout stats
export function useWorkoutStats(userId: string | undefined) {
  return useQuery({
    queryKey: ['analytics', 'stats', userId],
    enabled: !!userId,
    queryFn: async () => {
      const supabase = createClient();

      const { count: totalWorkouts } = await supabase
        .from('workout_sessions')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', userId!)
        .not('completed_at', 'is', null);

      const weekAgo = new Date();
      weekAgo.setDate(weekAgo.getDate() - 7);
      const { count: thisWeek } = await supabase
        .from('workout_sessions')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', userId!)
        .not('completed_at', 'is', null)
        .gte('started_at', weekAgo.toISOString());

      const { data: recentSessions } = await supabase
        .from('workout_sessions')
        .select('duration_seconds')
        .eq('user_id', userId!)
        .not('completed_at', 'is', null)
        .order('started_at', { ascending: false })
        .limit(10);

      const avgDuration = recentSessions?.length
        ? Math.round(
            recentSessions.reduce((sum, s) => sum + (s.duration_seconds || 0), 0) /
              recentSessions.length / 60
          )
        : 0;

      return {
        totalWorkouts: totalWorkouts || 0,
        thisWeek: thisWeek || 0,
        avgDurationMinutes: avgDuration,
      };
    },
  });
}

// Readiness trend
export function useReadinessTrend(userId: string | undefined, days: number = 30) {
  return useQuery({
    queryKey: ['analytics', 'readiness', userId, days],
    enabled: !!userId,
    queryFn: async () => {
      const supabase = createClient();
      const since = new Date();
      since.setDate(since.getDate() - days);

      const { data } = await supabase
        .from('readiness_logs')
        .select('logged_at, readiness_score')
        .eq('user_id', userId!)
        .gte('logged_at', since.toISOString().split('T')[0])
        .order('logged_at');

      return (data || []).map((d: any) => ({
        date: new Date(d.logged_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric' }),
        score: d.readiness_score,
      }));
    },
  });
}

// Muscle balance (current weekly volume vs MAV targets)
export function useMuscleBalance(userId: string | undefined) {
  return useQuery({
    queryKey: ['analytics', 'muscle-balance', userId],
    enabled: !!userId,
    queryFn: async () => {
      const supabase = createClient();

      // Get this week's sessions
      const weekAgo = new Date();
      weekAgo.setDate(weekAgo.getDate() - 7);

      const { data: sessions } = await supabase
        .from('workout_sessions')
        .select('id')
        .eq('user_id', userId!)
        .not('completed_at', 'is', null)
        .gte('started_at', weekAgo.toISOString());

      if (!sessions?.length) return [];

      const { data: sets } = await supabase
        .from('workout_sets')
        .select('exercise_id')
        .in('workout_session_id', sessions.map((s) => s.id))
        .eq('is_completed', true);

      if (!sets?.length) return [];

      // Map exercises to primary muscle groups
      const exerciseIds = [...new Set(sets.map((s) => s.exercise_id))];
      const { data: emgs } = await supabase
        .from('exercise_muscle_groups')
        .select('exercise_id, stimulus_magnitude, muscle_groups(display_name, mav)')
        .in('exercise_id', exerciseIds)
        .eq('role', 'primary');

      // Count sets per muscle
      const muscleSets = new Map<string, { volume: number; target: number }>();
      for (const set of sets) {
        const mappings = (emgs || []).filter((e: any) => e.exercise_id === set.exercise_id);
        for (const m of mappings) {
          const mg = m.muscle_groups as any;
          if (!mg) continue;
          const current = muscleSets.get(mg.display_name) || { volume: 0, target: mg.mav || 14 };
          current.volume += parseFloat(m.stimulus_magnitude) || 1;
          muscleSets.set(mg.display_name, current);
        }
      }

      return [...muscleSets.entries()].map(([muscle, data]) => ({
        muscle,
        volume: Math.round(data.volume),
        target: data.target,
      }));
    },
  });
}

function getWeekLabel(date: Date): string {
  const start = new Date(date);
  start.setDate(start.getDate() - start.getDay());
  return start.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
}
