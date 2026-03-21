/**
 * Deload Detector — checks 6 criteria for deload recommendation.
 * Trigger deload when 2+ criteria are present.
 */

export interface DeloadInput {
  // Criterion 1: Consecutive sessions with poor performance
  recentSessionRatings: number[]; // last 3-5 session difficulty ratings (1-10)

  // Criterion 2: Readiness trend
  recentReadinessScores: number[]; // last 5-7 days

  // Criterion 3: e1RM trend (for any compound)
  e1rmTrending: 'up' | 'flat' | 'down';

  // Criterion 4: Sleep quality
  recentSleepScores: number[]; // last 5-7 days (1-5 scale)

  // Criterion 5: Pain flags
  painFlagCount: number; // in last 3 sessions

  // Criterion 6: Completion rate
  recentCompletionRates: number[]; // last 3 sessions (0-1)
}

export interface DeloadResult {
  shouldDeload: boolean;
  urgency: 'none' | 'suggested' | 'recommended' | 'urgent';
  triggeredCriteria: string[];
  message: string;
}

export function detectDeload(input: DeloadInput): DeloadResult {
  const triggered: string[] = [];

  // 1. Poor sessions (2+ sessions rated 8+ difficulty)
  const hardSessions = input.recentSessionRatings.filter((r) => r >= 8).length;
  if (hardSessions >= 2) {
    triggered.push('Multiple brutal sessions recently');
  }

  // 2. Low readiness (average below 55 over recent days)
  if (input.recentReadinessScores.length >= 3) {
    const avgReadiness = average(input.recentReadinessScores);
    if (avgReadiness < 55) {
      triggered.push('Readiness score consistently low');
    }
  }

  // 3. e1RM declining
  if (input.e1rmTrending === 'down') {
    triggered.push('Strength trending downward');
  }

  // 4. Poor sleep (average below 2.5)
  if (input.recentSleepScores.length >= 3) {
    const avgSleep = average(input.recentSleepScores);
    if (avgSleep < 2.5) {
      triggered.push('Sleep quality persistently poor');
    }
  }

  // 5. Pain flags (2+ in last 3 sessions)
  if (input.painFlagCount >= 2) {
    triggered.push('Pain flags increasing');
  }

  // 6. Low completion rate (below 75% for 2+ sessions)
  const lowCompletion = input.recentCompletionRates.filter((r) => r < 0.75).length;
  if (lowCompletion >= 2) {
    triggered.push('Unable to complete prescribed sets');
  }

  // Determine urgency
  let urgency: DeloadResult['urgency'] = 'none';
  let message = 'Training is progressing well. Keep pushing.';

  if (triggered.length >= 4) {
    urgency = 'urgent';
    message = 'Multiple fatigue signals detected. A deload this week is strongly recommended.';
  } else if (triggered.length >= 3) {
    urgency = 'recommended';
    message = 'Fatigue is accumulating. Consider a deload within the next 3-5 days.';
  } else if (triggered.length >= 2) {
    urgency = 'suggested';
    message = 'Some fatigue signals present. Monitor closely and consider a lighter week.';
  }

  return {
    shouldDeload: triggered.length >= 2,
    urgency,
    triggeredCriteria: triggered,
    message,
  };
}

function average(nums: number[]): number {
  if (nums.length === 0) return 0;
  return nums.reduce((s, n) => s + n, 0) / nums.length;
}
