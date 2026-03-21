-- ============================================
-- ONBOARDING & USER PREFERENCES
-- ============================================

-- Extend user_profiles
ALTER TABLE user_profiles ADD COLUMN IF NOT EXISTS training_goal TEXT CHECK (training_goal IN ('hypertrophy', 'strength', 'powerbuilding', 'general_fitness', 'body_recomp'));
ALTER TABLE user_profiles ADD COLUMN IF NOT EXISTS training_age_months SMALLINT;
ALTER TABLE user_profiles ADD COLUMN IF NOT EXISTS preferred_session_minutes SMALLINT DEFAULT 60;
ALTER TABLE user_profiles ADD COLUMN IF NOT EXISTS preferred_split split_type;
ALTER TABLE user_profiles ADD COLUMN IF NOT EXISTS onboarding_completed BOOLEAN DEFAULT false;
ALTER TABLE user_profiles ADD COLUMN IF NOT EXISTS body_weight NUMERIC(5,1);
ALTER TABLE user_profiles ADD COLUMN IF NOT EXISTS height_cm NUMERIC(5,1);
ALTER TABLE user_profiles ADD COLUMN IF NOT EXISTS age SMALLINT;
ALTER TABLE user_profiles ADD COLUMN IF NOT EXISTS gender TEXT CHECK (gender IN ('male', 'female', 'other'));

-- Favorite exercises
CREATE TABLE user_favorite_exercises (
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  exercise_id UUID NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  PRIMARY KEY (user_id, exercise_id)
);

-- Disliked exercises
CREATE TABLE user_disliked_exercises (
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  exercise_id UUID NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  PRIMARY KEY (user_id, exercise_id)
);

-- Injuries / limitations
CREATE TABLE user_injuries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  body_area TEXT NOT NULL,
  severity TEXT DEFAULT 'moderate' CHECK (severity IN ('minor', 'moderate', 'severe')),
  avoid_patterns movement_pattern[],
  notes TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Priority muscles
CREATE TABLE user_priority_muscles (
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  muscle_group_id UUID NOT NULL REFERENCES muscle_groups(id),
  priority_level SMALLINT DEFAULT 1 CHECK (priority_level BETWEEN 1 AND 3),
  PRIMARY KEY (user_id, muscle_group_id)
);

-- RLS
ALTER TABLE user_favorite_exercises ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_disliked_exercises ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_injuries ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_priority_muscles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users manage own favorites" ON user_favorite_exercises
  FOR ALL USING (user_id = auth.uid());

CREATE POLICY "Users manage own dislikes" ON user_disliked_exercises
  FOR ALL USING (user_id = auth.uid());

CREATE POLICY "Users manage own injuries" ON user_injuries
  FOR ALL USING (user_id = auth.uid());

CREATE POLICY "Users manage own priorities" ON user_priority_muscles
  FOR ALL USING (user_id = auth.uid());
