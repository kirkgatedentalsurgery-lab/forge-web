'use client';

import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { useAuth } from '@/providers/auth-provider';
import { useUserProfile } from '@/hooks/use-user-profile';
import { findSubstitutes, SubstituteCandidate } from '@/engines/substitution-engine';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
import { ArrowRightLeft, Dumbbell } from 'lucide-react';

interface SubstitutionDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  exerciseId: string;
  exerciseName: string;
  onSelect: (exerciseId: string, exerciseName: string) => void;
}

export function SubstitutionDialog({
  open, onOpenChange, exerciseId, exerciseName, onSelect,
}: SubstitutionDialogProps) {
  const { user } = useAuth();
  const { data: profile } = useUserProfile();
  const [candidates, setCandidates] = useState<SubstituteCandidate[]>([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (!open || !user || !profile) return;

    async function load() {
      setLoading(true);
      const supabase = createClient();
      const results = await findSubstitutes(
        supabase,
        exerciseId,
        user!.id,
        profile!.availableEquipment
      );
      setCandidates(results);
      setLoading(false);
    }

    load();
  }, [open, exerciseId, user, profile]);

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-md max-h-[80vh] overflow-y-auto">
        <DialogHeader>
          <DialogTitle className="flex items-center gap-2">
            <ArrowRightLeft className="h-4 w-4" />
            Swap Exercise
          </DialogTitle>
        </DialogHeader>

        <p className="text-sm text-muted-foreground">
          Replace <span className="font-semibold text-foreground">{exerciseName}</span> with:
        </p>

        {loading ? (
          <div className="space-y-3 pt-2">
            {[...Array(5)].map((_, i) => <Skeleton key={i} className="h-16 w-full" />)}
          </div>
        ) : candidates.length === 0 ? (
          <div className="text-center py-8">
            <Dumbbell className="h-8 w-8 text-muted-foreground mx-auto mb-2" />
            <p className="text-sm text-muted-foreground">No substitutes found for your equipment.</p>
          </div>
        ) : (
          <div className="space-y-2 pt-2">
            {candidates.map((c) => (
              <button
                key={c.exerciseId}
                onClick={() => {
                  onSelect(c.exerciseId, c.exerciseName);
                  onOpenChange(false);
                }}
                className="w-full text-left p-3 rounded-xl border border-border bg-secondary hover:border-primary/50 transition-colors">
                <div className="flex items-center justify-between mb-1">
                  <p className="text-sm font-semibold">{c.exerciseName}</p>
                  <Badge variant="secondary" className="text-[10px]">
                    {Math.round(c.similarityScore * 100)}% match
                  </Badge>
                </div>
                <div className="flex items-center gap-2">
                  <Badge variant="secondary" className="text-[10px]">{c.equipment}</Badge>
                  <span className="text-xs text-muted-foreground">{c.reason}</span>
                </div>
              </button>
            ))}
          </div>
        )}
      </DialogContent>
    </Dialog>
  );
}
