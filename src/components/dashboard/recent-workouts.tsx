'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { formatDuration } from '@/lib/utils';
import { Clock, Dumbbell } from 'lucide-react';

export function RecentWorkouts() {
  const { user } = useAuth();
  const [sessions, setSessions] = useState<any[]>([]);

  useEffect(() => {
    if (!user) return;

    async function load() {
      const supabase = createClient();
      const { data } = await supabase
        .from('workout_sessions')
        .select('id, started_at, duration_seconds, overall_fatigue, program_day_id')
        .eq('user_id', user!.id)
        .not('completed_at', 'is', null)
        .order('started_at', { ascending: false })
        .limit(3);

      if (!data?.length) return;

      const dayIds = data.map((s) => s.program_day_id).filter(Boolean);
      const { data: days } = dayIds.length
        ? await supabase.from('program_days').select('id, day_label').in('id', dayIds)
        : { data: [] };
      const dayMap = new Map((days || []).map((d: any) => [d.id, d.day_label]));

      setSessions(data.map((s) => ({
        ...s,
        dayLabel: dayMap.get(s.program_day_id) || 'Workout',
      })));
    }

    load();
  }, [user]);

  if (sessions.length === 0) return null;

  return (
    <Card>
      <CardHeader className="pb-2">
        <CardTitle className="text-sm">Recent Workouts</CardTitle>
      </CardHeader>
      <CardContent className="p-0">
        <div className="divide-y divide-border">
          {sessions.map((s) => {
            const date = new Date(s.started_at);
            return (
              <Link key={s.id} href={`/history/${s.id}`}>
                <div className="flex items-center gap-3 px-4 py-3 hover:bg-secondary/50 transition-colors">
                  <div className="h-9 w-9 rounded-lg bg-primary/10 flex flex-col items-center justify-center shrink-0">
                    <span className="text-[9px] font-bold text-primary uppercase">
                      {date.toLocaleDateString('en-US', { weekday: 'short' })}
                    </span>
                    <span className="text-sm font-bold text-primary leading-none">
                      {date.getDate()}
                    </span>
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium truncate">{s.dayLabel}</p>
                    <p className="text-xs text-muted-foreground">
                      {s.duration_seconds ? formatDuration(s.duration_seconds) : '—'}
                    </p>
                  </div>
                </div>
              </Link>
            );
          })}
        </div>
      </CardContent>
    </Card>
  );
}
