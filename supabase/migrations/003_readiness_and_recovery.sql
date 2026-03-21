-- ============================================
-- READINESS & RECOVERY TRACKING
-- ============================================

-- Daily readiness check-in
CREATE TABLE readiness_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  logged_at DATE NOT NULL DEFAULT CURRENT_DATE,
  sleep_quality SMALLINT NOT NULL CHECK (sleep_quality BETWEEN 1 AND 5),
  sleep_hours NUMERIC(3,1),
  stress_level SMALLINT NOT NULL CHECK (stress_level BETWEEN 1 AND 5),
  energy_level SMALLINT NOT NULL CHECK (energy_level BETWEEN 1 AND 5),
  soreness_level SMALLINT NOT NULL CHECK (soreness_level BETWEEN 1 AND 5),
  motivation SMALLINT NOT NULL CHECK (motivation BETWEEN 1 AND 5),
  readiness_score SMALLINT NOT NULL CHECK (readiness_score BETWEEN 0 AND 100),
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE (user_id, logged_at)
);

-- Per-muscle recovery tracking
CREATE TABLE muscle_recovery_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  muscle_group_id UUID NOT NULL REFERENCES muscle_groups(id),
  logged_at DATE NOT NULL DEFAULT CURRENT_DATE,
  soreness SMALLINT CHECK (soreness BETWEEN 0 AND 5),
  estimated_recovery_pct SMALLINT CHECK (estimated_recovery_pct BETWEEN 0 AND 100),
  UNIQUE (user_id, muscle_group_id, logged_at)
);

-- Indexes
CREATE INDEX idx_readiness_user_date ON readiness_logs(user_id, logged_at DESC);
CREATE INDEX idx_muscle_recovery_user ON muscle_recovery_logs(user_id, logged_at DESC);

-- RLS
ALTER TABLE readiness_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE muscle_recovery_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users manage own readiness" ON readiness_logs
  FOR ALL USING (user_id = auth.uid());

CREATE POLICY "Users manage own muscle recovery" ON muscle_recovery_logs
  FOR ALL USING (user_id = auth.uid());
