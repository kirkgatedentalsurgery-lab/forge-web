'use client';

import {
  LineChart, Line, XAxis, YAxis, Tooltip, ResponsiveContainer,
} from 'recharts';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';

interface E1rmChartProps {
  data: { date: string; e1rm: number; exerciseName: string }[];
  title?: string;
}

export function E1rmChart({ data, title = 'Estimated 1RM Trend' }: E1rmChartProps) {
  if (!data.length) {
    return (
      <Card>
        <CardHeader><CardTitle className="text-base">{title}</CardTitle></CardHeader>
        <CardContent>
          <p className="text-sm text-muted-foreground text-center py-8">No e1RM data yet.</p>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader><CardTitle className="text-base">{title}</CardTitle></CardHeader>
      <CardContent>
        <div className="h-64">
          <ResponsiveContainer width="100%" height="100%">
            <LineChart data={data}>
              <XAxis dataKey="date" tick={{ fontSize: 11, fill: '#8E8EA0' }} />
              <YAxis tick={{ fontSize: 11, fill: '#8E8EA0' }} domain={['auto', 'auto']} />
              <Tooltip
                contentStyle={{ backgroundColor: '#12121A', border: '1px solid #2A2A38', borderRadius: 8, fontSize: 12 }}
                labelStyle={{ color: '#F0F0F5' }}
              />
              <Line
                type="monotone"
                dataKey="e1rm"
                stroke="#2E6FBB"
                strokeWidth={2}
                dot={{ fill: '#2E6FBB', r: 3 }}
                activeDot={{ r: 5 }}
              />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </CardContent>
    </Card>
  );
}
