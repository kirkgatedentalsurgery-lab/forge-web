import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function formatWeight(weight: number, unit: 'lbs' | 'kg' = 'lbs'): string {
  return `${weight} ${unit}`;
}

export function convertWeight(value: number, from: 'lbs' | 'kg', to: 'lbs' | 'kg'): number {
  if (from === to) return value;
  if (from === 'lbs' && to === 'kg') return Math.round(value * 0.453592 * 10) / 10;
  return Math.round(value * 2.20462 * 10) / 10;
}

export function weightUnit(unit: 'lbs' | 'kg'): string {
  return unit;
}

export function formatDuration(seconds: number): string {
  const mins = Math.floor(seconds / 60);
  const secs = seconds % 60;
  return `${mins}:${secs.toString().padStart(2, '0')}`;
}

export function estimate1RM(weight: number, reps: number): number {
  if (reps <= 0) return 0;
  if (reps === 1) return weight;
  return Math.round(weight * (1 + reps / 30) * 100) / 100;
}
