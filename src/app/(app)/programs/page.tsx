'use client';

import { useEffect, useState, useCallback } from 'react';
import Link from 'next/link';
import { useAuth } from '@/providers/auth-provider';
import { createClient } from '@/lib/supabase/client';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
import { Plus, Dumbbell, Play, Pause } from 'lucide-react';
import { SPLIT_INFO } from '@/lib/constants';

interface ProgramSummary {
  id: string;
  name: string;
  split_type: string;
  days_per_week: number;
  num_weeks: number;
  status: string;
  current_week: number;
  created_at: string;
}

export default function ProgramsPage() {
  const { user } = useAuth();
  const [programs, setPrograms] = useState<ProgramSummary[]>([]);
  const [loading, setLoading] = useState(true);

  const fetchPrograms = useCallback(async () => {
    if (!user) return;
    const supabase = createClient();
    const { data } = await supabase
      .from('programs')
      .select('id, name, split_type, days_per_week, num_weeks, status, current_week, created_at')
      .eq('user_id', user.id)
      .order('created_at', { ascending: false });

    setPrograms(data || []);
    setLoading(false);
  }, [user]);

  useEffect(() => {
    fetchPrograms();
  }, [fetchPrograms]);

  if (loading) {
    return (
      <div className="p-4 lg:p-6 max-w-4xl mx-auto space-y-3">
        <div className="flex items-center justify-between mb-4">
          <h1 className="text-2xl font-bold tracking-tight">Programs</h1>
        </div>
        {[...Array(3)].map((_, i) => <Skeleton key={i} className="h-20 w-full" />)}
      </div>
    );
  }

  return (
    <div className="p-4 lg:p-6 max-w-4xl mx-auto">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold tracking-tight">Programs</h1>
        <Link href="/programs/create">
          <Button size="sm">
            <Plus className="h-4 w-4 mr-1" />
            New Program
          </Button>
        </Link>
      </div>

      {programs.length === 0 ? (
        <div className="flex flex-col items-center justify-center py-16 text-center">
          <div className="h-16 w-16 rounded-full bg-primary/10 flex items-center justify-center mb-4">
            <Dumbbell className="h-8 w-8 text-primary" />
          </div>
          <h2 className="text-xl font-semibold mb-2">No Programs Yet</h2>
          <p className="text-muted-foreground mb-6 max-w-sm">
            Create your first training program to get started with Forge.
          </p>
          <Link href="/programs/create">
            <Button>Create Program</Button>
          </Link>
        </div>
      ) : (
        <div className="space-y-3">
          {programs.map((prog) => {
            const splitInfo = SPLIT_INFO[prog.split_type as keyof typeof SPLIT_INFO];
            return (
              <Link key={prog.id} href={`/programs/${prog.id}`}>
                <Card className={`hover:border-primary/50 transition-colors cursor-pointer ${prog.status === 'active' ? 'border-l-4 border-l-primary' : ''}`}>
                  <CardContent className="p-4">
                    <div className="flex items-center justify-between mb-2">
                      <p className="font-semibold">{prog.name}</p>
                      <Badge
                        variant={prog.status === 'active' ? 'default' : 'secondary'}
                        className="capitalize text-xs">
                        {prog.status}
                      </Badge>
                    </div>
                    <div className="flex items-center justify-between">
                      <div className="flex gap-2">
                        <Badge variant="secondary" className="text-xs">
                          {splitInfo?.shortName || prog.split_type}
                        </Badge>
                        <Badge variant="secondary" className="text-xs">
                          {prog.days_per_week} days/wk
                        </Badge>
                        <Badge variant="secondary" className="text-xs">
                          Week {prog.current_week}/{prog.num_weeks}
                        </Badge>
                      </div>
                      {prog.status !== 'completed' && (
                        <Button
                          variant="ghost"
                          size="sm"
                          className="h-8 px-2 text-xs"
                          onClick={async (e) => {
                            e.preventDefault();
                            e.stopPropagation();
                            const supabase = createClient();
                            if (prog.status === 'active') {
                              await supabase.from('programs').update({ status: 'paused' }).eq('id', prog.id);
                            } else {
                              // Pause all others first
                              await supabase.from('programs').update({ status: 'paused' }).eq('user_id', user!.id).eq('status', 'active');
                              await supabase.from('programs').update({ status: 'active', started_at: new Date().toISOString() }).eq('id', prog.id);
                            }
                            fetchPrograms();
                          }}>
                          {prog.status === 'active' ? (
                            <><Pause className="h-3.5 w-3.5 mr-1" /> Pause</>
                          ) : (
                            <><Play className="h-3.5 w-3.5 mr-1" /> Activate</>
                          )}
                        </Button>
                      )}
                    </div>
                  </CardContent>
                </Card>
              </Link>
            );
          })}
        </div>
      )}
    </div>
  );
}
