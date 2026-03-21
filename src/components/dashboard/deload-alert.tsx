'use client';

import { DeloadResult } from '@/engines/deload-detector';
import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { AlertTriangle, ShieldAlert, Info } from 'lucide-react';
import { cn } from '@/lib/utils';

interface DeloadAlertProps {
  result: DeloadResult;
}

export function DeloadAlert({ result }: DeloadAlertProps) {
  if (result.urgency === 'none') return null;

  const Icon = result.urgency === 'urgent' ? ShieldAlert : result.urgency === 'recommended' ? AlertTriangle : Info;
  const borderColor =
    result.urgency === 'urgent' ? 'border-red-500' :
    result.urgency === 'recommended' ? 'border-yellow-500' :
    'border-blue-500';
  const iconColor =
    result.urgency === 'urgent' ? 'text-red-500' :
    result.urgency === 'recommended' ? 'text-yellow-500' :
    'text-blue-500';

  return (
    <Card className={cn('border-l-4', borderColor)}>
      <CardContent className="p-4">
        <div className="flex items-start gap-3">
          <Icon className={cn('h-5 w-5 mt-0.5 shrink-0', iconColor)} />
          <div className="flex-1">
            <div className="flex items-center gap-2 mb-1">
              <p className="text-sm font-semibold">Deload {result.urgency === 'urgent' ? 'Needed' : 'Suggested'}</p>
              <Badge variant="secondary" className="text-xs capitalize">{result.urgency}</Badge>
            </div>
            <p className="text-sm text-muted-foreground">{result.message}</p>
            {result.triggeredCriteria.length > 0 && (
              <ul className="mt-2 space-y-0.5">
                {result.triggeredCriteria.map((c, i) => (
                  <li key={i} className="text-xs text-muted-foreground flex items-center gap-1.5">
                    <span className={cn('h-1.5 w-1.5 rounded-full', iconColor.replace('text-', 'bg-'))} />
                    {c}
                  </li>
                ))}
              </ul>
            )}
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
