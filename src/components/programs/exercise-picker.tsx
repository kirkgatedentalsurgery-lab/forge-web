'use client';

import { useState } from 'react';
import { useExercises } from '@/hooks/use-exercises';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { cn } from '@/lib/utils';
import { Search, Plus, X, GripVertical } from 'lucide-react';

export interface SelectedExercise {
  exerciseId: string;
  exerciseName: string;
  targetSets: number;
}

interface ExercisePickerProps {
  dayLabel: string;
  targetMuscles: string[];
  selected: SelectedExercise[];
  onChange: (exercises: SelectedExercise[]) => void;
}

export function ExercisePicker({ dayLabel, targetMuscles, selected, onChange }: ExercisePickerProps) {
  const [showSearch, setShowSearch] = useState(false);
  const [search, setSearch] = useState('');

  const { data: exercises } = useExercises({
    search: search.length > 1 ? search : undefined,
  });

  const addExercise = (id: string, name: string) => {
    if (selected.some((e) => e.exerciseId === id)) return;
    onChange([...selected, { exerciseId: id, exerciseName: name, targetSets: 3 }]);
    setShowSearch(false);
    setSearch('');
  };

  const removeExercise = (index: number) => {
    onChange(selected.filter((_, i) => i !== index));
  };

  const updateSets = (index: number, sets: number) => {
    const updated = [...selected];
    updated[index] = { ...updated[index], targetSets: Math.max(1, Math.min(10, sets)) };
    onChange(updated);
  };

  return (
    <Card>
      <CardHeader className="pb-2">
        <CardTitle className="text-sm flex items-center justify-between">
          <span>{dayLabel}</span>
          <div className="flex gap-1">
            {targetMuscles.map((m) => (
              <Badge key={m} variant="secondary" className="text-[10px]">{m}</Badge>
            ))}
          </div>
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-2">
        {/* Selected exercises */}
        {selected.map((ex, i) => (
          <div key={ex.exerciseId} className="flex items-center gap-2 p-2 rounded-lg bg-secondary">
            <GripVertical className="h-4 w-4 text-muted-foreground shrink-0" />
            <span className="text-sm font-medium flex-1 truncate">{ex.exerciseName}</span>
            <div className="flex items-center gap-1">
              <Button
                variant="ghost" size="sm" className="h-7 w-7 px-0"
                onClick={() => updateSets(i, ex.targetSets - 1)}>
                -
              </Button>
              <span className="text-xs font-bold w-8 text-center tabular-nums">{ex.targetSets}s</span>
              <Button
                variant="ghost" size="sm" className="h-7 w-7 px-0"
                onClick={() => updateSets(i, ex.targetSets + 1)}>
                +
              </Button>
            </div>
            <Button
              variant="ghost" size="sm" className="h-7 w-7 px-0 text-destructive"
              onClick={() => removeExercise(i)}>
              <X className="h-4 w-4" />
            </Button>
          </div>
        ))}

        {/* Add exercise button */}
        <Button
          variant="outline"
          size="sm"
          className="w-full border-dashed"
          onClick={() => setShowSearch(true)}>
          <Plus className="h-4 w-4 mr-1" /> Add Exercise
        </Button>

        {/* Search dialog */}
        <Dialog open={showSearch} onOpenChange={setShowSearch}>
          <DialogContent className="sm:max-w-md max-h-[70vh] overflow-y-auto">
            <DialogHeader>
              <DialogTitle>Add Exercise — {dayLabel}</DialogTitle>
            </DialogHeader>
            <div className="relative mb-3">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
              <Input
                placeholder="Search exercises..."
                className="pl-9"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                autoFocus
              />
            </div>
            <div className="space-y-1">
              {(exercises || []).slice(0, 20).map((ex) => {
                const alreadySelected = selected.some((s) => s.exerciseId === ex.id);
                return (
                  <button
                    key={ex.id}
                    disabled={alreadySelected}
                    onClick={() => addExercise(ex.id, ex.name)}
                    className={cn(
                      'w-full text-left p-3 rounded-lg transition-colors',
                      alreadySelected
                        ? 'opacity-40 cursor-not-allowed'
                        : 'hover:bg-secondary'
                    )}>
                    <p className="text-sm font-medium">{ex.name}</p>
                    <p className="text-xs text-muted-foreground">
                      {ex.primaryMuscles.join(', ')} · {ex.equipment}
                    </p>
                  </button>
                );
              })}
            </div>
          </DialogContent>
        </Dialog>
      </CardContent>
    </Card>
  );
}
