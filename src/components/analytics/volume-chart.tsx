'use client';

import {
  BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, Legend,
} from 'recharts';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';

const MUSCLE_COLORS: Record<string, string> = {
  Chest: '#ef4444', Back: '#3b82f6', Quads: '#22c55e', Hamstrings: '#84cc16',
  Glutes: '#ec4899', 'Side Delts': '#f59e0b', 'Front Delts': '#f97316',
  'Rear Delts': '#d97706', Biceps: '#8b5cf6', Triceps: '#a855f7',
  Calves: '#14b8a6', Abs: '#06b6d4', Traps: '#6366f1', Forearms: '#78716c',
};

interface VolumeChartProps {
  data: Record<string, string | number>[];
  muscles: string[];
}

export function VolumeChart({ data, muscles }: VolumeChartProps) {
  if (!data.length) {
    return (
      <Card>
        <CardHeader><CardTitle className="text-base">Weekly Volume by Muscle</CardTitle></CardHeader>
        <CardContent>
          <p className="text-sm text-muted-foreground text-center py-8">No data yet. Complete workouts to see volume trends.</p>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader><CardTitle className="text-base">Weekly Volume by Muscle</CardTitle></CardHeader>
      <CardContent>
        <div className="h-72">
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={data}>
              <XAxis dataKey="week" tick={{ fontSize: 11, fill: '#8E8EA0' }} />
              <YAxis tick={{ fontSize: 11, fill: '#8E8EA0' }} label={{ value: 'Sets', angle: -90, position: 'insideLeft', style: { fontSize: 11, fill: '#8E8EA0' } }} />
              <Tooltip
                contentStyle={{ backgroundColor: '#12121A', border: '1px solid #2A2A38', borderRadius: 8, fontSize: 12 }}
                labelStyle={{ color: '#F0F0F5' }}
              />
              <Legend wrapperStyle={{ fontSize: 11 }} />
              {muscles.map((muscle) => (
                <Bar
                  key={muscle}
                  dataKey={muscle}
                  stackId="volume"
                  fill={MUSCLE_COLORS[muscle] || '#6b7280'}
                  radius={[2, 2, 0, 0]}
                />
              ))}
            </BarChart>
          </ResponsiveContainer>
        </div>
      </CardContent>
    </Card>
  );
}
