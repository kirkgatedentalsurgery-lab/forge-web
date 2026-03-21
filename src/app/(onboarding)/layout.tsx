export default function OnboardingLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen bg-background flex flex-col">
      <div className="flex items-center justify-center h-14 border-b border-border">
        <h1 className="text-lg font-bold tracking-tight">
          <span className="text-primary">FORGE</span>
          <span className="text-muted-foreground ml-2 text-sm font-normal">Setup</span>
        </h1>
      </div>
      <div className="flex-1 flex items-start justify-center p-4 pt-8">
        <div className="w-full max-w-lg">{children}</div>
      </div>
    </div>
  );
}
