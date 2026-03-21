'use client';

import { useAuth } from '@/providers/auth-provider';
import { usePreferredUnit } from '@/hooks/use-user-profile';
import {
  useVolumeData, useE1rmTrends, usePersonalRecords,
  useWorkoutStats, useReadinessTrend, useMuscleBalance,
} from '@/hooks/use-analytics';
import { VolumeChart } from '@/components/analytics/volume-chart';
import { E1rmChart } from '@/components/analytics/e1rm-chart';
import { ReadinessChart } from '@/components/analytics/readiness-chart';
import { PrBoard } from '@/components/analytics/pr-board';
import { MuscleBalanceRadar } from '@/components/analytics/muscle-balance-radar';
import { StatsCards } from '@/components/analytics/stats-cards';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import { Skeleton } from '@/components/ui/skeleton';
import { MessageSquare } from 'lucide-react';

export default function AnalyticsPage() {
  const { user } = useAuth();
  const userId = user?.id;
  const unit = usePreferredUnit();

  const { data: volumeData, isLoading: volumeLoading } = useVolumeData(userId);
  const { data: e1rmData, isLoading: e1rmLoading } = useE1rmTrends(userId);
  const { data: prs, isLoading: prsLoading } = usePersonalRecords(userId);
  const { data: stats, isLoading: statsLoading } = useWorkoutStats(userId);
  const { data: readiness, isLoading: readinessLoading } = useReadinessTrend(userId);
  const { data: muscleBalance } = useMuscleBalance(userId);

  const isLoading = volumeLoading || e1rmLoading || prsLoading || statsLoading || readinessLoading;

  // Plain-English summaries
  const summaries: string[] = [];
  if (stats && stats.totalWorkouts > 0) {
    summaries.push(`You've completed ${stats.totalWorkouts} workout${stats.totalWorkouts !== 1 ? 's' : ''} total.`);
    if (stats.thisWeek > 0) {
      summaries.push(`${stats.thisWeek} session${stats.thisWeek !== 1 ? 's' : ''} logged this week.`);
    }
    if (stats.avgDurationMinutes > 0) {
      summaries.push(`Average session length: ${stats.avgDurationMinutes} minutes.`);
    }
  }
  if (prs && prs.length > 0) {
    const topPr = prs[0];
    summaries.push(`Strongest lift: ${topPr.exerciseName} with an estimated 1RM of ${topPr.e1rm} ${unit}.`);
  }
  if (readiness && readiness.length >= 3) {
    const recent = readiness.slice(-3);
    const avgScore = Math.round(recent.reduce((s, r) => s + r.score, 0) / recent.length);
    if (avgScore >= 80) summaries.push('Readiness is high — great time to push intensity.');
    else if (avgScore >= 60) summaries.push('Readiness is moderate — stick to the plan.');
    else summaries.push('Readiness is low — consider backing off volume or taking a deload.');
  }

  return (
    <div className="p-4 lg:p-6 max-w-4xl mx-auto space-y-6">
      <h1 className="text-2xl font-bold tracking-tight">Analytics</h1>

      {isLoading ? (
        <div className="space-y-4">
          <Skeleton className="h-20 w-full" />
          <Skeleton className="h-72 w-full" />
          <Skeleton className="h-64 w-full" />
        </div>
      ) : (
        <>
          {/* Stats overview */}
          <StatsCards
            totalWorkouts={stats?.totalWorkouts || 0}
            thisWeek={stats?.thisWeek || 0}
            avgDuration={stats?.avgDurationMinutes || 0}
          />

          {/* Plain-English summaries */}
          {summaries.length > 0 && (
            <Card>
              <CardHeader className="pb-2">
                <CardTitle className="text-sm flex items-center gap-2">
                  <MessageSquare className="h-4 w-4 text-primary" /> Coach Notes
                </CardTitle>
              </CardHeader>
              <CardContent>
                <ul className="space-y-1">
                  {summaries.map((s, i) => (
                    <li key={i} className="text-sm text-muted-foreground">{s}</li>
                  ))}
                </ul>
              </CardContent>
            </Card>
          )}

          {/* Charts */}
          <Tabs defaultValue="volume" className="w-full">
            <TabsList className="w-full">
              <TabsTrigger value="volume" className="flex-1">Volume</TabsTrigger>
              <TabsTrigger value="strength" className="flex-1">Strength</TabsTrigger>
              <TabsTrigger value="readiness" className="flex-1">Readiness</TabsTrigger>
              <TabsTrigger value="records" className="flex-1">PRs</TabsTrigger>
              <TabsTrigger value="balance" className="flex-1">Balance</TabsTrigger>
            </TabsList>

            <TabsContent value="volume" className="mt-4">
              <VolumeChart
                data={volumeData?.chartData || []}
                muscles={volumeData?.muscles || []}
              />
            </TabsContent>

            <TabsContent value="strength" className="mt-4">
              <E1rmChart data={e1rmData || []} />
            </TabsContent>

            <TabsContent value="readiness" className="mt-4">
              <ReadinessChart data={readiness || []} />
            </TabsContent>

            <TabsContent value="records" className="mt-4">
              <PrBoard records={prs || []} />
            </TabsContent>

            <TabsContent value="balance" className="mt-4">
              <MuscleBalanceRadar data={muscleBalance || []} />
            </TabsContent>
          </Tabs>
        </>
      )}
    </div>
  );
}
