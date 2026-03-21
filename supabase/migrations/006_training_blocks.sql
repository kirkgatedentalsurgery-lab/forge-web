-- ============================================
-- TRAINING BLOCKS (Enhanced Mesocycle)
-- ============================================

CREATE TYPE block_phase AS ENUM ('accumulation', 'intensification', 'deload', 'peaking', 'transition');
CREATE TYPE training_mode AS ENUM ('coach', 'guided', 'builder', 'manual');

CREATE TABLE training_blocks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  program_id UUID REFERENCES programs(id) ON DELETE SET NULL,
  name TEXT NOT NULL,
  phase block_phase NOT NULL DEFAULT 'accumulation',
  training_mode training_mode NOT NULL DEFAULT 'coach',
  start_date DATE,
  end_date DATE,
  target_weeks SMALLINT NOT NULL DEFAULT 4,
  current_week SMALLINT DEFAULT 1,
  is_active BOOLEAN DEFAULT true,
  config JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_training_blocks_user ON training_blocks(user_id, is_active);

ALTER TABLE training_blocks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own blocks" ON training_blocks
  FOR ALL USING (user_id = auth.uid());
