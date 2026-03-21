'use client';

import { useAuth } from '@/providers/auth-provider';
import { useWorkoutStats } from '@/hooks/use-analytics';
import { ReadinessCheckin } from '@/components/dashboard/readiness-checkin';
import { TodayWorkoutCard } from '@/components/dashboard/today-workout-card';
import { WeeklyDots } from '@/components/dashboard/weekly-dots';
import { DeloadBanner } from '@/components/dashboard/deload-banner';
import { RecentWorkouts } from '@/components/dashboard/recent-workouts';
import { FatigueMeter } from '@/components/dashboard/fatigue-meter';
import { StatsCards } from '@/components/analytics/stats-cards';
import { Skeleton } from '@/components/ui/skeleton';

export default function DashboardPage() {
  const { user, loading: authLoading } = useAuth();
  const { data: stats, isLoading: statsLoading } = useWorkoutStats(user?.id);
  const displayName = user?.user_metadata?.display_name || 'Athlete';

  if (authLoading) {
    return (
      <div className="p-4 lg:p-6 space-y-5 max-w-2xl mx-auto">
        <Skeleton className="h-12 w-48" />
        <Skeleton className="h-32 w-full" />
        <Skeleton className="h-40 w-full" />
        <Skeleton className="h-20 w-full" />
        <Skeleton className="h-24 w-full" />
      </div>
    );
  }

  return (
    <div className="p-4 lg:p-6 space-y-5 max-w-2xl mx-auto">
      {/* Greeting */}
      <div>
        <p className="text-sm text-muted-foreground">Welcome back,</p>
        <h1 className="text-2xl font-bold tracking-tight">{displayName}</h1>
      </div>

      {/* Deload alert (only shows if triggered) */}
      <DeloadBanner />

      {/* Readiness Check-in */}
      <ReadinessCheckin />

      {/* Today's Workout */}
      <TodayWorkoutCard />

      {/* Fatigue + Weekly side by side on larger screens */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
        <FatigueMeter />
        <WeeklyDots />
      </div>

      {/* Quick Stats */}
      {statsLoading ? (
        <div className="grid grid-cols-3 gap-3">
          <Skeleton className="h-20" />
          <Skeleton className="h-20" />
          <Skeleton className="h-20" />
        </div>
      ) : (
        <StatsCards
          totalWorkouts={stats?.totalWorkouts || 0}
          thisWeek={stats?.thisWeek || 0}
          avgDuration={stats?.avgDurationMinutes || 0}
        />
      )}

      {/* Recent Workouts */}
      <RecentWorkouts />
    </div>
  );
}
