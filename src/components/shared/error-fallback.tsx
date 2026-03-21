'use client';

import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { AlertCircle, RefreshCw } from 'lucide-react';

interface ErrorFallbackProps {
  message?: string;
  onRetry?: () => void;
}

export function ErrorFallback({
  message = 'Something went wrong. Please try again.',
  onRetry,
}: ErrorFallbackProps) {
  return (
    <Card className="border-destructive/30">
      <CardContent className="p-6 flex flex-col items-center text-center">
        <AlertCircle className="h-10 w-10 text-destructive mb-3" />
        <p className="text-sm text-muted-foreground mb-4">{message}</p>
        {onRetry && (
          <Button variant="outline" size="sm" onClick={onRetry}>
            <RefreshCw className="h-4 w-4 mr-2" /> Try Again
          </Button>
        )}
      </CardContent>
    </Card>
  );
}
