'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { useAuth } from '@/providers/auth-provider';
import { createClient } from '@/lib/supabase/client';
import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
import { Clock, Dumbbell } from 'lucide-react';
import { formatDuration } from '@/lib/utils';

interface SessionSummary {
  id: string;
  started_at: string;
  completed_at: string | null;
  duration_seconds: number | null;
  overall_fatigue: number | null;
  dayLabel: string | null;
  setCount: number;
}

export default function HistoryPage() {
  const { user } = useAuth();
  const [sessions, setSessions] = useState<SessionSummary[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!user) return;

    async function load() {
      const supabase = createClient();

      const { data: rawSessions } = await supabase
        .from('workout_sessions')
        .select('id, started_at, completed_at, duration_seconds, overall_fatigue, program_day_id')
        .eq('user_id', user!.id)
        .not('completed_at', 'is', null)
        .order('started_at', { ascending: false })
        .limit(50);

      if (!rawSessions?.length) { setLoading(false); return; }

      const dayIds = rawSessions.map((s) => s.program_day_id).filter(Boolean);
      const { data: days } = dayIds.length
        ? await supabase.from('program_days').select('id, day_label').in('id', dayIds)
        : { data: [] };
      const dayMap = new Map((days || []).map((d: any) => [d.id, d.day_label]));

      const sessionIds = rawSessions.map((s) => s.id);
      const { data: sets } = await supabase
        .from('workout_sets')
        .select('workout_session_id')
        .in('workout_session_id', sessionIds)
        .eq('is_completed', true);

      const setCountMap = new Map<string, number>();
      for (const s of sets || []) {
        setCountMap.set(s.workout_session_id, (setCountMap.get(s.workout_session_id) || 0) + 1);
      }

      setSessions(
        rawSessions.map((s) => ({
          id: s.id,
          started_at: s.started_at,
          completed_at: s.completed_at,
          duration_seconds: s.duration_seconds,
          overall_fatigue: s.overall_fatigue,
          dayLabel: dayMap.get(s.program_day_id) || null,
          setCount: setCountMap.get(s.id) || 0,
        }))
      );
      setLoading(false);
    }

    load();
  }, [user]);

  if (loading) {
    return (
      <div className="p-4 lg:p-6 max-w-2xl mx-auto space-y-3">
        <h1 className="text-2xl font-bold tracking-tight mb-4">History</h1>
        {[...Array(5)].map((_, i) => <Skeleton key={i} className="h-20 w-full" />)}
      </div>
    );
  }

  return (
    <div className="p-4 lg:p-6 max-w-2xl mx-auto">
      <h1 className="text-2xl font-bold tracking-tight mb-6">History</h1>

      {sessions.length === 0 ? (
        <div className="flex flex-col items-center justify-center py-16 text-center">
          <div className="h-16 w-16 rounded-full bg-primary/10 flex items-center justify-center mb-4">
            <Clock className="h-8 w-8 text-primary" />
          </div>
          <h2 className="text-xl font-semibold mb-2">No Workout History</h2>
          <p className="text-muted-foreground max-w-sm">Complete your first workout to see it here.</p>
        </div>
      ) : (
        <div className="space-y-3">
          {sessions.map((session) => {
            const date = new Date(session.started_at);
            return (
              <Link key={session.id} href={`/history/${session.id}`}>
              <Card className="hover:border-primary/50 transition-colors cursor-pointer">
                <CardContent className="p-4 flex items-center gap-4">
                  <div className="h-12 w-12 rounded-xl bg-primary/10 flex flex-col items-center justify-center shrink-0">
                    <span className="text-xs font-bold text-primary uppercase">
                      {date.toLocaleDateString('en-US', { weekday: 'short' })}
                    </span>
                    <span className="text-lg font-bold text-primary leading-none">
                      {date.getDate()}
                    </span>
                  </div>

                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-semibold truncate">
                      {session.dayLabel || 'Workout'}
                    </p>
                    <div className="flex items-center gap-3 text-xs text-muted-foreground mt-0.5">
                      <span className="flex items-center gap-1">
                        <Dumbbell className="h-3 w-3" /> {session.setCount} sets
                      </span>
                      {session.duration_seconds && (
                        <span className="flex items-center gap-1">
                          <Clock className="h-3 w-3" /> {formatDuration(session.duration_seconds)}
                        </span>
                      )}
                    </div>
                  </div>

                  {session.overall_fatigue && (
                    <Badge variant="secondary" className="text-xs">
                      RPE {session.overall_fatigue}
                    </Badge>
                  )}
                </CardContent>
              </Card>
              </Link>
            );
          })}
        </div>
      )}
    </div>
  );
}
