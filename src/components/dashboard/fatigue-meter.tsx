'use client';

import { useEffect, useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Progress } from '@/components/ui/progress';
import { cn } from '@/lib/utils';
import { Activity } from 'lucide-react';

export function FatigueMeter() {
  const { user } = useAuth();
  const [fatigue, setFatigue] = useState<number | null>(null);
  const [label, setLabel] = useState('');

  useEffect(() => {
    if (!user) return;

    async function calculate() {
      const supabase = createClient();

      // Get recent workout feedback (last 5 sessions)
      const { data: feedback } = await supabase
        .from('workout_feedback')
        .select('perceived_difficulty, workout_sessions!inner(user_id, started_at)')
        .eq('workout_sessions.user_id', user!.id)
        .order('created_at', { ascending: false })
        .limit(5);

      // Get recent readiness
      const { data: readiness } = await supabase
        .from('readiness_logs')
        .select('readiness_score, soreness_level')
        .eq('user_id', user!.id)
        .order('logged_at', { ascending: false })
        .limit(5);

      if (!feedback?.length && !readiness?.length) return;

      // Fatigue score: higher = more fatigued (0-100)
      let score = 30; // baseline

      // Factor 1: Workout difficulty (1-10, higher = more fatigued)
      if (feedback?.length) {
        const avgDifficulty = feedback.reduce((s, f) => s + (f.perceived_difficulty || 5), 0) / feedback.length;
        score += (avgDifficulty / 10) * 30; // contributes up to 30 points
      }

      // Factor 2: Readiness (inverted — low readiness = high fatigue)
      if (readiness?.length) {
        const avgReadiness = readiness.reduce((s, r) => s + r.readiness_score, 0) / readiness.length;
        score += ((100 - avgReadiness) / 100) * 25; // contributes up to 25 points
      }

      // Factor 3: Soreness
      if (readiness?.length) {
        const avgSoreness = readiness.reduce((s, r) => s + (r.soreness_level || 3), 0) / readiness.length;
        score += (avgSoreness / 5) * 15; // contributes up to 15 points
      }

      score = Math.round(Math.min(100, Math.max(0, score)));

      let text: string;
      if (score <= 30) text = 'Fresh — push hard this week';
      else if (score <= 50) text = 'Moderate — training is sustainable';
      else if (score <= 70) text = 'Elevated — monitor recovery closely';
      else text = 'High — consider a deload soon';

      setFatigue(score);
      setLabel(text);
    }

    calculate();
  }, [user]);

  if (fatigue === null) return null;

  const color =
    fatigue <= 30 ? 'text-green-400' :
    fatigue <= 50 ? 'text-blue-400' :
    fatigue <= 70 ? 'text-yellow-400' :
    'text-red-400';

  const barColor =
    fatigue <= 30 ? '[&>div]:bg-green-500' :
    fatigue <= 50 ? '[&>div]:bg-blue-500' :
    fatigue <= 70 ? '[&>div]:bg-yellow-500' :
    '[&>div]:bg-red-500';

  return (
    <Card>
      <CardHeader className="pb-2">
        <CardTitle className="text-sm flex items-center gap-2">
          <Activity className="h-4 w-4 text-muted-foreground" />
          Fatigue Level
        </CardTitle>
      </CardHeader>
      <CardContent>
        <div className="flex items-center gap-3 mb-2">
          <span className={cn('text-2xl font-bold tabular-nums', color)}>{fatigue}</span>
          <span className="text-xs text-muted-foreground">/100</span>
        </div>
        <Progress value={fatigue} className={cn('h-2 mb-2', barColor)} />
        <p className="text-xs text-muted-foreground">{label}</p>
      </CardContent>
    </Card>
  );
}
