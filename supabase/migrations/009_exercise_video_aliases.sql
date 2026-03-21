-- ============================================
-- ADD VIDEO URL AND ALIASES TO EXERCISES
-- ============================================

ALTER TABLE exercises ADD COLUMN IF NOT EXISTS video_url TEXT;
ALTER TABLE exercises ADD COLUMN IF NOT EXISTS aliases TEXT[] DEFAULT '{}';
