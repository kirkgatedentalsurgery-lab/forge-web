import { z } from 'zod/v4';

export const generateProgramSchema = z.object({
  programName: z.string().min(1, 'Program name is required').max(100),
  splitType: z.enum(['push_pull_legs', 'upper_lower', 'full_body', 'bro_split', 'arnold_split', 'custom']),
  daysPerWeek: z.number().int().min(2).max(7),
  numWeeks: z.number().int().min(3).max(12),
  hasDeload: z.boolean(),
});

export const readinessInputSchema = z.object({
  sleepQuality: z.number().int().min(1).max(5),
  energyLevel: z.number().int().min(1).max(5),
  sorenessLevel: z.number().int().min(1).max(5),
  stressLevel: z.number().int().min(1).max(5),
  motivation: z.number().int().min(1).max(5),
});

export const workoutFeedbackSchema = z.object({
  difficulty: z.number().int().min(1).max(10),
  pump: z.number().int().min(1).max(5),
  mood: z.number().int().min(1).max(5),
});

export const settingsSchema = z.object({
  preferredUnit: z.enum(['lbs', 'kg']),
  defaultRestSeconds: z.number().int().min(30).max(600),
  equipment: z.array(z.string()).min(1, 'Select at least one equipment type'),
  bodyWeight: z.number().positive().optional().nullable(),
});
