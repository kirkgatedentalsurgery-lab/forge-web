'use client';

import { useState } from 'react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Badge } from '@/components/ui/badge';
import { usePreferredUnit } from '@/hooks/use-user-profile';
import { calculateTrainingMax } from '@/engines/strength-mode';

export interface StrengthLifts {
  squat: number | null;
  bench: number | null;
  deadlift: number | null;
  ohp: number | null;
}

interface StrengthSetupProps {
  lifts: StrengthLifts;
  onChange: (lifts: StrengthLifts) => void;
}

const LIFTS = [
  { key: 'squat' as const, label: 'Squat', icon: '🏋️' },
  { key: 'bench' as const, label: 'Bench Press', icon: '💪' },
  { key: 'deadlift' as const, label: 'Deadlift', icon: '🔥' },
  { key: 'ohp' as const, label: 'Overhead Press', icon: '⬆️' },
];

export function StrengthSetup({ lifts, onChange }: StrengthSetupProps) {
  const unit = usePreferredUnit();

  return (
    <div className="space-y-4">
      <div>
        <h2 className="text-lg font-semibold">Main Lift Estimates</h2>
        <p className="text-sm text-muted-foreground">
          Enter your estimated or tested 1RM for each main lift. Training max will be calculated at 90%.
        </p>
      </div>

      {LIFTS.map((lift) => {
        const e1rm = lifts[lift.key];
        const tm = e1rm ? calculateTrainingMax(e1rm) : null;

        return (
          <Card key={lift.key}>
            <CardContent className="p-4">
              <div className="flex items-center justify-between mb-2">
                <Label className="text-sm font-semibold">
                  {lift.icon} {lift.label}
                </Label>
                {tm && (
                  <Badge variant="secondary" className="text-xs tabular-nums">
                    TM: {tm} {unit}
                  </Badge>
                )}
              </div>
              <div className="flex gap-2 items-center">
                <Input
                  type="number"
                  inputMode="numeric"
                  placeholder={`e1RM (${unit})`}
                  value={e1rm ?? ''}
                  onChange={(e) => {
                    const val = parseFloat(e.target.value) || null;
                    onChange({ ...lifts, [lift.key]: val });
                  }}
                  className="flex-1"
                />
                <span className="text-sm text-muted-foreground w-8">{unit}</span>
              </div>
            </CardContent>
          </Card>
        );
      })}

      <p className="text-xs text-muted-foreground">
        Training max (TM) = 90% of estimated 1RM. All working sets will be programmed as percentages of your TM.
      </p>
    </div>
  );
}
