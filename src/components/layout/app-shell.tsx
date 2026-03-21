'use client';

import { Sidebar } from './sidebar';
import { MobileNav } from './mobile-nav';
import { Header } from './header';

interface AppShellProps {
  children: React.ReactNode;
  title?: string;
}

export function AppShell({ children, title }: AppShellProps) {
  return (
    <div className="min-h-screen bg-background">
      <Sidebar />
      <div className="lg:pl-64 flex flex-col min-h-screen">
        <Header title={title} />
        <main className="flex-1 pb-20 lg:pb-6">{children}</main>
      </div>
      <MobileNav />
    </div>
  );
}
