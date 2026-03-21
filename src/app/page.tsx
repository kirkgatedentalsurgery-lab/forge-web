import { redirect } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import { Dumbbell, Brain, TrendingUp, Zap } from 'lucide-react';

export default async function Home() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  if (user) {
    redirect('/dashboard');
  }

  return (
    <div className="min-h-screen bg-background text-foreground">
      {/* Hero */}
      <div className="flex flex-col items-center justify-center min-h-[70vh] px-6 text-center">
        <h1 className="text-5xl sm:text-7xl font-extrabold tracking-tighter mb-4">
          <span className="text-primary">FORGE</span>
        </h1>
        <p className="text-lg sm:text-xl text-muted-foreground font-medium mb-2">
          Intelligent Lifting Coach
        </p>
        <p className="text-2xl sm:text-3xl font-semibold tracking-tight uppercase mb-10">
          BE THE PERSON YOU WANT TO BE
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

      {/* Features */}
      <div className="max-w-4xl mx-auto px-6 pb-20">
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
          <FeatureCard
            icon={<Brain className="h-6 w-6 text-primary" />}
            title="Smart Programming"
            description="Structured mesocycles with auto-regulation. Volume landmarks, RIR progression, and deload detection — like having a coach in your pocket."
          />
          <FeatureCard
            icon={<Zap className="h-6 w-6 text-primary" />}
            title="Elite Logging"
            description="Log a set in seconds. One-tap previous match, pain flags, warm-up generator, and a rest timer that just works."
          />
          <FeatureCard
            icon={<TrendingUp className="h-6 w-6 text-primary" />}
            title="Useful Analytics"
            description="Volume trends, e1RM tracking, muscle balance radar, readiness scoring, and plain-English coach notes that help you make better decisions."
          />
          <FeatureCard
            icon={<Dumbbell className="h-6 w-6 text-primary" />}
            title="265+ Exercises"
            description="Comprehensive library with muscle mappings, form videos, substitution suggestions, and support for every equipment type."
          />
        </div>

        <p className="text-center text-sm text-muted-foreground mt-16">
          Built for serious lifters. Not a generic wellness app.
        </p>
      </div>
    </div>
  );
}

function FeatureCard({ icon, title, description }: { icon: React.ReactNode; title: string; description: string }) {
  return (
    <div className="p-6 rounded-2xl border border-border bg-card">
      <div className="h-12 w-12 rounded-xl bg-primary/10 flex items-center justify-center mb-4">
        {icon}
      </div>
      <h3 className="text-lg font-bold mb-2">{title}</h3>
      <p className="text-sm text-muted-foreground leading-relaxed">{description}</p>
    </div>
  );
}
