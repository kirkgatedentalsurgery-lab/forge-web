'use client';

import {
  RadarChart, Radar, PolarGrid, PolarAngleAxis, PolarRadiusAxis,
  ResponsiveContainer, Tooltip,
} from 'recharts';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';

interface MuscleBalanceData {
  muscle: string;
  volume: number;
  target: number;
}

interface MuscleBalanceRadarProps {
  data: MuscleBalanceData[];
}

export function MuscleBalanceRadar({ data }: MuscleBalanceRadarProps) {
  if (!data.length) {
    return (
      <Card>
        <CardHeader><CardTitle className="text-base">Muscle Balance</CardTitle></CardHeader>
        <CardContent>
          <p className="text-sm text-muted-foreground text-center py-8">Complete workouts to see muscle balance.</p>
        </CardContent>
      </Card>
    );
  }

  // Normalize to percentage of target
  const chartData = data.map((d) => ({
    muscle: d.muscle,
    value: d.target > 0 ? Math.round((d.volume / d.target) * 100) : 0,
    fullMark: 150,
  }));

  return (
    <Card>
      <CardHeader><CardTitle className="text-base">Muscle Balance</CardTitle></CardHeader>
      <CardContent>
        <div className="h-72">
          <ResponsiveContainer width="100%" height="100%">
            <RadarChart data={chartData} cx="50%" cy="50%" outerRadius="70%">
              <PolarGrid stroke="#2A2A38" />
              <PolarAngleAxis
                dataKey="muscle"
                tick={{ fontSize: 10, fill: '#8E8EA0' }}
              />
              <PolarRadiusAxis
                angle={90}
                domain={[0, 150]}
                tick={{ fontSize: 9, fill: '#5A5A6E' }}
                tickFormatter={(v) => `${v}%`}
              />
              <Tooltip
                contentStyle={{ backgroundColor: '#12121A', border: '1px solid #2A2A38', borderRadius: 8, fontSize: 12 }}
                formatter={(value: any) => [`${value}% of target`, 'Volume']}
              />
              <Radar
                dataKey="value"
                stroke="#E63946"
                fill="#E63946"
                fillOpacity={0.2}
                strokeWidth={2}
              />
            </RadarChart>
          </ResponsiveContainer>
        </div>
        <p className="text-xs text-muted-foreground text-center mt-2">
          100% = hitting target volume. Below 80% = potential weak point.
        </p>
      </CardContent>
    </Card>
  );
}
