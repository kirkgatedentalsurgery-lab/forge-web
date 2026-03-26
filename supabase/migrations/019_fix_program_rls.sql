-- Fix RLS policies for program-related tables
-- Ensures authenticated users can create and manage their own programs

-- Programs table
ALTER TABLE programs ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own programs" ON programs;
CREATE POLICY "Users can view own programs" ON programs
  FOR SELECT USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can create programs" ON programs;
CREATE POLICY "Users can create programs" ON programs
  FOR INSERT WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can update own programs" ON programs;
CREATE POLICY "Users can update own programs" ON programs
  FOR UPDATE USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own programs" ON programs;
CREATE POLICY "Users can delete own programs" ON programs
  FOR DELETE USING (auth.uid() = user_id);

-- Program weeks — access via program ownership
ALTER TABLE program_weeks ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own program weeks" ON program_weeks;
CREATE POLICY "Users can manage own program weeks" ON program_weeks
  FOR ALL USING (
    EXISTS (SELECT 1 FROM programs WHERE programs.id = program_weeks.program_id AND programs.user_id = auth.uid())
  );

-- Program days — access via program week → program ownership
ALTER TABLE program_days ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own program days" ON program_days;
CREATE POLICY "Users can manage own program days" ON program_days
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM program_weeks
      JOIN programs ON programs.id = program_weeks.program_id
      WHERE program_weeks.id = program_days.program_week_id
      AND programs.user_id = auth.uid()
    )
  );

-- Program exercises — access via program day → week → program ownership
ALTER TABLE program_exercises ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own program exercises" ON program_exercises;
CREATE POLICY "Users can manage own program exercises" ON program_exercises
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM program_days
      JOIN program_weeks ON program_weeks.id = program_days.program_week_id
      JOIN programs ON programs.id = program_weeks.program_id
      WHERE program_days.id = program_exercises.program_day_id
      AND programs.user_id = auth.uid()
    )
  );

-- Also ensure user_profiles allows upsert
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own profile" ON user_profiles;
CREATE POLICY "Users can view own profile" ON user_profiles
  FOR SELECT USING (auth.uid() = id);

DROP POLICY IF EXISTS "Users can insert own profile" ON user_profiles;
CREATE POLICY "Users can insert own profile" ON user_profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

DROP POLICY IF EXISTS "Users can update own profile" ON user_profiles;
CREATE POLICY "Users can update own profile" ON user_profiles
  FOR UPDATE USING (auth.uid() = id);

-- Workout sessions
ALTER TABLE workout_sessions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own sessions" ON workout_sessions;
CREATE POLICY "Users can manage own sessions" ON workout_sessions
  FOR ALL USING (auth.uid() = user_id);

-- Workout sets — via session ownership
ALTER TABLE workout_sets ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own sets" ON workout_sets;
CREATE POLICY "Users can manage own sets" ON workout_sets
  FOR ALL USING (
    EXISTS (SELECT 1 FROM workout_sessions WHERE workout_sessions.id = workout_sets.workout_session_id AND workout_sessions.user_id = auth.uid())
  );

-- User exercise history
ALTER TABLE user_exercise_history ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own exercise history" ON user_exercise_history;
CREATE POLICY "Users can manage own exercise history" ON user_exercise_history
  FOR ALL USING (auth.uid() = user_id);

-- e1rm history
ALTER TABLE e1rm_history ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own e1rm history" ON e1rm_history;
CREATE POLICY "Users can manage own e1rm history" ON e1rm_history
  FOR ALL USING (auth.uid() = user_id);

-- Readiness logs
ALTER TABLE readiness_logs ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own readiness" ON readiness_logs;
CREATE POLICY "Users can manage own readiness" ON readiness_logs
  FOR ALL USING (auth.uid() = user_id);

-- Workout feedback — via session ownership
ALTER TABLE workout_feedback ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can manage own feedback" ON workout_feedback;
CREATE POLICY "Users can manage own feedback" ON workout_feedback
  FOR ALL USING (
    EXISTS (SELECT 1 FROM workout_sessions WHERE workout_sessions.id = workout_feedback.workout_session_id AND workout_sessions.user_id = auth.uid())
  );

-- Exercises and muscle_groups are public read (system data)
ALTER TABLE exercises ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Exercises are readable by all" ON exercises;
CREATE POLICY "Exercises are readable by all" ON exercises
  FOR SELECT USING (true);

ALTER TABLE muscle_groups ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Muscle groups are readable by all" ON muscle_groups;
CREATE POLICY "Muscle groups are readable by all" ON muscle_groups
  FOR SELECT USING (true);

ALTER TABLE exercise_muscle_groups ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Exercise muscle groups are readable by all" ON exercise_muscle_groups;
CREATE POLICY "Exercise muscle groups are readable by all" ON exercise_muscle_groups
  FOR SELECT USING (true);
