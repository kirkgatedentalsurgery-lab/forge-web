'use client';

import { useEffect, useState } from 'react';
import { useAuth } from '@/providers/auth-provider';
import { createClient } from '@/lib/supabase/client';
import { useQueryClient } from '@tanstack/react-query';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Badge } from '@/components/ui/badge';
import { Separator } from '@/components/ui/separator';
import { cn } from '@/lib/utils';
import { Check, Loader2, Wrench, Sun, Moon } from 'lucide-react';
import { useTheme } from 'next-themes';

const ALL_EQUIPMENT = [
  { id: 'barbell', label: 'Barbell' },
  { id: 'dumbbell', label: 'Dumbbells' },
  { id: 'cable', label: 'Cables' },
  { id: 'machine', label: 'Machines' },
  { id: 'bodyweight', label: 'Bodyweight' },
  { id: 'bands', label: 'Bands' },
];

export default function SettingsPage() {
  const queryClient = useQueryClient();
  const { user, signOut } = useAuth();
  const [profile, setProfile] = useState<any>(null);
  const [equipment, setEquipment] = useState<string[]>([]);
  const [unit, setUnit] = useState<'lbs' | 'kg'>('lbs');
  const [restSeconds, setRestSeconds] = useState(120);
  const [bodyWeight, setBodyWeight] = useState('');
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  useEffect(() => {
    if (!user) return;
    async function load() {
      const supabase = createClient();
      const { data } = await supabase
        .from('user_profiles')
        .select('*')
        .eq('id', user!.id)
        .single();

      if (data) {
        setProfile(data);
        setEquipment(data.available_equipment || ['barbell', 'dumbbell', 'cable', 'machine', 'bodyweight']);
        setUnit(data.preferred_unit || 'lbs');
        setRestSeconds(data.default_rest_seconds || 120);
        setBodyWeight(data.body_weight ? String(data.body_weight) : '');
      }
    }
    load();
  }, [user]);

  const toggleEquipment = (id: string) => {
    setEquipment((prev) =>
      prev.includes(id) ? prev.filter((e) => e !== id) : [...prev, id]
    );
    setSaved(false);
  };

  const handleSave = async () => {
    if (!user) return;
    setSaving(true);
    const supabase = createClient();
    await supabase.from('user_profiles').update({
      available_equipment: `{${equipment.join(',')}}`,
      preferred_unit: unit,
      default_rest_seconds: restSeconds,
      body_weight: bodyWeight ? parseFloat(bodyWeight) : null,
    }).eq('id', user.id);
    // Invalidate the user profile cache so all screens pick up the new unit immediately
    await queryClient.invalidateQueries({ queryKey: ['user-profile'] });
    setSaving(false);
    setSaved(true);
  };

  return (
    <div className="p-4 lg:p-6 max-w-2xl mx-auto space-y-6">
      <h1 className="text-2xl font-bold tracking-tight">Settings</h1>

      {/* Profile */}
      <Card>
        <CardHeader>
          <CardTitle className="text-base">Profile</CardTitle>
        </CardHeader>
        <CardContent className="space-y-1">
          <p className="text-lg font-semibold">
            {user?.user_metadata?.display_name || 'Athlete'}
          </p>
          <p className="text-sm text-muted-foreground">{user?.email}</p>
          {profile?.training_goal && (
            <Badge variant="secondary" className="mt-2 capitalize">
              {profile.training_goal.replace('_', ' ')}
            </Badge>
          )}
        </CardContent>
      </Card>

      {/* Body Weight */}
      <Card>
        <CardHeader>
          <CardTitle className="text-base">Body Weight</CardTitle>
        </CardHeader>
        <CardContent className="space-y-3">
          <div className="flex gap-2">
            <Input
              type="number"
              placeholder={`Weight (${unit})`}
              value={bodyWeight}
              onChange={(e) => { setBodyWeight(e.target.value); setSaved(false); }}
              className="flex-1"
            />
            <span className="flex items-center text-sm text-muted-foreground">{unit}</span>
          </div>
          <p className="text-xs text-muted-foreground">Used for relative strength tracking.</p>
        </CardContent>
      </Card>

      {/* Equipment */}
      <Card>
        <CardHeader>
          <CardTitle className="text-base flex items-center gap-2">
            <Wrench className="h-4 w-4" /> Equipment
          </CardTitle>
        </CardHeader>
        <CardContent>
          <p className="text-sm text-muted-foreground mb-3">
            Programs will only include exercises for your selected equipment.
          </p>
          <div className="grid grid-cols-2 gap-2">
            {ALL_EQUIPMENT.map((eq) => {
              const selected = equipment.includes(eq.id);
              return (
                <button
                  key={eq.id}
                  onClick={() => toggleEquipment(eq.id)}
                  className={cn(
                    'flex items-center gap-2 p-3 rounded-xl border text-sm font-medium transition-colors',
                    selected
                      ? 'border-primary bg-primary/10 text-primary'
                      : 'border-border bg-secondary text-muted-foreground hover:border-primary/50'
                  )}>
                  {selected && <Check className="h-4 w-4" />}
                  {eq.label}
                </button>
              );
            })}
          </div>
        </CardContent>
      </Card>

      {/* Preferences */}
      <Card>
        <CardHeader>
          <CardTitle className="text-base">Preferences</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <Label>Units</Label>
            <div className="flex gap-2">
              {(['lbs', 'kg'] as const).map((u) => (
                <button
                  key={u}
                  onClick={() => { setUnit(u); setSaved(false); }}
                  className={cn(
                    'flex-1 py-2.5 rounded-lg text-sm font-semibold border transition-colors',
                    unit === u
                      ? 'bg-primary text-primary-foreground border-primary'
                      : 'bg-secondary border-border text-muted-foreground'
                  )}>
                  {u.toUpperCase()}
                </button>
              ))}
            </div>
          </div>

          <div className="space-y-2">
            <Label htmlFor="rest">Default Rest Timer (seconds)</Label>
            <Input
              id="rest"
              type="number"
              value={restSeconds}
              onChange={(e) => { setRestSeconds(parseInt(e.target.value) || 120); setSaved(false); }}
              min={30}
              max={600}
            />
          </div>
        </CardContent>
      </Card>

      {/* Save */}
      <Button onClick={handleSave} className="w-full" disabled={saving || saved}>
        {saving ? <><Loader2 className="h-4 w-4 mr-2 animate-spin" /> Saving...</>
          : saved ? <><Check className="h-4 w-4 mr-2" /> Saved</>
          : 'Save Settings'}
      </Button>

      {/* Theme Toggle */}
      <ThemeToggle />

      <Separator />

      <Button variant="outline" className="w-full text-destructive" onClick={signOut}>
        Sign Out
      </Button>
    </div>
  );
}

function ThemeToggle() {
  const { theme, setTheme } = useTheme();
  const [mounted, setMounted] = useState(false);

  useEffect(() => setMounted(true), []);
  if (!mounted) return null;

  return (
    <Card>
      <CardHeader>
        <CardTitle className="text-base">Appearance</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="flex gap-2">
          {[
            { value: 'dark', label: 'Dark', icon: Moon },
            { value: 'light', label: 'Light', icon: Sun },
            { value: 'system', label: 'System', icon: null },
          ].map((opt) => (
            <button
              key={opt.value}
              onClick={() => setTheme(opt.value)}
              className={cn(
                'flex-1 flex items-center justify-center gap-2 py-3 rounded-lg text-sm font-medium border transition-colors',
                theme === opt.value
                  ? 'bg-primary text-primary-foreground border-primary'
                  : 'bg-secondary border-border text-muted-foreground hover:border-primary/50'
              )}>
              {opt.icon && <opt.icon className="h-4 w-4" />}
              {opt.label}
            </button>
          ))}
        </div>
      </CardContent>
    </Card>
  );
}
