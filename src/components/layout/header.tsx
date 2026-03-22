'use client';

import { useAuth } from '@/providers/auth-provider';
import { Avatar, AvatarFallback } from '@/components/ui/avatar';

interface HeaderProps {
  title?: string;
}

export function Header({ title }: HeaderProps) {
  const { user } = useAuth();
  const initials = user?.user_metadata?.display_name
    ? user.user_metadata.display_name.slice(0, 2).toUpperCase()
    : 'U';

  return (
    <header className="sticky top-0 z-40 flex items-center justify-between h-14 px-4 lg:px-6 bg-background/80 backdrop-blur-sm border-b border-border">
      <div className="flex items-center gap-3">
        <h1 className="lg:hidden text-lg font-bold tracking-tight">
          <span className="text-primary">ADAPTIS</span>
        </h1>
        {title && (
          <h2 className="hidden lg:block text-lg font-semibold">{title}</h2>
        )}
      </div>

      <Avatar className="h-8 w-8">
        <AvatarFallback className="bg-primary/10 text-primary text-xs font-bold">
          {initials}
        </AvatarFallback>
      </Avatar>
    </header>
  );
}
