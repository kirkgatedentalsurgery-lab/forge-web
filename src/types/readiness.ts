export interface ReadinessLog {
  id: string;
  userId: string;
  loggedAt: string;
  sleepQuality: number;    // 1-5
  sleepHours: number;
  stressLevel: number;     // 1-5
  energyLevel: number;     // 1-5
  sorenessLevel: number;   // 1-5
  motivation: number;      // 1-5
  readinessScore: number;  // 0-100
  notes?: string;
}

export interface MuscleRecoveryLog {
  id: string;
  userId: string;
  muscleGroupId: string;
  loggedAt: string;
  sorenessLevel: number;   // 1-5
  recoveryPercent: number; // 0-100
  lastTrainedAt?: string;
}

export type ReadinessBand = 'push' | 'normal' | 'conservative' | 'recovery';
