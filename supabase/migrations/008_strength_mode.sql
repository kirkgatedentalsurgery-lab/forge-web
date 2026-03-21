-- ============================================
-- STRENGTH MODE (e1RM tracking, training max)
-- ============================================

CREATE TABLE user_strength_profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  exercise_id UUID NOT NULL REFERENCES exercises(id),
  current_e1rm NUMERIC(7,2),
  tested_1rm NUMERIC(7,2),
  last_test_date DATE,
  training_max NUMERIC(7,2),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE (user_id, exercise_id)
);

-- e1RM history for trend charts
CREATE TABLE e1rm_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  exercise_id UUID NOT NULL REFERENCES exercises(id),
  e1rm NUMERIC(7,2) NOT NULL,
  source TEXT DEFAULT 'calculated' CHECK (source IN ('calculated', 'tested', 'manual')),
  recorded_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_e1rm_history_lookup ON e1rm_history(user_id, exercise_id, recorded_at DESC);
CREATE INDEX idx_strength_profiles ON user_strength_profiles(user_id);

ALTER TABLE user_strength_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE e1rm_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users manage own strength profiles" ON user_strength_profiles
  FOR ALL USING (user_id = auth.uid());

CREATE POLICY "Users manage own e1rm history" ON e1rm_history
  FOR ALL USING (user_id = auth.uid());
