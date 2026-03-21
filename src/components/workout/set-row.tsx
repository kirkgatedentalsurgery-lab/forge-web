'use client';

import { useState } from 'react';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { cn } from '@/lib/utils';
import { Check, Minus, Plus, AlertTriangle, Copy, Undo2, Trophy } from 'lucide-react';
import { ActiveSet } from '@/stores/workout-store';

interface SetRowProps {
  set: ActiveSet;
  isCurrent: boolean;
  targetRepsMin: number;
  targetRepsMax: number;
  unit?: string;
  previousBest?: { weight: number; reps: number } | null;
  isPR?: boolean;
  onUpdate: (data: Partial<ActiveSet>) => void;
  onComplete: () => void;
  onUndo?: () => void;
  onTogglePain: () => void;
}

export function SetRow({
  set, isCurrent, targetRepsMin, targetRepsMax,
  unit = 'lbs', previousBest, isPR, onUpdate, onComplete, onUndo, onTogglePain,
}: SetRowProps) {
  // Completed — collapsed with undo option
  if (set.isCompleted) {
    return (
      <div className={cn(
        'flex items-center gap-3 py-2.5 px-3 rounded-lg mb-2 transition-all',
        isPR ? 'bg-yellow-500/10 border border-yellow-500/30' : 'bg-secondary/50'
      )}>
        <div className={cn(
          'h-7 w-7 rounded-full flex items-center justify-center',
          isPR ? 'bg-yellow-500/20' : 'bg-green-500/20'
        )}>
          {isPR ? (
            <Trophy className="h-4 w-4 text-yellow-500" />
          ) : (
            <Check className="h-4 w-4 text-green-500" />
          )}
        </div>
        <span className="text-xs text-muted-foreground font-semibold uppercase w-10">Set {set.setNumber}</span>
        <span className="text-sm font-semibold flex-1 tabular-nums">
          {set.weight ?? '—'} {unit} × {set.reps ?? '—'}
        </span>
        <Badge variant="secondary" className="text-xs">RIR {set.rir ?? '—'}</Badge>
        {isPR && <Badge className="text-[10px] bg-yellow-500 text-black">PR</Badge>}
        {set.painFlag && <AlertTriangle className="h-4 w-4 text-destructive" />}
        {onUndo && (
          <button onClick={onUndo} className="text-muted-foreground hover:text-foreground transition-colors">
            <Undo2 className="h-4 w-4" />
          </button>
        )}
      </div>
    );
  }

  // Upcoming — muted
  if (!isCurrent) {
    return (
      <div className="flex items-center gap-3 py-2.5 px-3 rounded-lg border border-dashed border-border/50 mb-2 opacity-50">
        <div className="h-7 w-7 rounded-full bg-muted flex items-center justify-center">
          <span className="text-xs text-muted-foreground">{set.setNumber}</span>
        </div>
        <span className="text-xs text-muted-foreground">
          {set.weight ? `${set.weight} ${unit}` : ''} × {targetRepsMin}-{targetRepsMax}
        </span>
      </div>
    );
  }

  // Current — expanded inputs
  return (
    <div className="p-4 rounded-xl border-2 border-primary bg-primary/5 mb-2 space-y-4">
      <div className="flex items-center justify-between">
        <span className="text-xs font-bold uppercase tracking-widest text-primary">Set {set.setNumber}</span>
        <span className="text-xs font-semibold uppercase text-primary">Current</span>
      </div>

      {/* One-tap: match previous best */}
      {previousBest && (!set.weight || !set.reps) && (
        <button
          onClick={() => onUpdate({ weight: previousBest.weight, reps: previousBest.reps })}
          className="w-full flex items-center gap-2 p-2.5 rounded-lg border border-dashed border-primary/30 bg-primary/5 hover:bg-primary/10 transition-colors">
          <Copy className="h-4 w-4 text-primary" />
          <span className="text-sm text-primary font-medium">
            Match previous: {previousBest.weight} {unit} × {previousBest.reps}
          </span>
        </button>
      )}

      {/* Weight + Reps row */}
      <div className="grid grid-cols-2 gap-3">
        <div className="space-y-1.5">
          <label className="text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
            Weight ({unit})
          </label>
          <div className="flex gap-1">
            <Button
              variant="secondary" size="sm" className="h-11 w-10 px-0"
              onClick={() => onUpdate({ weight: Math.max(0, (set.weight ?? 0) - 2.5) })}>
              <Minus className="h-4 w-4" />
            </Button>
            <Input
              type="number"
              inputMode="decimal"
              className="h-11 text-center text-lg font-bold"
              value={set.weight ?? ''}
              onChange={(e) => onUpdate({ weight: parseFloat(e.target.value) || 0 })}
              placeholder="0"
            />
            <Button
              variant="secondary" size="sm" className="h-11 w-10 px-0"
              onClick={() => onUpdate({ weight: (set.weight ?? 0) + 2.5 })}>
              <Plus className="h-4 w-4" />
            </Button>
          </div>
        </div>

        <div className="space-y-1.5">
          <label className="text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
            Reps
          </label>
          <div className="flex gap-1">
            <Button
              variant="secondary" size="sm" className="h-11 w-10 px-0"
              onClick={() => onUpdate({ reps: Math.max(0, (set.reps ?? 0) - 1) })}>
              <Minus className="h-4 w-4" />
            </Button>
            <Input
              type="number"
              inputMode="numeric"
              className="h-11 text-center text-lg font-bold"
              value={set.reps ?? ''}
              onChange={(e) => onUpdate({ reps: parseInt(e.target.value) || 0 })}
              placeholder="0"
            />
            <Button
              variant="secondary" size="sm" className="h-11 w-10 px-0"
              onClick={() => onUpdate({ reps: (set.reps ?? 0) + 1 })}>
              <Plus className="h-4 w-4" />
            </Button>
          </div>
        </div>
      </div>

      {/* RIR selector */}
      <div className="space-y-1.5">
        <label className="text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
          RIR (Reps in Reserve)
        </label>
        <div className="flex gap-2">
          {[0, 1, 2, 3, 4].map((rir) => (
            <button
              key={rir}
              onClick={() => onUpdate({ rir })}
              className={cn(
                'flex-1 h-11 rounded-lg font-bold text-sm transition-colors border',
                set.rir === rir
                  ? rir <= 1 ? 'bg-red-500 text-white border-red-500'
                    : rir === 2 ? 'bg-yellow-500 text-white border-yellow-500'
                    : 'bg-green-500 text-white border-green-500'
                  : 'bg-secondary border-border text-muted-foreground hover:border-primary/50'
              )}>
              {rir}
            </button>
          ))}
        </div>
      </div>

      {/* Actions row */}
      <div className="flex gap-2">
        <Button
          className="flex-1 h-12 text-sm font-bold uppercase tracking-wider active:scale-[0.97] transition-transform"
          disabled={set.weight == null || set.reps == null || set.rir == null}
          onClick={onComplete}>
          Log Set
        </Button>
        <Button
          variant={set.painFlag ? 'destructive' : 'secondary'}
          size="sm"
          className="h-12 w-12 px-0"
          onClick={onTogglePain}
          title="Pain flag">
          <AlertTriangle className="h-5 w-5" />
        </Button>
      </div>
    </div>
  );
}
