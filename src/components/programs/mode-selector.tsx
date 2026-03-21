'use client';

import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { cn } from '@/lib/utils';
import { Bot, Compass, Hammer, PenLine } from 'lucide-react';

export type TrainingMode = 'coach' | 'guided' | 'builder' | 'manual';

interface ModeSelectorProps {
  value: TrainingMode | null;
  onChange: (mode: TrainingMode) => void;
}

const MODES = [
  {
    value: 'coach' as const,
    label: 'Coach Mode',
    description: 'Forge decides everything — split, exercises, progression. Just show up and train.',
    icon: Bot,
    recommended: true,
  },
  {
    value: 'guided' as const,
    label: 'Guided Mode',
    description: 'Forge creates the plan, but you can swap exercises from approved substitutes.',
    icon: Compass,
    recommended: false,
  },
  {
    value: 'builder' as const,
    label: 'Builder Mode',
    description: 'You pick the split and exercises. Forge handles sets, reps, and progression.',
    icon: Hammer,
    recommended: false,
  },
  {
    value: 'manual' as const,
    label: 'Manual Mode',
    description: 'Log your own workouts freely. Forge provides analytics but no programming.',
    icon: PenLine,
    recommended: false,
  },
];

export function ModeSelector({ value, onChange }: ModeSelectorProps) {
  return (
    <div className="space-y-3">
      {MODES.map((mode) => (
        <Card
          key={mode.value}
          className={cn(
            'cursor-pointer transition-colors',
            value === mode.value && 'border-primary bg-primary/5'
          )}
          onClick={() => onChange(mode.value)}>
          <CardContent className="p-4 flex items-start gap-3">
            <div className={cn(
              'h-10 w-10 rounded-xl flex items-center justify-center shrink-0',
              value === mode.value ? 'bg-primary/20' : 'bg-secondary'
            )}>
              <mode.icon className={cn(
                'h-5 w-5',
                value === mode.value ? 'text-primary' : 'text-muted-foreground'
              )} />
            </div>
            <div className="flex-1">
              <div className="flex items-center gap-2">
                <p className="font-semibold text-sm">{mode.label}</p>
                {mode.recommended && <Badge className="text-[10px]">Recommended</Badge>}
              </div>
              <p className="text-xs text-muted-foreground mt-0.5">{mode.description}</p>
            </div>
          </CardContent>
        </Card>
      ))}
    </div>
  );
}
