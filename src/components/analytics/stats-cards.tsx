'use client';

import { Card, CardContent } from '@/components/ui/card';
import { Calendar, Flame, Clock, TrendingUp } from 'lucide-react';

interface StatsCardsProps {
  totalWorkouts: number;
  thisWeek: number;
  avgDuration: number;
}

export function StatsCards({ totalWorkouts, thisWeek, avgDuration }: StatsCardsProps) {
  const stats = [
    { label: 'Total Workouts', value: totalWorkouts, icon: Calendar },
    { label: 'This Week', value: thisWeek, icon: Flame },
    { label: 'Avg Duration', value: `${avgDuration}m`, icon: Clock },
  ];

  return (
    <div className="grid grid-cols-3 gap-3">
      {stats.map((stat) => (
        <Card key={stat.label}>
          <CardContent className="pt-4 pb-4 text-center">
            <stat.icon className="h-5 w-5 text-muted-foreground mx-auto mb-1" />
            <p className="text-2xl font-bold tabular-nums">{stat.value}</p>
            <p className="text-[10px] text-muted-foreground uppercase tracking-wider">{stat.label}</p>
          </CardContent>
        </Card>
      ))}
    </div>
  );
}
