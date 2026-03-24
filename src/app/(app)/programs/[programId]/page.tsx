'use client';

import { useEffect, useState } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Skeleton } from '@/components/ui/skeleton';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription } from '@/components/ui/dialog';
import { Separator } from '@/components/ui/separator';
import { ChevronDown, ChevronRight, ChevronUp, Trash2, Loader2, Play, Pause, Power, ArrowLeftRight, Plus } from 'lucide-react';
import { cn } from '@/lib/utils';
import { SPLIT_INFO } from '@/lib/constants';
import { useAuth } from '@/providers/auth-provider';
import { ExerciseBrowserDialog } from '@/components/workout/exercise-browser-dialog';
import Link from 'next/link';

export default function ProgramDetailPage() {
  const { programId } = useParams<{ programId: string }>();
  const router = useRouter();
  const { user } = useAuth();
  const [program, setProgram] = useState<any>(null);
  const [weeks, setWeeks] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [activating, setActivating] = useState(false);
  const [expandedWeek, setExpandedWeek] = useState(1);
  const [showDeleteDialog, setShowDeleteDialog] = useState(false);
  const [deleteConfirmText, setDeleteConfirmText] = useState('');
  const [deleting, setDeleting] = useState(false);
  const [editingExercise, setEditingExercise] = useState<string | null>(null);
  const [editValues, setEditValues] = useState<{ sets: number; repsMin: number; repsMax: number }>({ sets: 3, repsMin: 8, repsMax: 12 });
  const [swapTarget, setSwapTarget] = useState<{ rowId: string; exerciseId: string; exerciseName: string } | null>(null);
  const [addTarget, setAddTarget] = useState<{ dayId: string } | null>(null);

  const handleActivate = async () => {
    if (!user || !programId) return;
    setActivating(true);
    const supabase = createClient();
    // Pause all other active programs
    await supabase.from('programs').update({ status: 'paused' })
      .eq('user_id', user.id).eq('status', 'active');
    // Activate this one
    await supabase.from('programs').update({
      status: 'active',
      started_at: new Date().toISOString(),
    }).eq('id', programId);
    setProgram((prev: any) => prev ? { ...prev, status: 'active' } : prev);
    setActivating(false);
  };

  const handlePause = async () => {
    if (!programId) return;
    setActivating(true);
    const supabase = createClient();
    await supabase.from('programs').update({ status: 'paused' }).eq('id', programId);
    setProgram((prev: any) => prev ? { ...prev, status: 'paused' } : prev);
    setActivating(false);
  };

  const handleSwapExercise = async (rowId: string, newExerciseId: string, newExerciseName: string) => {
    const supabase = createClient();
    await supabase.from('program_exercises')
      .update({ exercise_id: newExerciseId })
      .eq('id', rowId);

    // Update local state
    setWeeks((prev) => prev.map((w) => ({
      ...w,
      days: w.days.map((d: any) => ({
        ...d,
        exercises: d.exercises.map((ex: any) =>
          ex.id === rowId
            ? { ...ex, exercise_id: newExerciseId, exercise: { ...ex.exercise, name: newExerciseName } }
            : ex
        ),
      })),
    })));
    setSwapTarget(null);
  };

  const handleAddExercise = async (dayId: string, exerciseId: string) => {
    const supabase = createClient();
    const day = weeks.flatMap((w) => w.days).find((d: any) => d.id === dayId);
    const maxOrder = day?.exercises?.length
      ? Math.max(...day.exercises.map((e: any) => e.order_index))
      : -1;

    const { data: newRow } = await supabase
      .from('program_exercises')
      .insert({
        program_day_id: dayId,
        exercise_id: exerciseId,
        order_index: maxOrder + 1,
        target_sets: 3,
        target_reps_min: 8,
        target_reps_max: 12,
        target_rir: 2,
        rest_seconds: 120,
      })
      .select('*, exercise:exercises (name, equipment, is_compound)')
      .single();

    if (!newRow) return;

    setWeeks((prev) => prev.map((w) => ({
      ...w,
      days: w.days.map((d: any) =>
        d.id === dayId ? { ...d, exercises: [...d.exercises, newRow] } : d
      ),
    })));
    setAddTarget(null);
  };

  const handleSaveExercise = async (exerciseRowId: string) => {
    const supabase = createClient();
    await supabase.from('program_exercises').update({
      target_sets: editValues.sets,
      target_reps_min: editValues.repsMin,
      target_reps_max: editValues.repsMax,
    }).eq('id', exerciseRowId);

    // Update local state
    setWeeks((prev) => prev.map((w) => ({
      ...w,
      days: w.days.map((d: any) => ({
        ...d,
        exercises: d.exercises.map((ex: any) =>
          ex.id === exerciseRowId
            ? { ...ex, target_sets: editValues.sets, target_reps_min: editValues.repsMin, target_reps_max: editValues.repsMax }
            : ex
        ),
      })),
    })));
    setEditingExercise(null);
  };

  const handleMoveExercise = async (dayId: string, exerciseId: string, direction: 'up' | 'down') => {
    const day = weeks.flatMap((w) => w.days).find((d: any) => d.id === dayId);
    if (!day) return;
    const exercises = [...day.exercises];
    const idx = exercises.findIndex((e: any) => e.id === exerciseId);
    const swapIdx = direction === 'up' ? idx - 1 : idx + 1;
    if (swapIdx < 0 || swapIdx >= exercises.length) return;

    const supabase = createClient();
    // Swap order_index values
    await Promise.all([
      supabase.from('program_exercises').update({ order_index: exercises[swapIdx].order_index }).eq('id', exercises[idx].id),
      supabase.from('program_exercises').update({ order_index: exercises[idx].order_index }).eq('id', exercises[swapIdx].id),
    ]);

    // Swap locally
    [exercises[idx], exercises[swapIdx]] = [exercises[swapIdx], exercises[idx]];
    setWeeks((prev) => prev.map((w) => ({
      ...w,
      days: w.days.map((d: any) => d.id === dayId ? { ...d, exercises } : d),
    })));
  };

  const handleDelete = async () => {
    if (deleteConfirmText !== 'DELETE' || !programId) return;
    setDeleting(true);

    const supabase = createClient();

    // Unlink workout sessions so history is preserved
    await supabase
      .from('workout_sessions')
      .update({ program_id: null, program_day_id: null })
      .eq('program_id', programId);

    // Now delete the program (cascades handle weeks/days/exercises)
    const { error } = await supabase
      .from('programs')
      .delete()
      .eq('id', programId);

    if (error) {
      alert('Failed to delete: ' + error.message);
      setDeleting(false);
      return;
    }

    router.push('/programs');
  };

  useEffect(() => {
    async function load() {
      const supabase = createClient();

      const { data: prog } = await supabase
        .from('programs').select('*').eq('id', programId).single();
      if (!prog) { setLoading(false); return; }
      setProgram(prog);

      // Batch queries instead of N+1 loops
      const { data: weekRows } = await supabase
        .from('program_weeks').select('*').eq('program_id', programId).order('week_number');

      if (!weekRows?.length) { setWeeks([]); setLoading(false); return; }

      const weekIds = weekRows.map((w) => w.id);
      const { data: allDays } = await supabase
        .from('program_days').select('*').in('program_week_id', weekIds).order('day_number');

      const dayIds = (allDays || []).map((d) => d.id);
      const { data: allExercises } = dayIds.length
        ? await supabase
            .from('program_exercises')
            .select('*, exercise:exercises (name, equipment, is_compound)')
            .in('program_day_id', dayIds).order('order_index')
        : { data: [] };

      // Group exercises by day
      const exercisesByDay = new Map<string, any[]>();
      for (const ex of allExercises || []) {
        const list = exercisesByDay.get(ex.program_day_id) || [];
        list.push(ex);
        exercisesByDay.set(ex.program_day_id, list);
      }

      // Group days by week
      const daysByWeek = new Map<string, any[]>();
      for (const day of allDays || []) {
        const list = daysByWeek.get(day.program_week_id) || [];
        list.push({ ...day, exercises: exercisesByDay.get(day.id) || [] });
        daysByWeek.set(day.program_week_id, list);
      }

      const weekDetails = weekRows.map((week) => ({
        ...week,
        days: daysByWeek.get(week.id) || [],
      }));

      setWeeks(weekDetails);
      setLoading(false);
    }
    load();
  }, [programId]);

  if (loading) {
    return (
      <div className="p-4 lg:p-6 max-w-4xl mx-auto space-y-4">
        <Skeleton className="h-8 w-64" />
        <Skeleton className="h-32 w-full" />
        <Skeleton className="h-32 w-full" />
      </div>
    );
  }

  if (!program) {
    return (
      <div className="p-4 lg:p-6 text-center text-muted-foreground">Program not found.</div>
    );
  }

  const splitInfo = SPLIT_INFO[program.split_type as keyof typeof SPLIT_INFO];

  return (
    <div className="p-4 lg:p-6 max-w-4xl mx-auto space-y-6">
      <div>
        <h1 className="text-2xl font-bold tracking-tight">{program.name}</h1>
        <div className="flex flex-wrap gap-2 mt-2">
          <Badge>{splitInfo?.shortName || program.split_type}</Badge>
          <Badge variant="secondary">{program.days_per_week} days/week</Badge>
          <Badge variant="secondary">{program.num_weeks} weeks</Badge>
          <Badge variant={program.status === 'active' ? 'default' : 'secondary'}>
            {program.status}
          </Badge>
        </div>
      </div>

      {/* Action buttons */}
      {program.status === 'active' ? (
        <div className="flex gap-3">
          <Link href="/workout" className="flex-1">
            <Button className="w-full h-12 text-sm font-bold uppercase tracking-wider">
              <Play className="h-4 w-4 mr-2" /> Start Workout
            </Button>
          </Link>
          <Button variant="outline" className="h-12" onClick={handlePause} disabled={activating}>
            <Pause className="h-4 w-4" />
          </Button>
        </div>
      ) : program.status === 'paused' ? (
        <Button className="w-full h-12 text-sm font-bold uppercase tracking-wider" onClick={handleActivate} disabled={activating}>
          {activating ? <Loader2 className="h-4 w-4 mr-2 animate-spin" /> : <Power className="h-4 w-4 mr-2" />}
          Activate Program
        </Button>
      ) : program.status === 'completed' ? (
        <div className="text-center text-sm text-muted-foreground py-2">
          This program has been completed.
        </div>
      ) : null}

      {weeks.map((week) => (
        <div key={week.id}>
          <button
            onClick={() => setExpandedWeek(expandedWeek === week.week_number ? -1 : week.week_number)}
            className="w-full">
            <Card className={cn(
              'transition-colors',
              expandedWeek === week.week_number && 'border-primary'
            )}>
              <CardContent className="p-4 flex items-center justify-between">
                <div className="flex items-center gap-3">
                  {expandedWeek === week.week_number
                    ? <ChevronDown className="h-4 w-4 text-primary" />
                    : <ChevronRight className="h-4 w-4 text-muted-foreground" />}
                  <span className="font-semibold">
                    Week {week.week_number}{week.is_deload ? ' (Deload)' : ''}
                  </span>
                </div>
                <div className="flex gap-2">
                  <Badge variant="secondary">RIR {week.target_rir}</Badge>
                  {week.is_deload && <Badge variant="secondary">50% vol</Badge>}
                </div>
              </CardContent>
            </Card>
          </button>

          {expandedWeek === week.week_number && week.days.map((day: any) => (
            <Card key={day.id} className="ml-4 mt-2">
              <CardHeader className="pb-2">
                <CardTitle className="text-sm text-primary">
                  Day {day.day_number}: {day.day_label}
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-1">
                {day.exercises.map((ex: any, exIdx: number) => (
                  editingExercise === ex.id ? (
                    <div key={ex.id} className="py-3 px-2 rounded-lg bg-primary/5 border border-primary/30 space-y-3">
                      <p className="text-sm font-semibold">{ex.exercise?.name || 'Unknown'}</p>
                      <div className="grid grid-cols-3 gap-2">
                        <div>
                          <label className="text-[10px] text-muted-foreground uppercase">Sets</label>
                          <Input type="number" inputMode="numeric" className="h-9 text-center"
                            value={editValues.sets}
                            onChange={(e) => setEditValues({ ...editValues, sets: parseInt(e.target.value) || 1 })} />
                        </div>
                        <div>
                          <label className="text-[10px] text-muted-foreground uppercase">Min Reps</label>
                          <Input type="number" inputMode="numeric" className="h-9 text-center"
                            value={editValues.repsMin}
                            onChange={(e) => setEditValues({ ...editValues, repsMin: parseInt(e.target.value) || 1 })} />
                        </div>
                        <div>
                          <label className="text-[10px] text-muted-foreground uppercase">Max Reps</label>
                          <Input type="number" inputMode="numeric" className="h-9 text-center"
                            value={editValues.repsMax}
                            onChange={(e) => setEditValues({ ...editValues, repsMax: parseInt(e.target.value) || 1 })} />
                        </div>
                      </div>
                      <div className="flex gap-2">
                        <Button size="sm" className="flex-1 h-8" onClick={() => handleSaveExercise(ex.id)}>Save</Button>
                        <Button size="sm" variant="ghost" className="h-8" onClick={() => setEditingExercise(null)}>Cancel</Button>
                      </div>
                    </div>
                  ) : (
                    <div key={ex.id} className="flex items-center justify-between py-2 border-b border-border last:border-0 group">
                      <div className="flex items-center gap-2">
                        <div className="flex flex-col">
                          <button className="text-muted-foreground hover:text-foreground h-4" disabled={exIdx === 0}
                            onClick={() => handleMoveExercise(day.id, ex.id, 'up')}>
                            <ChevronUp className="h-3.5 w-3.5" />
                          </button>
                          <button className="text-muted-foreground hover:text-foreground h-4" disabled={exIdx === day.exercises.length - 1}
                            onClick={() => handleMoveExercise(day.id, ex.id, 'down')}>
                            <ChevronDown className="h-3.5 w-3.5" />
                          </button>
                        </div>
                        <div>
                          <p className="text-sm font-medium">{ex.exercise?.name || 'Unknown'}</p>
                          <p className="text-xs text-muted-foreground">
                            {ex.target_sets} sets x {ex.target_reps_min}-{ex.target_reps_max} reps @ RIR {ex.target_rir}
                          </p>
                        </div>
                      </div>
                      <div className="flex items-center gap-2">
                        {ex.exercise?.is_compound && (
                          <Badge variant="secondary" className="text-xs">Compound</Badge>
                        )}
                        <Button variant="ghost" size="sm" className="h-7 px-2 text-xs"
                          onClick={() => setSwapTarget({ rowId: ex.id, exerciseId: ex.exercise_id, exerciseName: ex.exercise?.name || 'Unknown' })}>
                          <ArrowLeftRight className="h-3 w-3 mr-1" /> Swap
                        </Button>
                        <Button variant="ghost" size="sm" className="h-7 px-2 text-xs"
                          onClick={() => {
                            setEditingExercise(ex.id);
                            setEditValues({ sets: ex.target_sets, repsMin: ex.target_reps_min, repsMax: ex.target_reps_max });
                          }}>
                          Edit
                        </Button>
                      </div>
                    </div>
                  )
                ))}
                <div className="px-4 pb-3 pt-1">
                  <Button
                    variant="outline"
                    size="sm"
                    className="w-full border-dashed"
                    onClick={() => setAddTarget({ dayId: day.id })}>
                    <Plus className="h-4 w-4 mr-1" /> Add Exercise
                  </Button>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      ))}

      {/* Delete program */}
      <Separator className="my-6" />
      <Button
        variant="outline"
        className="w-full text-destructive border-destructive/30 hover:bg-destructive/10"
        onClick={() => setShowDeleteDialog(true)}>
        <Trash2 className="h-4 w-4 mr-2" />
        Delete Program
      </Button>

      {/* Delete confirmation dialog */}
      <Dialog open={showDeleteDialog} onOpenChange={(open) => {
        setShowDeleteDialog(open);
        if (!open) setDeleteConfirmText('');
      }}>
        <DialogContent className="sm:max-w-md">
          <DialogHeader>
            <DialogTitle>Delete Program</DialogTitle>
            <DialogDescription>
              This will permanently delete <span className="font-semibold text-foreground">{program?.name}</span> and all its weeks, days, and exercises. This cannot be undone.
            </DialogDescription>
          </DialogHeader>
          <div className="space-y-4 pt-2">
            <div className="space-y-2">
              <Label htmlFor="delete-confirm">
                Type <span className="font-mono font-bold text-destructive">DELETE</span> to confirm
              </Label>
              <Input
                id="delete-confirm"
                value={deleteConfirmText}
                onChange={(e) => setDeleteConfirmText(e.target.value)}
                placeholder="Type DELETE here"
                autoComplete="off"
              />
            </div>
            <div className="flex gap-3">
              <Button
                variant="outline"
                className="flex-1"
                onClick={() => {
                  setShowDeleteDialog(false);
                  setDeleteConfirmText('');
                }}>
                Cancel
              </Button>
              <Button
                variant="destructive"
                className="flex-1"
                disabled={deleteConfirmText !== 'DELETE' || deleting}
                onClick={handleDelete}>
                {deleting ? <Loader2 className="h-4 w-4 animate-spin" /> : 'Delete Forever'}
              </Button>
            </div>
          </div>
        </DialogContent>
      </Dialog>

      {/* Swap exercise dialog */}
      <ExerciseBrowserDialog
        open={!!swapTarget}
        onOpenChange={(open) => { if (!open) setSwapTarget(null); }}
        mode="swap"
        currentExerciseName={swapTarget?.exerciseName}
        existingExerciseIds={
          swapTarget
            ? weeks.flatMap((w) => w.days)
                .find((d: any) => d.exercises?.some((e: any) => e.id === swapTarget.rowId))
                ?.exercises?.map((e: any) => e.exercise_id) || []
            : []
        }
        onSelect={(newId, newName) => {
          if (swapTarget) handleSwapExercise(swapTarget.rowId, newId, newName);
        }}
      />

      {/* Add exercise dialog */}
      <ExerciseBrowserDialog
        open={!!addTarget}
        onOpenChange={(open) => { if (!open) setAddTarget(null); }}
        mode="add"
        existingExerciseIds={
          addTarget
            ? weeks.flatMap((w) => w.days)
                .find((d: any) => d.id === addTarget.dayId)
                ?.exercises?.map((e: any) => e.exercise_id) || []
            : []
        }
        onSelect={(newId, newName) => {
          if (addTarget) handleAddExercise(addTarget.dayId, newId);
        }}
      />
    </div>
  );
}
