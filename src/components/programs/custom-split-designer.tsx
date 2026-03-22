'use client';

import { Card, CardContent } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { cn } from '@/lib/utils';

const MUSCLE_GROUPS = [
  'chest', 'back', 'quads', 'hamstrings', 'glutes', 'shoulders',
  'biceps', 'triceps', 'calves', 'abs', 'traps', 'forearms',
] as const;

const MUSCLE_LABELS: Record<string, string> = {
  chest: 'Chest', back: 'Back', quads: 'Quads', hamstrings: 'Hamstrings',
  glutes: 'Glutes', shoulders: 'Shoulders', biceps: 'Biceps', triceps: 'Triceps',
  calves: 'Calves', abs: 'Abs', traps: 'Traps', forearms: 'Forearms',
};

interface DayConfig {
  label: string;
  muscles: string[];
}

interface CustomSplitDesignerProps {
  days: DayConfig[];
  onChange: (days: DayConfig[]) => void;
}

export function CustomSplitDesigner({ days, onChange }: CustomSplitDesignerProps) {
  // Track which muscles are assigned to other days (for visual hints)
  const muscleAssignments = new Map<string, number[]>();
  days.forEach((day, dayIdx) => {
    day.muscles.forEach((m) => {
      const list = muscleAssignments.get(m) || [];
      list.push(dayIdx);
      muscleAssignments.set(m, list);
    });
  });

  const updateDay = (dayIdx: number, updates: Partial<DayConfig>) => {
    const next = days.map((d, i) => i === dayIdx ? { ...d, ...updates } : d);
    onChange(next);
  };

  const toggleMuscle = (dayIdx: number, muscle: string) => {
    const day = days[dayIdx];
    const has = day.muscles.includes(muscle);
    const muscles = has
      ? day.muscles.filter((m) => m !== muscle)
      : [...day.muscles, muscle];
    updateDay(dayIdx, { muscles });
  };

  return (
    <div className="space-y-4">
      {days.map((day, dayIdx) => (
        <Card key={dayIdx} className={cn(
          'transition-colors',
          day.muscles.length > 0 && 'border-primary/50'
        )}>
          <CardContent className="p-4 space-y-3">
            <div className="flex items-center gap-3">
              <span className="text-sm font-bold text-primary w-8">Day {dayIdx + 1}</span>
              <Input
                value={day.label}
                onChange={(e) => updateDay(dayIdx, { label: e.target.value })}
                placeholder={`e.g. Push, Pull, Legs, Upper...`}
                className="h-9 text-sm"
              />
            </div>

            <div className="grid grid-cols-4 gap-1.5">
              {MUSCLE_GROUPS.map((muscle) => {
                const isSelected = day.muscles.includes(muscle);
                const assignedElsewhere = (muscleAssignments.get(muscle) || [])
                  .filter((i) => i !== dayIdx).length > 0;

                return (
                  <button
                    key={muscle}
                    onClick={() => toggleMuscle(dayIdx, muscle)}
                    className={cn(
                      'py-1.5 px-1 rounded-md text-[11px] font-medium transition-colors border',
                      isSelected
                        ? 'bg-primary text-primary-foreground border-primary'
                        : assignedElsewhere
                        ? 'bg-secondary/50 border-border/50 text-muted-foreground'
                        : 'bg-secondary border-border hover:border-primary/50'
                    )}>
                    {MUSCLE_LABELS[muscle]}
                    {assignedElsewhere && !isSelected && (
                      <span className="ml-0.5 text-[8px]">•</span>
                    )}
                  </button>
                );
              })}
            </div>

            <p className="text-[10px] text-muted-foreground">
              {day.muscles.length === 0
                ? 'Select at least 1 muscle group'
                : `${day.muscles.length} muscle${day.muscles.length > 1 ? 's' : ''} selected`}
            </p>
          </CardContent>
        </Card>
      ))}
    </div>
  );
}
