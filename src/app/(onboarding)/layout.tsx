export default function OnboardingLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen bg-background flex flex-col">
      <div className="flex items-center justify-center h-16 border-b border-border/50">
        <h1 className="text-xl font-bold tracking-[0.12em]">
          <span className="bg-gradient-to-r from-[#7EC8E3] to-[#2E6FBB] bg-clip-text text-transparent">ADAPTIS</span>
        </h1>
      </div>
      <div className="flex-1 flex items-start justify-center p-4 pt-6 pb-20">
        <div className="w-full max-w-lg">{children}</div>
      </div>
    </div>
  );
}
