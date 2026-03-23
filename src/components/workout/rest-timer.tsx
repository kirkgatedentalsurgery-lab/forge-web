'use client';

import { useEffect, useRef } from 'react';
import { useWorkoutStore } from '@/stores/workout-store';
import { Button } from '@/components/ui/button';
import { formatDuration } from '@/lib/utils';
import { X, Plus } from 'lucide-react';

function playBeep() {
  try {
    const ctx = new AudioContext();
    const osc = ctx.createOscillator();
    const gain = ctx.createGain();
    osc.connect(gain);
    gain.connect(ctx.destination);
    osc.frequency.value = 880;
    gain.gain.value = 0.3;
    osc.start();
    osc.stop(ctx.currentTime + 0.15);
    // Second beep after short pause
    setTimeout(() => {
      const osc2 = ctx.createOscillator();
      const gain2 = ctx.createGain();
      osc2.connect(gain2);
      gain2.connect(ctx.destination);
      osc2.frequency.value = 1100;
      gain2.gain.value = 0.3;
      osc2.start();
      osc2.stop(ctx.currentTime + 0.2);
    }, 200);
    navigator.vibrate?.([200, 100, 200]);
  } catch {}
}

export function RestTimer() {
  const { restTimer, tickRestTimer, stopRestTimer, startRestTimer } = useWorkoutStore();
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const prevRemaining = useRef(restTimer.remaining);

  useEffect(() => {
    if (restTimer.active && restTimer.remaining > 0) {
      intervalRef.current = setInterval(tickRestTimer, 1000);
    } else if (intervalRef.current) {
      clearInterval(intervalRef.current);
      intervalRef.current = null;
    }
    // Play beep when timer reaches 0 (was previously > 0)
    if (restTimer.remaining === 0 && prevRemaining.current > 0 && !restTimer.active) {
      playBeep();
    }
    prevRemaining.current = restTimer.remaining;
    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current);
    };
  }, [restTimer.active, restTimer.remaining, tickRestTimer]);

  // Recover rest timer when tab regains focus
  useEffect(() => {
    const handleVisibility = () => {
      if (document.visibilityState === 'visible' && restTimer.active) {
        tickRestTimer();
      }
    };
    document.addEventListener('visibilitychange', handleVisibility);
    return () => document.removeEventListener('visibilitychange', handleVisibility);
  }, [restTimer.active, tickRestTimer]);

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
