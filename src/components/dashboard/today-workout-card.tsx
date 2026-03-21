'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Dumbbell, Play, Plus } from 'lucide-react';

interface TodayData {
  programName: string;
  weekNumber: number;
  numWeeks: number;
  dayLabel: string;
  exerciseCount: number;
  targetRir: number;
}

export function TodayWorkoutCard() {
  const { user } = useAuth();
  const [data, setData] = useState<TodayData | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!user) { setLoading(false); return; }

    async function load() {
      const supabase = createClient();
      const { data: prog } = await supabase
        .from('programs')
        .select('id, name, current_week, current_day, num_weeks')
        .eq('user_id', user!.id).eq('status', 'active').single();

      if (!prog) { setLoading(false); return; }

      const { data: week } = await supabase
        .from('program_weeks')
        .select('id, target_rir')
        .eq('program_id', prog.id).eq('week_number', prog.current_week).single();

      if (!week) { setLoading(false); return; }

      const { data: day } = await supabase
        .from('program_days')
        .select('id, day_label')
        .eq('program_week_id', week.id).eq('day_number', prog.current_day).single();

      if (!day) { setLoading(false); return; }

      const { count } = await supabase
        .from('program_exercises')
        .select('*', { count: 'exact', head: true })
        .eq('program_day_id', day.id);

      setData({
        programName: prog.name,
        weekNumber: prog.current_week,
        numWeeks: prog.num_weeks,
        dayLabel: day.day_label,
        exerciseCount: count || 0,
        targetRir: week.target_rir,
      });
      setLoading(false);
    }

    load();
  }, [user]);

  if (loading) return null;

  if (!data) {
    return (
      <Card className="border-l-4 border-l-primary">
        <CardContent className="p-4">
          <div className="flex items-center gap-3">
            <div className="h-12 w-12 rounded-full bg-primary/10 flex items-center justify-center">
              <Dumbbell className="h-6 w-6 text-primary" />
            </div>
            <div className="flex-1">
              <p className="font-semibold">No Active Program</p>
              <p className="text-sm text-muted-foreground">Create a program to get started.</p>
            </div>
          </div>
          <Link href="/programs/create" className="block mt-3">
            <Button className="w-full" size="sm">
              <Plus className="h-4 w-4 mr-1" /> Create Program
            </Button>
          </Link>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card className="border-l-4 border-l-primary">
      <CardHeader className="pb-2">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-xs text-muted-foreground uppercase tracking-wider">{data.programName}</p>
            <CardTitle className="text-xl mt-0.5">{data.dayLabel}</CardTitle>
          </div>
          <div className="h-12 w-12 rounded-full bg-primary/10 flex items-center justify-center">
            <Dumbbell className="h-6 w-6 text-primary" />
          </div>
        </div>
      </CardHeader>
      <CardContent>
        <div className="flex gap-2 mb-3">
          <Badge variant="secondary">Week {data.weekNumber}/{data.numWeeks}</Badge>
          <Badge variant="secondary">RIR {data.targetRir}</Badge>
          <Badge variant="secondary">{data.exerciseCount} exercises</Badge>
        </div>
        <Link href="/workout">
          <Button className="w-full">
            <Play className="h-4 w-4 mr-2" /> Start Workout
          </Button>
        </Link>
      </CardContent>
    </Card>
  );
}
