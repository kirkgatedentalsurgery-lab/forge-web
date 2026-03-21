'use client';

import {
  AreaChart, Area, XAxis, YAxis, Tooltip, ResponsiveContainer, ReferenceLine,
} from 'recharts';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';

interface ReadinessChartProps {
  data: { date: string; score: number }[];
}

export function ReadinessChart({ data }: ReadinessChartProps) {
  if (!data.length) {
    return (
      <Card>
        <CardHeader><CardTitle className="text-base">Readiness Trend</CardTitle></CardHeader>
        <CardContent>
          <p className="text-sm text-muted-foreground text-center py-8">No readiness data. Log daily check-ins to see trends.</p>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader><CardTitle className="text-base">Readiness Trend</CardTitle></CardHeader>
      <CardContent>
        <div className="h-48">
          <ResponsiveContainer width="100%" height="100%">
            <AreaChart data={data}>
              <defs>
                <linearGradient id="readinessGradient" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="#22C55E" stopOpacity={0.3} />
                  <stop offset="95%" stopColor="#22C55E" stopOpacity={0} />
                </linearGradient>
              </defs>
              <XAxis dataKey="date" tick={{ fontSize: 10, fill: '#8E8EA0' }} />
              <YAxis domain={[0, 100]} tick={{ fontSize: 10, fill: '#8E8EA0' }} />
              <Tooltip
                contentStyle={{ backgroundColor: '#12121A', border: '1px solid #2A2A38', borderRadius: 8, fontSize: 12 }}
                labelStyle={{ color: '#F0F0F5' }}
              />
              <ReferenceLine y={70} stroke="#F59E0B" strokeDasharray="3 3" label={{ value: 'Normal', fontSize: 10, fill: '#F59E0B' }} />
              <ReferenceLine y={55} stroke="#EF4444" strokeDasharray="3 3" label={{ value: 'Low', fontSize: 10, fill: '#EF4444' }} />
              <Area
                type="monotone"
                dataKey="score"
                stroke="#22C55E"
                strokeWidth={2}
                fill="url(#readinessGradient)"
              />
            </AreaChart>
          </ResponsiveContainer>
        </div>
      </CardContent>
    </Card>
  );
}
