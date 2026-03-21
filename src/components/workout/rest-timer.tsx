'use client';

import { useEffect, useRef } from 'react';
import { useWorkoutStore } from '@/stores/workout-store';
import { Button } from '@/components/ui/button';
import { formatDuration } from '@/lib/utils';
import { X, Plus } from 'lucide-react';

export function RestTimer() {
  const { restTimer, tickRestTimer, stopRestTimer, startRestTimer } = useWorkoutStore();
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);

  useEffect(() => {
    if (restTimer.active && restTimer.remaining > 0) {
      intervalRef.current = setInterval(tickRestTimer, 1000);
    } else if (intervalRef.current) {
      clearInterval(intervalRef.current);
      intervalRef.current = null;
    }
    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current);
    };
  }, [restTimer.active, restTimer.remaining, tickRestTimer]);

  if (!restTimer.active) return null;

  const progress = restTimer.total > 0 ? restTimer.remaining / restTimer.total : 0;

  return (
    <div className="fixed bottom-16 lg:bottom-0 inset-x-0 lg:left-64 z-50 bg-primary px-4 py-4 rounded-t-2xl">
      <div className="max-w-lg mx-auto">
        <div className="flex items-center justify-between mb-3">
          <span className="text-sm font-medium text-primary-foreground/80">Rest Timer</span>
          <span className="text-3xl font-bold text-primary-foreground tabular-nums">
            {formatDuration(restTimer.remaining)}
          </span>
        </div>

        <div className="flex gap-2 mb-3">
          <Button
            variant="secondary"
            size="sm"
            className="flex-1 bg-white/20 text-white border-0 hover:bg-white/30"
            onClick={() => startRestTimer(restTimer.remaining + 30)}>
            <Plus className="h-4 w-4 mr-1" /> 30s
          </Button>
          <Button
            variant="secondary"
            size="sm"
            className="flex-1 bg-white/20 text-white border-0 hover:bg-white/30"
            onClick={stopRestTimer}>
            <X className="h-4 w-4 mr-1" /> Skip
          </Button>
        </div>

        {/* Progress bar */}
        <div className="h-1 bg-white/20 rounded-full overflow-hidden">
          <div
            className="h-full bg-white rounded-full transition-all duration-1000"
            style={{ width: `${progress * 100}%` }}
          />
        </div>
      </div>
    </div>
  );
}
