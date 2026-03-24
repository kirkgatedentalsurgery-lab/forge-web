'use client';

import { useState, useEffect, useMemo } from 'react';
import { useExercises, useMuscleGroups } from '@/hooks/use-exercises';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { Input } from '@/components/ui/input';
import { Badge } from '@/components/ui/badge';
import { Skeleton } from '@/components/ui/skeleton';
import { cn } from '@/lib/utils';
import { Search, ArrowRightLeft, Plus, Dumbbell } from 'lucide-react';

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

interface ExerciseBrowserDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  mode: 'swap' | 'add';
  currentExerciseName?: string;
  defaultMuscleGroup?: string;
  existingExerciseIds?: string[];
  onSelect: (exerciseId: string, exerciseName: string) => void;
}

export function ExerciseBrowserDialog({
  open,
  onOpenChange,
  mode,
  currentExerciseName,
  defaultMuscleGroup,
  existingExerciseIds = [],
  onSelect,
}: ExerciseBrowserDialogProps) {
  const [search, setSearch] = useState('');
  const [debouncedSearch, setDebouncedSearch] = useState('');
  const [muscleFilter, setMuscleFilter] = useState(defaultMuscleGroup || '');
  const [equipmentFilter, setEquipmentFilter] = useState('');
  const [visibleCount, setVisibleCount] = useState(PAGE_SIZE);

  // Reset state when dialog opens
  useEffect(() => {
    if (open) {
      setSearch('');
      setDebouncedSearch('');
      setMuscleFilter(defaultMuscleGroup || '');
      setEquipmentFilter('');
      setVisibleCount(PAGE_SIZE);
    }
  }, [open, defaultMuscleGroup]);

  // Debounce search
  useEffect(() => {
    const timer = setTimeout(() => setDebouncedSearch(search), 300);
    return () => clearTimeout(timer);
  }, [search]);

  // Reset visible count when filters change
  useEffect(() => {
    setVisibleCount(PAGE_SIZE);
  }, [debouncedSearch, muscleFilter, equipmentFilter]);

  const { data: exercises, isLoading } = useExercises({
    search: debouncedSearch.length > 1 ? debouncedSearch : undefined,
    muscleGroup: muscleFilter || undefined,
    equipment: equipmentFilter || undefined,
  });

  const { data: muscleGroups } = useMuscleGroups();

  const existingSet = useMemo(() => new Set(existingExerciseIds), [existingExerciseIds]);

  const visibleExercises = useMemo(
    () => exercises?.slice(0, visibleCount) || [],
    [exercises, visibleCount]
  );
  const hasMore = (exercises?.length || 0) > visibleCount;

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-lg max-h-[85vh] flex flex-col p-0">
        <DialogHeader className="px-4 pt-4 pb-2">
          <DialogTitle className="flex items-center gap-2">
            {mode === 'swap' ? (
              <><ArrowRightLeft className="h-4 w-4" /> Swap Exercise</>
            ) : (
              <><Plus className="h-4 w-4" /> Add Exercise</>
            )}
          </DialogTitle>
          {mode === 'swap' && currentExerciseName && (
            <p className="text-sm text-muted-foreground">
              Replace <span className="font-semibold text-foreground">{currentExerciseName}</span>
            </p>
          )}
        </DialogHeader>

        <div className="px-4 space-y-2">
          {/* Search */}
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              placeholder="Search exercises..."
              className="pl-9"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              autoFocus
            />
          </div>

          {/* Muscle group filter */}
          <div className="flex gap-1.5 overflow-x-auto pb-1 no-scrollbar">
            <button
              onClick={() => setMuscleFilter('')}
              className={cn(
                'px-2.5 py-1 rounded-full text-[11px] font-medium border whitespace-nowrap transition-colors',
                !muscleFilter
                  ? 'bg-primary text-primary-foreground border-primary'
                  : 'bg-secondary border-border text-muted-foreground'
              )}>
              All
            </button>
            {(muscleGroups || []).map((mg: any) => (
              <button
                key={mg.id}
                onClick={() => setMuscleFilter(muscleFilter === mg.display_name ? '' : mg.display_name)}
                className={cn(
                  'px-2.5 py-1 rounded-full text-[11px] font-medium border whitespace-nowrap transition-colors',
                  muscleFilter === mg.display_name
                    ? 'bg-primary text-primary-foreground border-primary'
                    : 'bg-secondary border-border text-muted-foreground'
                )}>
                {mg.display_name}
              </button>
            ))}
          </div>

          {/* Equipment filter */}
          <div className="flex gap-1.5 overflow-x-auto pb-1 no-scrollbar">
            {EQUIPMENT_OPTIONS.map((eq) => (
              <button
                key={eq.value}
                onClick={() => setEquipmentFilter(equipmentFilter === eq.value ? '' : eq.value)}
                className={cn(
                  'px-2.5 py-1 rounded-full text-[11px] font-medium border whitespace-nowrap transition-colors',
                  equipmentFilter === eq.value
                    ? 'bg-primary text-primary-foreground border-primary'
                    : 'bg-secondary border-border text-muted-foreground'
                )}>
                {eq.label}
              </button>
            ))}
          </div>
        </div>

        {/* Results */}
        <div className="flex-1 overflow-y-auto px-4 pb-4">
          {isLoading ? (
            <div className="space-y-2 pt-1">
              {[...Array(6)].map((_, i) => <Skeleton key={i} className="h-14 w-full" />)}
            </div>
          ) : !exercises?.length ? (
            <div className="text-center py-8">
              <Dumbbell className="h-8 w-8 text-muted-foreground mx-auto mb-2" />
              <p className="text-sm text-muted-foreground">No exercises found.</p>
            </div>
          ) : (
            <div className="space-y-1.5 pt-1">
              <p className="text-[11px] text-muted-foreground">
                {exercises.length} exercise{exercises.length !== 1 ? 's' : ''}
              </p>
              {visibleExercises.map((ex) => {
                const isExisting = existingSet.has(ex.id);
                return (
                  <button
                    key={ex.id}
                    disabled={isExisting}
                    onClick={() => {
                      onSelect(ex.id, ex.name);
                      onOpenChange(false);
                    }}
                    className={cn(
                      'w-full text-left p-2.5 rounded-lg border transition-colors',
                      isExisting
                        ? 'border-border bg-muted/50 opacity-40 cursor-not-allowed'
                        : 'border-border bg-secondary hover:border-primary/50 cursor-pointer active:scale-[0.98]'
                    )}>
                    <div className="flex items-center justify-between">
                      <p className={cn('text-sm font-medium truncate', isExisting && 'line-through')}>
                        {ex.name}
                      </p>
                      <div className="flex gap-1 shrink-0 ml-2">
                        <Badge variant="secondary" className="text-[10px]">{ex.equipment}</Badge>
                        {ex.isCompound && <Badge className="text-[10px]">Compound</Badge>}
                      </div>
                    </div>
                    <p className="text-[11px] text-muted-foreground truncate mt-0.5">
                      {ex.primaryMuscles.join(', ')}
                      {ex.secondaryMuscles.length > 0 && ` + ${ex.secondaryMuscles.join(', ')}`}
                    </p>
                  </button>
                );
              })}
              {hasMore && (
                <button
                  onClick={() => setVisibleCount((c) => c + PAGE_SIZE)}
                  className="w-full py-2.5 text-sm text-primary font-medium hover:bg-primary/5 rounded-lg transition-colors">
                  Show more ({(exercises?.length || 0) - visibleCount} remaining)
                </button>
              )}
            </div>
          )}
        </div>
      </DialogContent>
    </Dialog>
  );
}
