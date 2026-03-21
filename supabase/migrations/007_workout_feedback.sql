-- ============================================
-- POST-WORKOUT FEEDBACK & PAIN FLAGS
-- ============================================

-- Pain flags on individual sets
ALTER TABLE workout_sets ADD COLUMN IF NOT EXISTS pain_flag BOOLEAN DEFAULT false;
ALTER TABLE workout_sets ADD COLUMN IF NOT EXISTS pain_location TEXT;
ALTER TABLE workout_sets ADD COLUMN IF NOT EXISTS pain_severity SMALLINT CHECK (pain_severity BETWEEN 1 AND 5);

-- Post-workout feedback
CREATE TABLE workout_feedback (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  workout_session_id UUID NOT NULL REFERENCES workout_sessions(id) ON DELETE CASCADE,
  perceived_difficulty SMALLINT CHECK (perceived_difficulty BETWEEN 1 AND 10),
  overall_pump SMALLINT CHECK (overall_pump BETWEEN 1 AND 5),
  muscle_soreness JSONB DEFAULT '{}',
  mood_after SMALLINT CHECK (mood_after BETWEEN 1 AND 5),
  would_repeat BOOLEAN,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE (workout_session_id)
);

ALTER TABLE workout_feedback ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own feedback" ON workout_feedback
  FOR ALL USING (
    workout_session_id IN (
      SELECT id FROM workout_sessions WHERE user_id = auth.uid()
    )
  );
