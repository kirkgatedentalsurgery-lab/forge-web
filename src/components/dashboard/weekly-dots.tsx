'use client';

import { useEffect, useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { cn } from '@/lib/utils';
import { Check, Play, Minus } from 'lucide-react';

const DAYS = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

export function WeeklyDots() {
  const { user } = useAuth();
  const [completedDays, setCompletedDays] = useState<Set<number>>(new Set());

  useEffect(() => {
    if (!user) return;

    async function load() {
      const supabase = createClient();
      const now = new Date();
      const monday = new Date(now);
      monday.setDate(now.getDate() - ((now.getDay() + 6) % 7));
      monday.setHours(0, 0, 0, 0);

      const { data: sessions } = await supabase
        .from('workout_sessions')
        .select('started_at')
        .eq('user_id', user!.id)
        .not('completed_at', 'is', null)
        .gte('started_at', monday.toISOString());

      const days = new Set<number>();
      for (const s of sessions || []) {
        const d = new Date(s.started_at);
        days.add((d.getDay() + 6) % 7); // Monday = 0
      }
      setCompletedDays(days);
    }

    load();
  }, [user]);

  const todayIndex = (new Date().getDay() + 6) % 7;

  return (
    <Card>
      <CardHeader className="pb-2">
        <CardTitle className="text-sm">This Week</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="flex justify-between">
          {DAYS.map((day, i) => {
            const isCompleted = completedDays.has(i);
            const isToday = i === todayIndex;
            const isPast = i < todayIndex;

            return (
              <div key={day} className="flex flex-col items-center gap-1.5">
                <span className={cn(
                  'text-[10px] font-semibold uppercase',
                  isToday ? 'text-primary' : 'text-muted-foreground'
                )}>
                  {day}
                </span>
                <div className={cn(
                  'h-8 w-8 rounded-full flex items-center justify-center border transition-colors',
                  isCompleted
                    ? 'bg-green-500/20 border-green-500 text-green-500'
                    : isToday
                    ? 'border-primary bg-primary/10 text-primary'
                    : isPast
                    ? 'border-border text-muted-foreground/30'
                    : 'border-border/50 text-muted-foreground/20'
                )}>
                  {isCompleted ? (
                    <Check className="h-4 w-4" />
                  ) : isToday ? (
                    <Play className="h-3 w-3" />
                  ) : (
                    <Minus className="h-3 w-3" />
                  )}
                </div>
              </div>
            );
          })}
        </div>
      </CardContent>
    </Card>
  );
}
