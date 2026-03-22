import { redirect } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import Image from 'next/image';

export default async function Home() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  if (user) {
    redirect('/dashboard');
  }

  return (
    <div className="min-h-screen bg-background text-foreground flex flex-col items-center justify-center px-6 text-center">
      <Image
        src="/logo.png"
        alt="ADAPTIS"
        width={200}
        height={200}
        className="mb-6"
        priority
      />
      <h1 className="text-5xl sm:text-7xl font-extrabold tracking-[0.15em] mb-3">
        <span className="bg-gradient-to-b from-[#7EC8E3] to-[#2E6FBB] bg-clip-text text-transparent">ADAPTIS</span>
      </h1>
      <p className="text-lg sm:text-xl font-light tracking-[0.2em] text-muted-foreground mb-10">
        Train. Adapt. Become.
      </p>

      <div className="flex gap-4">
        <Link
          href="/register"
          className="px-8 py-3.5 rounded-xl bg-primary text-primary-foreground font-bold text-sm uppercase tracking-wider hover:opacity-90 transition-opacity">
          Get Started
        </Link>
        <Link
          href="/login"
          className="px-8 py-3.5 rounded-xl border border-border font-bold text-sm uppercase tracking-wider hover:bg-secondary transition-colors">
          Sign In
        </Link>
      </div>
    </div>
  );
}
