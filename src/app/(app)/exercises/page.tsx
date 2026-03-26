'use client';

import { useState, useMemo, useEffect, useRef } from 'react';
import Link from 'next/link';
import { useExercises, useMuscleGroups } from '@/hooks/use-exercises';
import { Input } from '@/components/ui/input';
import { Badge } from '@/components/ui/badge';
import { Card, CardContent } from '@/components/ui/card';
import { Skeleton } from '@/components/ui/skeleton';
import { cn } from '@/lib/utils';
import { Button } from '@/components/ui/button';
import { Search, Dumbbell, ExternalLink, Video, Plus } from 'lucide-react';

const EQUIPMENT_OPTIONS = [
  { value: '', label: 'All' },
  { value: 'barbell', label: 'Barbell' },
  { value: 'dumbbell', label: 'Dumbbell' },
  { value: 'cable', label: 'Cable' },
  { value: 'machine', label: 'Machine' },
  { value: 'bodyweight', label: 'Bodyweight' },
  { value: 'bands', label: 'Bands' },
];

const PAGE_SIZE = 50;

export default function ExercisesPage() {
  const [search, setSearch] = useState('');
  const [debouncedSearch, setDebouncedSearch] = useState('');
  const [muscleFilter, setMuscleFilter] = useState('');
  const [equipmentFilter, setEquipmentFilter] = useState('');
  const [visibleCount, setVisibleCount] = useState(PAGE_SIZE);

  // Debounce search to avoid re-querying on every keystroke
  useEffect(() => {
    const timer = setTimeout(() => setDebouncedSearch(search), 300);
    return () => clearTimeout(timer);
  }, [search]);

  // Reset visible count when filters change
  useEffect(() => { setVisibleCount(PAGE_SIZE); }, [debouncedSearch, muscleFilter, equipmentFilter]);

  const { data: exercises, isLoading } = useExercises({
    search: debouncedSearch.length > 1 ? debouncedSearch : undefined,
    muscleGroup: muscleFilter || undefined,
    equipment: equipmentFilter || undefined,
  });
  const { data: muscleGroups } = useMuscleGroups();

  const visibleExercises = useMemo(() => exercises?.slice(0, visibleCount) || [], [exercises, visibleCount]);
  const hasMore = (exercises?.length || 0) > visibleCount;

  return (
    <div className="p-4 lg:p-6 max-w-4xl mx-auto">
      <div className="flex items-center justify-between mb-4">
        <h1 className="text-2xl font-bold tracking-tight">Exercise Library</h1>
        <Link href="/exercises/create">
          <Button size="sm" className="h-8">
            <Plus className="h-4 w-4 mr-1" /> Create
          </Button>
        </Link>
      </div>

      {/* Search */}
      <div className="relative mb-4">
        <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
        <Input
          placeholder="Search exercises..."
          className="pl-9"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />
      </div>

      {/* Muscle filter */}
      <div className="flex gap-2 overflow-x-auto pb-2 mb-2 no-scrollbar">
        <button
          onClick={() => setMuscleFilter('')}
          className={cn(
            'px-3 py-1.5 rounded-full text-xs font-medium border whitespace-nowrap transition-colors',
            !muscleFilter ? 'bg-primary text-primary-foreground border-primary' : 'bg-secondary border-border text-muted-foreground'
          )}>
          All Muscles
        </button>
        {(muscleGroups || []).map((mg: any) => (
          <button
            key={mg.id}
            onClick={() => setMuscleFilter(muscleFilter === mg.display_name ? '' : mg.display_name)}
            className={cn(
              'px-3 py-1.5 rounded-full text-xs font-medium border whitespace-nowrap transition-colors',
              muscleFilter === mg.display_name ? 'bg-primary text-primary-foreground border-primary' : 'bg-secondary border-border text-muted-foreground'
            )}>
            {mg.display_name}
          </button>
        ))}
      </div>

      {/* Equipment filter */}
      <div className="flex gap-2 overflow-x-auto pb-3 mb-4 no-scrollbar">
        {EQUIPMENT_OPTIONS.map((eq) => (
          <button
            key={eq.value}
            onClick={() => setEquipmentFilter(equipmentFilter === eq.value ? '' : eq.value)}
            className={cn(
              'px-3 py-1.5 rounded-full text-xs font-medium border whitespace-nowrap transition-colors',
              equipmentFilter === eq.value ? 'bg-primary text-primary-foreground border-primary' : 'bg-secondary border-border text-muted-foreground'
            )}>
            {eq.label}
          </button>
        ))}
      </div>

      {/* Results */}
      {isLoading ? (
        <div className="space-y-3">
          {[...Array(8)].map((_, i) => <Skeleton key={i} className="h-16 w-full" />)}
        </div>
      ) : !exercises?.length ? (
        <div className="text-center py-12">
          <Dumbbell className="h-8 w-8 text-muted-foreground mx-auto mb-2" />
          <p className="text-sm text-muted-foreground">No exercises found.</p>
        </div>
      ) : (
        <div className="space-y-2">
          <p className="text-xs text-muted-foreground mb-2">
            {visibleExercises.length} of {exercises.length} exercises
          </p>
          {visibleExercises.map((ex) => (
            <Link key={ex.id} href={`/exercises/${ex.id}`}>
              <Card className="hover:border-primary/50 transition-colors cursor-pointer">
                <CardContent className="p-3 flex items-center gap-3">
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <p className="text-sm font-semibold truncate">{ex.name}</p>
                      {ex.videoUrl && <Video className="h-3.5 w-3.5 text-primary shrink-0" />}
                    </div>
                    <p className="text-xs text-muted-foreground truncate">
                      {ex.primaryMuscles.join(', ')}
                      {ex.secondaryMuscles.length > 0 && ` + ${ex.secondaryMuscles.join(', ')}`}
                    </p>
                  </div>
                  <div className="flex gap-1.5 shrink-0">
                    <Badge variant="secondary" className="text-[10px]">{ex.equipment}</Badge>
                    {ex.isCompound && <Badge className="text-[10px]">Compound</Badge>}
                    {!ex.isSystem && <Badge variant="outline" className="text-[10px] border-primary text-primary">Custom</Badge>}
                  </div>
                </CardContent>
              </Card>
            </Link>
          ))}
          {hasMore && (
            <button
              onClick={() => setVisibleCount((c) => c + PAGE_SIZE)}
              className="w-full py-3 text-sm text-primary font-medium hover:bg-primary/5 rounded-lg transition-colors">
              Show more ({exercises.length - visibleCount} remaining)
            </button>
          )}
        </div>
      )}
    </div>
  );
}
