'use client';

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Trophy } from 'lucide-react';
import { usePreferredUnit } from '@/hooks/use-user-profile';

interface PR {
  exerciseName: string;
  bestWeight: number;
  bestReps: number;
  e1rm: number | null;
  lastPerformed: string | null;
}

interface PrBoardProps {
  records: PR[];
}

export function PrBoard({ records }: PrBoardProps) {
  const unit = usePreferredUnit();

  if (!records.length) {
    return (
      <Card>
        <CardHeader><CardTitle className="text-base">Personal Records</CardTitle></CardHeader>
        <CardContent>
          <p className="text-sm text-muted-foreground text-center py-8">No PRs yet. Start lifting!</p>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle className="text-base flex items-center gap-2">
          <Trophy className="h-4 w-4 text-yellow-500" /> Personal Records
        </CardTitle>
      </CardHeader>
      <CardContent className="p-0">
        <div className="divide-y divide-border">
          {records.slice(0, 10).map((pr, i) => (
            <div key={i} className="flex items-center justify-between px-4 py-3">
              <div>
                <p className="text-sm font-semibold">{pr.exerciseName}</p>
                <p className="text-xs text-muted-foreground">
                  {pr.bestWeight} {unit} × {pr.bestReps}
                  {pr.lastPerformed && ` · ${new Date(pr.lastPerformed).toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}`}
                </p>
              </div>
              {pr.e1rm && (
                <Badge variant="secondary" className="text-xs tabular-nums">
                  e1RM: {pr.e1rm}
                </Badge>
              )}
            </div>
          ))}
        </div>
      </CardContent>
    </Card>
  );
}
