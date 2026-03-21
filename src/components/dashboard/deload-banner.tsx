'use client';

import { useEffect, useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';
import { detectDeload, DeloadInput, DeloadResult } from '@/engines/deload-detector';
import { DeloadAlert } from './deload-alert';

export function DeloadBanner() {
  const { user } = useAuth();
  const [result, setResult] = useState<DeloadResult | null>(null);

  useEffect(() => {
    if (!user) return;

    async function check() {
      const supabase = createClient();

      // Get recent session difficulties
      const { data: feedback } = await supabase
        .from('workout_feedback')
        .select('perceived_difficulty, workout_sessions!inner(user_id)')
        .eq('workout_sessions.user_id', user!.id)
        .order('created_at', { ascending: false })
        .limit(5);

      const recentDifficulties = (feedback || []).map((f: any) => f.perceived_difficulty || 5);

      // Get recent readiness scores
      const { data: readiness } = await supabase
        .from('readiness_logs')
        .select('readiness_score')
        .eq('user_id', user!.id)
        .order('logged_at', { ascending: false })
        .limit(7);

      const recentReadiness = (readiness || []).map((r: any) => r.readiness_score);

      // Get recent sleep
      const recentSleep = (readiness || []).map(() => 3); // default if not tracked separately

      // Get pain flag count from recent sessions
      const { data: recentSessions } = await supabase
        .from('workout_sessions')
        .select('id')
        .eq('user_id', user!.id)
        .not('completed_at', 'is', null)
        .order('started_at', { ascending: false })
        .limit(3);

      let painCount = 0;
      if (recentSessions?.length) {
        const { count } = await supabase
          .from('workout_sets')
          .select('*', { count: 'exact', head: true })
          .in('workout_session_id', recentSessions.map((s) => s.id))
          .eq('pain_flag', true);
        painCount = count || 0;
      }

      // Get completion rates (completed sets / target sets)
      const recentCompletionRates = recentDifficulties.length > 0
        ? recentDifficulties.map(() => 0.85) // approximate
        : [];

      const input: DeloadInput = {
        recentSessionRatings: recentDifficulties,
        recentReadinessScores: recentReadiness,
        e1rmTrending: 'flat',
        recentSleepScores: recentSleep,
        painFlagCount: painCount,
        recentCompletionRates: recentCompletionRates,
      };

      const deloadResult = detectDeload(input);
      if (deloadResult.shouldDeload) {
        setResult(deloadResult);
      }
    }

    check();
  }, [user]);

  if (!result) return null;

  return <DeloadAlert result={result} />;
}
