-- ============================================
-- EXERCISE METADATA EXPANSION
-- ============================================

-- Add scoring columns to exercises
ALTER TABLE exercises ADD COLUMN IF NOT EXISTS fatigue_score SMALLINT DEFAULT 5 CHECK (fatigue_score BETWEEN 1 AND 10);
ALTER TABLE exercises ADD COLUMN IF NOT EXISTS joint_stress SMALLINT DEFAULT 5 CHECK (joint_stress BETWEEN 1 AND 10);
ALTER TABLE exercises ADD COLUMN IF NOT EXISTS spine_load SMALLINT DEFAULT 3 CHECK (spine_load BETWEEN 1 AND 10);
ALTER TABLE exercises ADD COLUMN IF NOT EXISTS skill_score SMALLINT DEFAULT 3 CHECK (skill_score BETWEEN 1 AND 10);
ALTER TABLE exercises ADD COLUMN IF NOT EXISTS hypertrophy_score SMALLINT DEFAULT 5 CHECK (hypertrophy_score BETWEEN 1 AND 10);
ALTER TABLE exercises ADD COLUMN IF NOT EXISTS strength_score SMALLINT DEFAULT 5 CHECK (strength_score BETWEEN 1 AND 10);
ALTER TABLE exercises ADD COLUMN IF NOT EXISTS is_unilateral BOOLEAN DEFAULT false;

-- Substitution candidates
CREATE TABLE exercise_substitutions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exercise_id UUID NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  substitute_id UUID NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  similarity_score NUMERIC(3,2) DEFAULT 0.80,
  UNIQUE (exercise_id, substitute_id),
  CHECK (exercise_id != substitute_id)
);

CREATE INDEX idx_exercise_subs ON exercise_substitutions(exercise_id);

ALTER TABLE exercise_substitutions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Read exercise substitutions" ON exercise_substitutions
  FOR SELECT USING (true);
