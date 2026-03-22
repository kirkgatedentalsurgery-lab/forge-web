'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';
import { calculateReadinessScore, getReadinessBand } from '@/engines/readiness-engine';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Slider } from '@/components/ui/slider';
import { Badge } from '@/components/ui/badge';
import { cn } from '@/lib/utils';
import { Brain, Moon, Zap, Frown, Flame, Check, Loader2 } from 'lucide-react';

const INPUTS = [
  { key: 'sleep', label: 'Sleep Quality', icon: Moon, low: 'Terrible', high: 'Amazing' },
  { key: 'energy', label: 'Energy Level', icon: Zap, low: 'Drained', high: 'Wired' },
  { key: 'soreness', label: 'Soreness', icon: Frown, low: 'Crushed', high: 'Fresh' },
  { key: 'stress', label: 'Stress', icon: Brain, low: 'Overwhelmed', high: 'Calm' },
  { key: 'motivation', label: 'Motivation', icon: Flame, low: 'None', high: 'Let\'s go' },
] as const;

interface ReadinessCheckinProps {
  onComplete?: (score: number) => void;
  existingScore?: number | null;
}

export function ReadinessCheckin({ onComplete, existingScore }: ReadinessCheckinProps) {
  const { user } = useAuth();
  const [values, setValues] = useState<Record<string, number>>({
    sleep: 3, energy: 3, soreness: 3, stress: 3, motivation: 3,
  });
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(!!existingScore);
  const [savedScore, setSavedScore] = useState<number | null>(existingScore ?? null);

  // Check if already logged today
  useEffect(() => {
    if (!user || saved) return;
    const checkToday = async () => {
      const today = new Date().toISOString().split('T')[0];
      const supabase = createClient();
      const { data } = await supabase
        .from('readiness_logs')
        .select('readiness_score')
        .eq('user_id', user.id)
        .eq('logged_at', today)
        .maybeSingle();
      if (data) {
        setSaved(true);
        setSavedScore(data.readiness_score);
      }
    };
    checkToday();
  }, [user, saved]);

  const score = calculateReadinessScore({
    sleepQuality: values.sleep,
    energyLevel: values.energy,
    sorenessLevel: values.soreness,
    stressLevel: values.stress,
    motivation: values.motivation,
  });

  const band = getReadinessBand(score);
  const bandColor =
    band === 'push' ? 'text-green-400' :
    band === 'normal' ? 'text-blue-400' :
    band === 'conservative' ? 'text-yellow-400' :
    'text-red-400';

  const bandLabel =
    band === 'push' ? 'Push Day' :
    band === 'normal' ? 'Normal' :
    band === 'conservative' ? 'Conservative' :
    'Recovery';

  const handleSave = async () => {
    if (!user) return;
    setSaving(true);

    const supabase = createClient();
    await supabase.from('readiness_logs').upsert({
      user_id: user.id,
      logged_at: new Date().toISOString().split('T')[0],
      sleep_quality: values.sleep,
      stress_level: values.stress,
      energy_level: values.energy,
      soreness_level: values.soreness,
      motivation: values.motivation,
      readiness_score: score,
    }, { onConflict: 'user_id,logged_at' });

    setSaving(false);
    setSaved(true);
    setSavedScore(score);
    onComplete?.(score);
  };

  if (saved) {
    const displayScore = savedScore ?? existingScore ?? score;
    const displayBand = getReadinessBand(displayScore);
    const displayColor =
      displayBand === 'push' ? 'text-green-400' :
      displayBand === 'normal' ? 'text-blue-400' :
      displayBand === 'conservative' ? 'text-yellow-400' :
      'text-red-400';

    return (
      <Card>
        <CardContent className="p-4 flex items-center gap-4">
          <div className={cn('text-4xl font-bold tabular-nums', displayColor)}>
            {displayScore}
          </div>
          <div className="flex-1">
            <p className="text-sm font-semibold">Readiness Score</p>
            <p className="text-xs text-muted-foreground">
              {displayBand === 'push' && 'Feeling great — push harder today.'}
              {displayBand === 'normal' && 'Good to go — stick to the plan.'}
              {displayBand === 'conservative' && 'Take it easy — reduce volume today.'}
              {displayBand === 'recovery' && 'Consider a rest day or light session.'}
            </p>
          </div>
          <Badge className={displayColor} variant="secondary">{displayBand}</Badge>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader className="pb-2">
        <CardTitle className="text-base flex items-center gap-2">
          <Brain className="h-4 w-4 text-primary" /> Daily Readiness Check-in
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {INPUTS.map(({ key, label, icon: Icon, low, high }) => (
          <div key={key} className="space-y-1.5">
            <div className="flex items-center justify-between">
              <label className="text-xs font-medium flex items-center gap-1.5">
                <Icon className="h-3.5 w-3.5 text-muted-foreground" />
                {label}
              </label>
              <span className="text-xs font-bold tabular-nums text-primary">{values[key]}/5</span>
            </div>
            <Slider
              value={[values[key]]}
              onValueChange={([v]) => setValues({ ...values, [key]: v })}
              min={1}
              max={5}
              step={1}
            />
            <div className="flex justify-between text-[10px] text-muted-foreground">
              <span>{low}</span><span>{high}</span>
            </div>
          </div>
        ))}

        {/* Score preview */}
        <div className="flex items-center justify-between pt-2 border-t border-border">
          <div>
            <span className={cn('text-2xl font-bold tabular-nums', bandColor)}>{score}</span>
            <span className="text-xs text-muted-foreground ml-2">{bandLabel}</span>
          </div>
          <Button onClick={handleSave} disabled={saving} size="sm">
            {saving ? <Loader2 className="h-4 w-4 animate-spin" /> : <><Check className="h-4 w-4 mr-1" /> Log</>}
          </Button>
        </div>
      </CardContent>
    </Card>
  );
}
