'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import {
  LayoutDashboard,
  Dumbbell,
  BookOpen,
  Library,
  User,
} from 'lucide-react';
import { cn } from '@/lib/utils';

const navItems = [
  { href: '/dashboard', label: 'Home', icon: LayoutDashboard },
  { href: '/workout', label: 'Workout', icon: Dumbbell },
  { href: '/exercises', label: 'Exercises', icon: Library },
  { href: '/programs', label: 'Programs', icon: BookOpen },
  { href: '/settings', label: 'Profile', icon: User },
];

export function MobileNav() {
  const pathname = usePathname();

  return (
    <nav className="lg:hidden fixed bottom-0 inset-x-0 z-50 bg-card border-t border-border">
      <div className="flex items-center justify-around h-16 px-2 pb-safe">
        {navItems.map((item) => {
          const isActive = pathname.startsWith(item.href);
          return (
            <Link
              key={item.href}
              href={item.href}
              className={cn(
                'flex flex-col items-center gap-0.5 px-3 py-1.5 min-w-[56px]',
                isActive ? 'text-primary' : 'text-muted-foreground'
              )}>
              <item.icon className={cn('h-5 w-5', item.href === '/workout' && 'h-6 w-6')} />
              <span className="text-[10px] font-semibold uppercase tracking-wide">
                {item.label}
              </span>
            </Link>
          );
        })}
      </div>
    </nav>
  );
}
