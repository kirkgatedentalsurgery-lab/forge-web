'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { cn } from '@/lib/utils';

export interface WorkoutFeedback {
  difficulty: number; // 1-10
  pump: number; // 1-5
  mood: number; // 1-5
}

interface FeedbackSheetProps {
  onSubmit: (feedback: WorkoutFeedback) => void;
  onSkip: () => void;
}

const DIFFICULTY = [
  { value: 3, emoji: '😌', label: 'Easy' },
  { value: 5, emoji: '👍', label: 'Good' },
  { value: 7, emoji: '💪', label: 'Hard' },
  { value: 9, emoji: '😤', label: 'Brutal' },
];

const PUMP = [
  { value: 1, label: 'None' },
  { value: 2, label: 'Mild' },
  { value: 3, label: 'Moderate' },
  { value: 4, label: 'Good' },
  { value: 5, label: 'Insane' },
];

export function FeedbackSheet({ onSubmit, onSkip }: FeedbackSheetProps) {
  const [difficulty, setDifficulty] = useState<number | null>(null);
  const [pump, setPump] = useState<number | null>(null);

  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-xl font-bold">How was that session?</h2>
        <p className="text-sm text-muted-foreground">This feeds into your auto-regulation.</p>
      </div>

      {/* Difficulty */}
      <div className="space-y-2">
        <label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
          Overall Difficulty
        </label>
        <div className="grid grid-cols-4 gap-2">
          {DIFFICULTY.map((d) => (
            <button
              key={d.value}
              onClick={() => setDifficulty(d.value)}
              className={cn(
                'flex flex-col items-center gap-1 p-3 rounded-xl border transition-colors',
                difficulty === d.value
                  ? 'border-primary bg-primary/10'
                  : 'border-border bg-secondary hover:border-primary/50'
              )}>
              <span className="text-2xl">{d.emoji}</span>
              <span className={cn(
                'text-xs font-semibold',
                difficulty === d.value ? 'text-primary' : 'text-muted-foreground'
              )}>{d.label}</span>
            </button>
          ))}
        </div>
      </div>

      {/* Pump */}
      <div className="space-y-2">
        <label className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
          Pump Rating
        </label>
        <div className="flex gap-2">
          {PUMP.map((p) => (
            <button
              key={p.value}
              onClick={() => setPump(p.value)}
              className={cn(
                'flex-1 py-2.5 rounded-lg text-xs font-semibold border transition-colors',
                pump === p.value
                  ? 'bg-primary text-primary-foreground border-primary'
                  : 'bg-secondary border-border text-muted-foreground hover:border-primary/50'
              )}>
              {p.label}
            </button>
          ))}
        </div>
      </div>

      <div className="flex gap-3 pt-2">
        <Button variant="outline" className="flex-1" onClick={onSkip}>
          Skip
        </Button>
        <Button
          className="flex-1"
          disabled={difficulty == null || pump == null}
          onClick={() => {
            if (difficulty != null && pump != null) {
              onSubmit({ difficulty, pump, mood: 3 });
            }
          }}>
          Submit
        </Button>
      </div>
    </div>
  );
}
