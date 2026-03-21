-- ============================================
-- EXPANDED EXERCISE DATABASE
-- Part A: Update existing exercises with aliases and video_url
-- Part B: Insert 130+ new exercises
-- ============================================

-- ============================================
-- MUSCLE GROUP ID CONSTANTS (for reference)
-- ============================================
-- chest:       a1000000-0000-0000-0000-000000000001
-- back:        a1000000-0000-0000-0000-000000000002
-- front_delts: a1000000-0000-0000-0000-000000000003
-- side_delts:  a1000000-0000-0000-0000-000000000004
-- rear_delts:  a1000000-0000-0000-0000-000000000005
-- biceps:      a1000000-0000-0000-0000-000000000006
-- triceps:     a1000000-0000-0000-0000-000000000007
-- traps:       a1000000-0000-0000-0000-000000000008
-- quads:       a1000000-0000-0000-0000-000000000009
-- hamstrings:  a1000000-0000-0000-0000-00000000000a
-- glutes:      a1000000-0000-0000-0000-00000000000b
-- calves:      a1000000-0000-0000-0000-00000000000c
-- abs:         a1000000-0000-0000-0000-00000000000d
-- forearms:    a1000000-0000-0000-0000-00000000000e

-- ============================================
-- PART A: UPDATE EXISTING EXERCISES
-- Add aliases to commonly searched exercises
-- ============================================

UPDATE exercises SET aliases = ARRAY['Flat Bench', 'Flat Barbell Bench', 'BB Bench Press'] WHERE name = 'Barbell Bench Press' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Incline Bench', 'Incline BB Bench'] WHERE name = 'Incline Barbell Bench Press' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['DB Bench', 'Flat DB Press'] WHERE name = 'Dumbbell Bench Press' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Incline DB Press', 'Incline DB Bench'] WHERE name = 'Incline Dumbbell Bench Press' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Decline Bench'] WHERE name = 'Decline Barbell Bench Press' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Pec Fly', 'DB Fly', 'Chest Fly'] WHERE name = 'Dumbbell Fly' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Cable Crossover', 'Cable Chest Fly'] WHERE name = 'Cable Fly' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Chest Dips'] WHERE name = 'Dips' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Push Up', 'Pushup'] WHERE name = 'Push-Up' AND is_system = true;

UPDATE exercises SET aliases = ARRAY['Conventional Deadlift', 'BB Deadlift'] WHERE name = 'Barbell Deadlift' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['RDL', 'Stiff Leg Deadlift', 'SLDL'] WHERE name = 'Romanian Deadlift' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Sumo Pull'] WHERE name = 'Sumo Deadlift' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['BB Row', 'Bent Row', 'Bent-Over Row'] WHERE name = 'Barbell Row' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Pulldown', 'Lat Pull', 'Cable Pulldown'] WHERE name = 'Lat Pulldown' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Pull Up', 'Pullup', 'Chin Up'] WHERE name = 'Pull-Up' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['DB Row', 'One-Arm Row'] WHERE name = 'Dumbbell Row' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Seated Cable Row', 'Low Row'] WHERE name = 'Cable Row' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['T-Bar'] WHERE name = 'T-Bar Row' AND is_system = true;

UPDATE exercises SET aliases = ARRAY['BB Squat', 'Back Squat'] WHERE name = 'Barbell Squat' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Barbell Front Squat'] WHERE name = 'Front Squat' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Goblet Squat'] WHERE name = 'Dumbbell Goblet Squat' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Leg Extension Machine'] WHERE name = 'Leg Extension' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Leg Curl Machine', 'Hamstring Curl'] WHERE name = 'Leg Curl' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Hip Thrust', 'Glute Bridge'] WHERE name = 'Barbell Hip Thrust' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Walking Lunge', 'DB Lunge'] WHERE name = 'Dumbbell Lunge' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['RDL', 'DB RDL'] WHERE name = 'Dumbbell Romanian Deadlift' AND is_system = true;

UPDATE exercises SET aliases = ARRAY['OHP', 'Strict Press', 'Military Press', 'Standing Press'] WHERE name = 'Overhead Press' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['DB OHP', 'Seated DB Press'] WHERE name = 'Dumbbell Shoulder Press' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Lateral Raise', 'Side Raise', 'DB Lateral Raise'] WHERE name = 'Dumbbell Lateral Raise' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Rear Delt Fly', 'Reverse Pec Deck', 'Rear Fly'] WHERE name = 'Reverse Fly' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Face Pull', 'Rope Face Pull'] WHERE name = 'Cable Face Pull' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Front Raise', 'DB Front Raise'] WHERE name = 'Dumbbell Front Raise' AND is_system = true;

UPDATE exercises SET aliases = ARRAY['BB Curl', 'Standing Curl'] WHERE name = 'Barbell Curl' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['DB Curl'] WHERE name = 'Dumbbell Curl' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Hammer Curl', 'DB Hammer Curl'] WHERE name = 'Dumbbell Hammer Curl' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Preacher', 'Preacher Bench Curl'] WHERE name = 'Preacher Curl' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Cable Curl', 'Standing Cable Curl'] WHERE name = 'Cable Bicep Curl' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['EZ Curl', 'EZ-Bar Curl'] WHERE name = 'EZ Bar Curl' AND is_system = true;

UPDATE exercises SET aliases = ARRAY['Skull Crushers', 'Skullcrushers', 'Nose Breakers'] WHERE name = 'Lying Tricep Extension' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Rope Pushdown', 'Tri Pushdown'] WHERE name = 'Tricep Pushdown' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Overhead Tricep Extension', 'DB Overhead Extension'] WHERE name = 'Dumbbell Overhead Tricep Extension' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Close Grip Bench', 'CG Bench'] WHERE name = 'Close Grip Bench Press' AND is_system = true;

UPDATE exercises SET aliases = ARRAY['BB Shrug', 'Barbell Shrug'] WHERE name = 'Dumbbell Shrug' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Standing Calf Raise', 'Calf Raise Machine'] WHERE name = 'Calf Raise' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Seated Calf'] WHERE name = 'Seated Calf Raise' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Plank Hold'] WHERE name = 'Plank' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Hanging Leg Raise', 'Knee Raise'] WHERE name = 'Leg Raise' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Cable Crunch', 'Rope Crunch'] WHERE name = 'Cable Woodchop' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Farmer Walk', 'Loaded Carry'] WHERE name = 'Farmer''s Walk' AND is_system = true;
UPDATE exercises SET aliases = ARRAY['Wrist Curl'] WHERE name = 'Barbell Wrist Curl' AND is_system = true;

-- ============================================
-- PART B: INSERT NEW EXERCISES
-- 130+ new exercises with muscle group mappings
-- ============================================

DO $$
DECLARE
  -- Muscle group IDs
  mg_chest UUID := 'a1000000-0000-0000-0000-000000000001';
  mg_back UUID := 'a1000000-0000-0000-0000-000000000002';
  mg_front_delts UUID := 'a1000000-0000-0000-0000-000000000003';
  mg_side_delts UUID := 'a1000000-0000-0000-0000-000000000004';
  mg_rear_delts UUID := 'a1000000-0000-0000-0000-000000000005';
  mg_biceps UUID := 'a1000000-0000-0000-0000-000000000006';
  mg_triceps UUID := 'a1000000-0000-0000-0000-000000000007';
  mg_traps UUID := 'a1000000-0000-0000-0000-000000000008';
  mg_quads UUID := 'a1000000-0000-0000-0000-000000000009';
  mg_hamstrings UUID := 'a1000000-0000-0000-0000-00000000000a';
  mg_glutes UUID := 'a1000000-0000-0000-0000-00000000000b';
  mg_calves UUID := 'a1000000-0000-0000-0000-00000000000c';
  mg_abs UUID := 'a1000000-0000-0000-0000-00000000000d';
  mg_forearms UUID := 'a1000000-0000-0000-0000-00000000000e';

  eid UUID;
BEGIN

  -- ==========================================
  -- CHEST EXERCISES
  -- ==========================================

  -- Landmine Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Landmine Press', 'barbell', 'vertical_push', 'intermediate', true, true,
    'Set one end of a barbell in a landmine attachment or corner. Hold the other end at shoulder height. Press upward and slightly forward until arm is extended. Lower with control.',
    ARRAY['Angled Press', 'Landmine Chest Press'], 5, 3, 3, 4, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.80),
    (eid, mg_front_delts, 'secondary', 0.50),
    (eid, mg_triceps, 'secondary', 0.40);

  -- Single-Arm Landmine Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Single-Arm Landmine Press', 'barbell', 'vertical_push', 'intermediate', true, true,
    'Hold the end of a landmine barbell at shoulder height with one hand. Press up and forward until arm is extended. Lower under control.',
    ARRAY['One-Arm Landmine Press'], 5, 3, 3, 5, 7, 6, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.75),
    (eid, mg_front_delts, 'secondary', 0.50),
    (eid, mg_triceps, 'secondary', 0.35);

  -- Floor Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Barbell Floor Press', 'barbell', 'horizontal_push', 'intermediate', true, true,
    'Lie on the floor under a barbell in a rack. Unrack and lower bar until triceps touch the floor. Pause briefly, then press back up.',
    ARRAY['Floor Press', 'BB Floor Press'], 6, 3, 4, 4, 6, 8, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.75),
    (eid, mg_triceps, 'primary', 0.70),
    (eid, mg_front_delts, 'secondary', 0.40);

  -- Dumbbell Floor Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dumbbell Floor Press', 'dumbbell', 'horizontal_push', 'beginner', true, true,
    'Lie on the floor holding dumbbells. Lower until triceps touch the floor. Press back up.',
    ARRAY['DB Floor Press'], 4, 2, 2, 3, 6, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.70),
    (eid, mg_triceps, 'primary', 0.65),
    (eid, mg_front_delts, 'secondary', 0.35);

  -- Svend Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Svend Press', 'other', 'horizontal_push', 'beginner', false, true,
    'Hold two plates together at chest height squeezing them with palms. Press forward until arms are extended. Return to chest.',
    ARRAY['Plate Squeeze Press', 'Plate Press'], 3, 1, 1, 2, 5, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.65),
    (eid, mg_front_delts, 'secondary', 0.30);

  -- Hex Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Hex Press', 'dumbbell', 'horizontal_push', 'beginner', true, true,
    'Lie on a bench holding hex dumbbells together with a neutral grip. Press dumbbells up while keeping them pressed together throughout. Lower to chest.',
    ARRAY['Squeeze Press', 'Crush Press'], 4, 2, 2, 2, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.80),
    (eid, mg_triceps, 'secondary', 0.50);

  -- Cable Upper Chest Fly
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Low-to-High Cable Fly', 'cable', 'isolation', 'beginner', false, true,
    'Set cable pulleys to the lowest position. Stand between the cables, grab handles, and bring them upward and together in a hugging arc to upper chest height.',
    ARRAY['Cable Upper Chest Fly', 'Low Cable Fly', 'Incline Cable Fly'], 3, 2, 1, 3, 7, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.85),
    (eid, mg_front_delts, 'secondary', 0.30);

  -- Cable Lower Chest Fly
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'High-to-Low Cable Fly', 'cable', 'isolation', 'beginner', false, true,
    'Set cable pulleys to the highest position. Stand between cables, grab handles, and bring them downward and together in front of lower chest.',
    ARRAY['Cable Lower Chest Fly', 'High Cable Fly', 'Decline Cable Fly'], 3, 2, 1, 3, 7, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.85),
    (eid, mg_front_delts, 'secondary', 0.25);

  -- Decline Dumbbell Bench Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Decline Dumbbell Bench Press', 'dumbbell', 'horizontal_push', 'intermediate', true, true,
    'Lie on a decline bench holding dumbbells. Press them up until arms are extended. Lower to the sides of your lower chest.',
    ARRAY['Decline DB Press', 'Decline DB Bench'], 5, 3, 3, 4, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.85),
    (eid, mg_triceps, 'secondary', 0.45),
    (eid, mg_front_delts, 'secondary', 0.30);

  -- Machine Chest Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Machine Chest Press', 'machine', 'horizontal_push', 'beginner', true, true,
    'Sit in a chest press machine with back flat against pad. Grip handles at chest height. Press forward until arms are extended. Return with control.',
    ARRAY['Chest Press Machine', 'Seated Chest Press'], 4, 2, 1, 1, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.80),
    (eid, mg_triceps, 'secondary', 0.45),
    (eid, mg_front_delts, 'secondary', 0.35);

  -- Pec Deck Machine
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Pec Deck', 'machine', 'isolation', 'beginner', false, true,
    'Sit in the pec deck machine with your back flat against the pad. Place forearms against the pads. Bring arms together in front of chest. Return slowly.',
    ARRAY['Pec Deck Machine', 'Machine Fly', 'Butterfly Machine'], 3, 2, 1, 1, 7, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.85);

  -- ==========================================
  -- BACK EXERCISES
  -- ==========================================

  -- Meadows Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Meadows Row', 'barbell', 'horizontal_pull', 'intermediate', true, true,
    'Set one end of a barbell in a landmine. Stand perpendicular, staggered stance. Grip the end with an overhand grip and row it toward your hip. Lower under control.',
    ARRAY['Landmine Meadows Row', 'John Meadows Row'], 6, 3, 4, 5, 8, 7, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.90),
    (eid, mg_rear_delts, 'secondary', 0.40),
    (eid, mg_biceps, 'secondary', 0.35);

  -- Pendlay Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Pendlay Row', 'barbell', 'horizontal_pull', 'intermediate', true, true,
    'Stand over a barbell with feet shoulder-width. Hinge at hips until torso is parallel to floor. Row bar explosively to lower chest, then lower back to floor. Reset each rep.',
    ARRAY['Dead-Stop Row', 'Strict Barbell Row'], 7, 4, 6, 6, 7, 9, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.90),
    (eid, mg_rear_delts, 'secondary', 0.40),
    (eid, mg_biceps, 'secondary', 0.35),
    (eid, mg_hamstrings, 'secondary', 0.25);

  -- Chest-Supported Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Chest-Supported Dumbbell Row', 'dumbbell', 'horizontal_pull', 'beginner', true, true,
    'Set an incline bench at 30-45 degrees. Lie face down on the bench with dumbbells hanging. Row both dumbbells toward hips squeezing shoulder blades together.',
    ARRAY['Chest Supported Row', 'Incline DB Row', 'Seal Row'], 4, 2, 1, 2, 8, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.90),
    (eid, mg_rear_delts, 'secondary', 0.45),
    (eid, mg_biceps, 'secondary', 0.40);

  -- Kroc Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Kroc Row', 'dumbbell', 'horizontal_pull', 'advanced', true, true,
    'Similar to a dumbbell row but done with a heavy dumbbell for high reps (15-25). Use some controlled body English to complete the set. Focus on a full stretch at the bottom.',
    ARRAY['Heavy Dumbbell Row', 'Matt Kroc Row'], 8, 4, 5, 5, 8, 8, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.90),
    (eid, mg_biceps, 'secondary', 0.45),
    (eid, mg_forearms, 'secondary', 0.50),
    (eid, mg_rear_delts, 'secondary', 0.35);

  -- Straight-Arm Pulldown
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Straight-Arm Pulldown', 'cable', 'isolation', 'beginner', false, true,
    'Stand facing a high cable with a straight bar attachment. Keep arms straight and pull the bar down in an arc to your thighs. Return with control.',
    ARRAY['Straight Arm Lat Pulldown', 'Lat Pushdown', 'Stiff Arm Pulldown'], 3, 2, 2, 3, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.85),
    (eid, mg_abs, 'secondary', 0.20);

  -- Behind-the-Neck Pulldown
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Behind-the-Neck Lat Pulldown', 'cable', 'vertical_pull', 'advanced', true, true,
    'Sit at a lat pulldown station. Pull the bar down behind your neck to upper trap level. Requires good shoulder mobility. Return with control.',
    ARRAY['Behind Neck Pulldown', 'BTN Pulldown'], 5, 6, 2, 6, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.85),
    (eid, mg_biceps, 'secondary', 0.40),
    (eid, mg_rear_delts, 'secondary', 0.35);

  -- Inverted Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Inverted Row', 'bodyweight', 'horizontal_pull', 'beginner', true, true,
    'Set a barbell in a rack at waist height. Hang underneath with arms extended, body straight. Pull chest to the bar. Lower under control.',
    ARRAY['Body Row', 'Australian Pull-Up', 'Ring Row'], 3, 2, 1, 2, 6, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.75),
    (eid, mg_biceps, 'secondary', 0.40),
    (eid, mg_rear_delts, 'secondary', 0.35),
    (eid, mg_abs, 'secondary', 0.20);

  -- Yates Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Yates Row', 'barbell', 'horizontal_pull', 'intermediate', true, true,
    'Stand with torso at about 70 degrees to the floor (more upright than a standard bent-over row). Use an underhand grip and row the bar to your lower abdomen.',
    ARRAY['Underhand Barbell Row', 'Reverse Grip Row', 'Dorian Row'], 6, 4, 5, 4, 7, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.85),
    (eid, mg_biceps, 'secondary', 0.55),
    (eid, mg_rear_delts, 'secondary', 0.30);

  -- Snatch-Grip Deadlift
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Snatch-Grip Deadlift', 'barbell', 'hip_hinge', 'advanced', true, true,
    'Perform a deadlift with a very wide (snatch-width) grip. This increases range of motion and upper back demand. Maintain neutral spine throughout.',
    ARRAY['Wide Grip Deadlift', 'Snatch DL'], 9, 5, 8, 7, 7, 9, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.85),
    (eid, mg_hamstrings, 'primary', 0.80),
    (eid, mg_glutes, 'primary', 0.75),
    (eid, mg_traps, 'secondary', 0.60),
    (eid, mg_quads, 'secondary', 0.40);

  -- Single-Arm Cable Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Single-Arm Cable Row', 'cable', 'horizontal_pull', 'beginner', true, true,
    'Sit at a cable row station or stand. Use a single handle and row with one arm, rotating torso slightly. Squeeze shoulder blade back. Return with control.',
    ARRAY['One-Arm Cable Row', 'Unilateral Cable Row'], 4, 2, 2, 3, 7, 5, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.80),
    (eid, mg_biceps, 'secondary', 0.40),
    (eid, mg_rear_delts, 'secondary', 0.30);

  -- Machine Row (Plate-Loaded)
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Machine Row', 'machine', 'horizontal_pull', 'beginner', true, true,
    'Sit in a plate-loaded or selectorized row machine. Pull handles toward torso, squeezing shoulder blades. Return under control.',
    ARRAY['Seated Machine Row', 'Hammer Strength Row'], 4, 2, 1, 1, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.85),
    (eid, mg_biceps, 'secondary', 0.40),
    (eid, mg_rear_delts, 'secondary', 0.30);

  -- Chin-Up
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Chin-Up', 'bodyweight', 'vertical_pull', 'intermediate', true, true,
    'Hang from a bar with a supinated (underhand) grip, hands shoulder-width apart. Pull your chin above the bar by driving elbows down. Lower under control.',
    ARRAY['Chinup', 'Chin Up', 'Supinated Pull-Up'], 6, 4, 2, 4, 8, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.85),
    (eid, mg_biceps, 'primary', 0.70),
    (eid, mg_abs, 'secondary', 0.25);

  -- Close-Grip Lat Pulldown
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Close-Grip Lat Pulldown', 'cable', 'vertical_pull', 'beginner', true, true,
    'Use a V-bar or close-grip handle on a lat pulldown station. Pull down to upper chest with elbows close to body. Return under control.',
    ARRAY['V-Bar Pulldown', 'Narrow Grip Pulldown'], 4, 2, 1, 2, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.85),
    (eid, mg_biceps, 'secondary', 0.50);

  -- ==========================================
  -- SHOULDER EXERCISES
  -- ==========================================

  -- Arnold Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Arnold Press', 'dumbbell', 'vertical_push', 'intermediate', true, true,
    'Start with dumbbells at shoulder height, palms facing you. As you press up, rotate your wrists so palms face forward at the top. Reverse on the way down.',
    ARRAY['Arnold Dumbbell Press', 'Rotating Shoulder Press'], 6, 4, 3, 5, 8, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_front_delts, 'primary', 0.85),
    (eid, mg_side_delts, 'primary', 0.65),
    (eid, mg_triceps, 'secondary', 0.40);

  -- Z-Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Z-Press', 'barbell', 'vertical_push', 'advanced', true, true,
    'Sit on the floor with legs extended in front. Unrack a barbell from a low rack position and press it overhead. No back support forces core engagement.',
    ARRAY['Seated Floor Press', 'Zydrunas Press'], 7, 4, 3, 7, 7, 8, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_front_delts, 'primary', 0.85),
    (eid, mg_side_delts, 'secondary', 0.40),
    (eid, mg_triceps, 'secondary', 0.45),
    (eid, mg_abs, 'secondary', 0.50);

  -- Scott Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Scott Press', 'dumbbell', 'vertical_push', 'intermediate', true, true,
    'Similar to an Arnold press but focus on keeping elbows in front of body. Start with palms facing you and rotate as you press. Emphasizes front and side delts.',
    ARRAY['Modified Arnold Press'], 5, 3, 2, 5, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_front_delts, 'primary', 0.80),
    (eid, mg_side_delts, 'primary', 0.70),
    (eid, mg_triceps, 'secondary', 0.35);

  -- Lu Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Lu Raise', 'dumbbell', 'isolation', 'intermediate', false, true,
    'Start with arms in front raise position. At the top of the front raise, transition into a lateral raise position by moving arms out to sides, then lower. Combines front and lateral raise.',
    ARRAY['Lu Xiaojun Raise', 'Front-to-Lateral Raise'], 5, 3, 1, 5, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_front_delts, 'primary', 0.70),
    (eid, mg_side_delts, 'primary', 0.75);

  -- Bus Driver Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Bus Driver Raise', 'other', 'isolation', 'intermediate', false, true,
    'Hold a weight plate with both hands at arms length in front of you. Raise to shoulder height, then rotate the plate like a steering wheel left and right before lowering.',
    ARRAY['Plate Steering Wheel', 'Steering Wheel Raise'], 4, 3, 1, 4, 6, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_front_delts, 'primary', 0.75),
    (eid, mg_side_delts, 'secondary', 0.40);

  -- Barbell Upright Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Barbell Upright Row', 'barbell', 'vertical_pull', 'intermediate', true, true,
    'Hold a barbell with a shoulder-width or slightly wider grip. Pull the bar straight up along your body to chin height, leading with elbows. Lower under control.',
    ARRAY['Upright Row', 'BB Upright Row'], 5, 5, 2, 4, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_side_delts, 'primary', 0.75),
    (eid, mg_traps, 'primary', 0.65),
    (eid, mg_front_delts, 'secondary', 0.40),
    (eid, mg_biceps, 'secondary', 0.25);

  -- Cable Lateral Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cable Lateral Raise', 'cable', 'isolation', 'beginner', false, true,
    'Stand next to a low cable pulley. Grab the handle with the far hand. Raise arm out to the side to shoulder height. Lower under control.',
    ARRAY['Cable Side Raise', 'Single-Arm Cable Lateral'], 3, 2, 1, 2, 8, 3, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_side_delts, 'primary', 0.90);

  -- Bradford Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Bradford Press', 'barbell', 'vertical_push', 'advanced', true, true,
    'Press a barbell from the front of your shoulders to just above your head, then lower behind your neck. Press back over and lower to front. Each front-to-back counts as one rep.',
    ARRAY['Bradford Rocky Press'], 6, 5, 3, 6, 6, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_front_delts, 'primary', 0.75),
    (eid, mg_side_delts, 'primary', 0.65),
    (eid, mg_triceps, 'secondary', 0.35);

  -- Cable Y-Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cable Y-Raise', 'cable', 'isolation', 'beginner', false, true,
    'Stand facing a dual cable machine with low pulleys. Cross the cables and raise arms up and out to form a Y shape. Lower under control.',
    ARRAY['Y-Raise', 'Cable Y Raise'], 3, 2, 1, 3, 6, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_side_delts, 'primary', 0.65),
    (eid, mg_rear_delts, 'secondary', 0.45),
    (eid, mg_traps, 'secondary', 0.40);

  -- Machine Lateral Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Machine Lateral Raise', 'machine', 'isolation', 'beginner', false, true,
    'Sit in a lateral raise machine. Place outer forearms or elbows against the pads. Raise arms out to the sides to shoulder height. Lower under control.',
    ARRAY['Lateral Raise Machine', 'Machine Side Raise'], 3, 2, 1, 1, 7, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_side_delts, 'primary', 0.90);

  -- Reverse Pec Deck
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Reverse Pec Deck', 'machine', 'isolation', 'beginner', false, true,
    'Sit facing the pec deck machine. Grip handles with arms extended in front. Open arms outward, squeezing rear delts. Return under control.',
    ARRAY['Machine Reverse Fly', 'Rear Delt Machine'], 3, 2, 1, 1, 7, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_rear_delts, 'primary', 0.90),
    (eid, mg_traps, 'secondary', 0.25);

  -- Machine Shoulder Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Machine Shoulder Press', 'machine', 'vertical_push', 'beginner', true, true,
    'Sit in a shoulder press machine with back against pad. Grip handles at shoulder height. Press up until arms are extended. Lower under control.',
    ARRAY['Shoulder Press Machine', 'Seated Machine OHP'], 4, 3, 2, 1, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_front_delts, 'primary', 0.80),
    (eid, mg_side_delts, 'secondary', 0.40),
    (eid, mg_triceps, 'secondary', 0.45);

  -- ==========================================
  -- BICEPS EXERCISES
  -- ==========================================

  -- Bayesian Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Bayesian Curl', 'cable', 'isolation', 'intermediate', false, true,
    'Stand facing away from a low cable pulley. Hold the handle behind you with arm extended back. Curl the handle forward and up by flexing the elbow. This provides peak tension at full contraction.',
    ARRAY['Cable Bayesian Curl', 'Behind-Body Cable Curl'], 3, 2, 1, 4, 9, 4, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.95);

  -- Spider Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Spider Curl', 'dumbbell', 'isolation', 'beginner', false, true,
    'Lie face down on an incline bench set at about 45 degrees. Let arms hang straight down with dumbbells. Curl the dumbbells up, focusing on the peak contraction at the top.',
    ARRAY['Prone Incline Curl', 'Incline Spider Curl'], 3, 2, 1, 2, 8, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.90);

  -- Drag Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Drag Curl', 'barbell', 'isolation', 'intermediate', false, true,
    'Hold a barbell with shoulder-width grip. Instead of curling normally, drag the bar up your torso by pulling elbows back. The bar stays close to your body throughout.',
    ARRAY['Body Drag Curl', 'Barbell Drag Curl'], 3, 2, 1, 4, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.80),
    (eid, mg_front_delts, 'secondary', 0.20);

  -- Zottman Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Zottman Curl', 'dumbbell', 'isolation', 'intermediate', false, true,
    'Curl dumbbells up with a supinated (palms-up) grip. At the top, rotate wrists to a pronated (palms-down) grip and lower slowly. Rotate back to supinated at the bottom.',
    ARRAY['Zottman Dumbbell Curl'], 4, 3, 1, 4, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.80),
    (eid, mg_forearms, 'primary', 0.65);

  -- Waiter Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Waiter Curl', 'dumbbell', 'isolation', 'beginner', false, true,
    'Hold one end of a dumbbell vertically with both hands cupped underneath, as if carrying a tray. Curl up keeping the dumbbell vertical. Focus on bicep squeeze at the top.',
    ARRAY['Plate Curl', 'Goblet Curl'], 3, 2, 1, 2, 7, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.80);

  -- Cross-Body Hammer Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cross-Body Hammer Curl', 'dumbbell', 'isolation', 'beginner', false, true,
    'Hold a dumbbell in one hand with neutral grip. Curl across your body toward the opposite shoulder. Lower and repeat. Alternating arms.',
    ARRAY['Cross Body Curl', 'Pinwheel Curl'], 3, 2, 1, 2, 7, 4, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.75),
    (eid, mg_forearms, 'secondary', 0.45);

  -- 21s Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, '21s Curl', 'barbell', 'isolation', 'intermediate', false, true,
    'Perform 7 reps of bottom-half curls, 7 reps of top-half curls, then 7 full-range curls without rest. Can be done with barbell, EZ bar, or dumbbells.',
    ARRAY['21s', 'Twenty-Ones'], 5, 3, 1, 3, 8, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.90);

  -- Incline Dumbbell Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Incline Dumbbell Curl', 'dumbbell', 'isolation', 'beginner', false, true,
    'Sit on an incline bench set at 45-60 degrees. Let arms hang straight down with dumbbells. Curl up while keeping upper arms stationary. Provides a deep stretch on the bicep.',
    ARRAY['Incline Curl', 'Incline DB Curl', 'Stretch Curl'], 3, 2, 1, 2, 8, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.90);

  -- Concentration Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Concentration Curl', 'dumbbell', 'isolation', 'beginner', false, true,
    'Sit on a bench, lean forward, brace elbow against inner thigh. Curl the dumbbell up, squeezing bicep at the top. Lower slowly.',
    ARRAY['Seated Concentration Curl'], 2, 1, 1, 2, 7, 3, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.85);

  -- ==========================================
  -- TRICEPS EXERCISES
  -- ==========================================

  -- JM Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'JM Press', 'barbell', 'horizontal_push', 'advanced', true, true,
    'A hybrid between a close-grip bench press and a skull crusher. Lower the bar toward your chin/neck area by bending elbows, then press back up. Named after JM Blakley.',
    ARRAY['JM Blakley Press'], 6, 5, 3, 7, 7, 8, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.90),
    (eid, mg_chest, 'secondary', 0.40);

  -- Tate Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Tate Press', 'dumbbell', 'isolation', 'intermediate', false, true,
    'Lie on a bench with dumbbells held at arms length. Lower the dumbbells inward toward your chest by bending elbows out to the sides. Press back up by extending elbows.',
    ARRAY['Elbows-Out Extension', 'Dave Tate Press'], 4, 4, 2, 5, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.85);

  -- French Press (Standing Barbell Overhead Tricep Extension)
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'French Press', 'barbell', 'isolation', 'intermediate', false, true,
    'Stand or sit holding an EZ bar or barbell overhead. Lower the bar behind your head by bending elbows. Keep upper arms vertical. Extend back to start.',
    ARRAY['Standing Overhead Tricep Extension', 'Barbell Overhead Extension'], 5, 4, 3, 5, 8, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.90);

  -- Overhead Cable Tricep Extension
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Overhead Cable Tricep Extension', 'cable', 'isolation', 'beginner', false, true,
    'Face away from a high cable with rope attachment. Hold rope overhead. Extend arms forward and up by straightening elbows. Return with control.',
    ARRAY['Cable Overhead Extension', 'Rope Overhead Extension'], 3, 2, 2, 3, 8, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.90);

  -- Tricep Kickback
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dumbbell Tricep Kickback', 'dumbbell', 'isolation', 'beginner', false, true,
    'Hinge forward with one arm braced on a bench. Hold a dumbbell with upper arm parallel to floor. Extend elbow to straighten arm behind you. Squeeze tricep at the top.',
    ARRAY['Tricep Kickback', 'Kickback', 'DB Kickback'], 2, 2, 2, 2, 6, 3, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.75);

  -- Diamond Push-Up
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Diamond Push-Up', 'bodyweight', 'horizontal_push', 'intermediate', true, true,
    'Assume a push-up position with hands close together forming a diamond shape with thumbs and index fingers. Lower chest to hands, then push back up.',
    ARRAY['Close-Grip Push-Up', 'Triangle Push-Up'], 4, 4, 2, 3, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.80),
    (eid, mg_chest, 'secondary', 0.50),
    (eid, mg_front_delts, 'secondary', 0.30);

  -- Cable Tricep Kickback
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cable Tricep Kickback', 'cable', 'isolation', 'beginner', false, true,
    'Stand beside a low cable pulley. Hinge forward. Hold the handle and extend your arm back, squeezing the tricep at full extension. Return under control.',
    ARRAY['Cable Kickback'], 2, 2, 1, 2, 7, 3, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.80);

  -- Single-Arm Cable Pushdown
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Single-Arm Cable Pushdown', 'cable', 'isolation', 'beginner', false, true,
    'Stand at a high cable with a single handle. Keep elbow at side and push handle down by extending arm. Squeeze tricep at the bottom. Return under control.',
    ARRAY['One-Arm Pushdown', 'Unilateral Tricep Pushdown'], 2, 2, 1, 2, 7, 3, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.85);

  -- ==========================================
  -- QUAD EXERCISES
  -- ==========================================

  -- Sissy Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Sissy Squat', 'bodyweight', 'squat', 'advanced', false, true,
    'Stand holding a support for balance. Rise onto toes, lean torso back and bend knees, lowering hips forward and down. Knees travel far forward. Return to standing.',
    ARRAY['Body Sissy Squat'], 5, 7, 2, 6, 8, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.95);

  -- Cyclist Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cyclist Squat', 'barbell', 'squat', 'intermediate', true, true,
    'Place heels on small plates or a wedge. Use a narrow stance and squat with an upright torso, keeping knees tracking forward over toes.',
    ARRAY['Heel-Elevated Squat', 'Quad Squat', 'Heel-Raised Squat'], 6, 5, 5, 4, 8, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.95),
    (eid, mg_glutes, 'secondary', 0.35);

  -- Spanish Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Spanish Squat', 'bands', 'squat', 'intermediate', true, true,
    'Loop a resistance band around a sturdy post and behind your knees. Lean back into the band tension and squat, keeping shins vertical. The band reduces knee joint stress.',
    ARRAY['Band-Assisted Squat'], 4, 2, 2, 4, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.85),
    (eid, mg_glutes, 'secondary', 0.30);

  -- Belt Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Belt Squat', 'machine', 'squat', 'intermediate', true, true,
    'Attach a belt around your hips connected to a weight. Stand on elevated platforms and squat. No spinal compression since the load hangs from hips.',
    ARRAY['Hip Belt Squat', 'Belt Squat Machine'], 5, 3, 1, 3, 8, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.90),
    (eid, mg_glutes, 'secondary', 0.50),
    (eid, mg_hamstrings, 'secondary', 0.20);

  -- Leg Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Leg Press', 'machine', 'squat', 'beginner', true, true,
    'Sit in the leg press machine. Place feet shoulder-width on the platform. Lower the platform by bending knees to 90 degrees. Press back to start without locking knees.',
    ARRAY['Machine Leg Press', '45-Degree Leg Press', 'Sled Leg Press'], 6, 4, 3, 2, 8, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.85),
    (eid, mg_glutes, 'secondary', 0.45),
    (eid, mg_hamstrings, 'secondary', 0.20);

  -- Single-Leg Leg Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Single-Leg Leg Press', 'machine', 'squat', 'intermediate', true, true,
    'Use the leg press machine with only one foot on the platform. Lower and press back up. Helps address strength imbalances between legs.',
    ARRAY['Unilateral Leg Press', 'One-Leg Leg Press'], 5, 4, 2, 3, 7, 6, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.80),
    (eid, mg_glutes, 'secondary', 0.45);

  -- Wall Sit
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Wall Sit', 'bodyweight', 'squat', 'beginner', false, true,
    'Lean back against a wall and slide down until thighs are parallel to the floor. Hold this position for time. Keep back flat against the wall.',
    ARRAY['Wall Squat', 'Wall Hold'], 4, 3, 1, 1, 4, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.70);

  -- Barbell Step-Up
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Barbell Step-Up', 'barbell', 'lunge', 'intermediate', true, true,
    'With a barbell on your back, step onto a box or bench with one foot. Drive through that foot to stand on the box. Step back down with control.',
    ARRAY['Weighted Step-Up', 'BB Step-Up'], 6, 4, 5, 5, 7, 6, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.80),
    (eid, mg_glutes, 'primary', 0.65);

  -- Dumbbell Step-Up
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dumbbell Step-Up', 'dumbbell', 'lunge', 'beginner', true, true,
    'Hold dumbbells at sides. Step onto a box or bench with one foot, driving through to stand. Step back down. Alternate legs or complete all reps on one side.',
    ARRAY['DB Step-Up', 'Step Up'], 5, 3, 2, 3, 7, 5, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.75),
    (eid, mg_glutes, 'primary', 0.65);

  -- Hack Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Hack Squat', 'machine', 'squat', 'beginner', true, true,
    'Stand in a hack squat machine with back against the pad and shoulders under pads. Lower by bending knees until thighs are parallel. Press back up.',
    ARRAY['Machine Hack Squat', 'Reverse Hack Squat'], 6, 5, 2, 2, 8, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.90),
    (eid, mg_glutes, 'secondary', 0.40);

  -- Pendulum Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Pendulum Squat', 'machine', 'squat', 'intermediate', true, true,
    'Stand in the pendulum squat machine. The arc of motion shifts load emphasis. Squat down and drive back up, keeping constant tension on quads.',
    ARRAY['Pendulum Squat Machine'], 5, 3, 1, 2, 9, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.95),
    (eid, mg_glutes, 'secondary', 0.30);

  -- Bulgarian Split Squat (Barbell)
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Barbell Bulgarian Split Squat', 'barbell', 'lunge', 'advanced', true, true,
    'Place barbell on back. Elevate rear foot on a bench behind you. Lower into a deep lunge by bending the front knee. Drive back up through the front foot.',
    ARRAY['BB Bulgarian Split Squat', 'Barbell Rear Foot Elevated Split Squat'], 8, 5, 6, 7, 8, 8, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.90),
    (eid, mg_glutes, 'primary', 0.70),
    (eid, mg_hamstrings, 'secondary', 0.25);

  -- ==========================================
  -- HAMSTRING EXERCISES
  -- ==========================================

  -- Nordic Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Nordic Curl', 'bodyweight', 'isolation', 'advanced', false, true,
    'Kneel on a pad with feet anchored. Slowly lower your body toward the ground by extending at the knees while keeping hips straight. Use hamstrings to control the descent. Push off floor to help return up.',
    ARRAY['Nordic Hamstring Curl', 'NHC', 'Glute-Ham Nordic'], 7, 5, 2, 7, 9, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_hamstrings, 'primary', 0.95);

  -- Sliding Leg Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Sliding Leg Curl', 'bodyweight', 'isolation', 'intermediate', false, true,
    'Lie on your back with heels on sliders or a towel on a smooth floor. Bridge hips up and curl heels toward glutes. Extend back out with control.',
    ARRAY['Slider Hamstring Curl', 'Towel Leg Curl', 'Swiss Ball Leg Curl'], 4, 2, 1, 3, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_hamstrings, 'primary', 0.80),
    (eid, mg_glutes, 'secondary', 0.40);

  -- Glute-Ham Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Glute-Ham Raise', 'machine', 'isolation', 'advanced', false, true,
    'Set up in a GHD machine. Begin with torso parallel to the floor. Extend at the hips and flex at the knees simultaneously to raise torso to upright position.',
    ARRAY['GHR', 'GHD Raise', 'Glute Ham Developer'], 6, 3, 3, 6, 9, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_hamstrings, 'primary', 0.90),
    (eid, mg_glutes, 'primary', 0.60);

  -- Single-Leg Romanian Deadlift
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Single-Leg Romanian Deadlift', 'dumbbell', 'hip_hinge', 'intermediate', true, true,
    'Stand on one leg holding a dumbbell. Hinge at the hip, lowering the dumbbell while extending the free leg behind you. Return to standing.',
    ARRAY['Single-Leg RDL', 'SLRDL', 'One-Leg RDL'], 5, 3, 3, 6, 7, 6, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_hamstrings, 'primary', 0.85),
    (eid, mg_glutes, 'primary', 0.70);

  -- 45-Degree Back Extension
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, '45-Degree Back Extension', 'bodyweight', 'hip_hinge', 'beginner', true, true,
    'Set up in a 45-degree hyperextension bench. Cross arms over chest or hold a plate. Lower torso by hinging at hips. Raise back up by extending hips, squeezing glutes and hamstrings.',
    ARRAY['Hyperextension', '45 Degree Hyper', 'Back Extension', 'Roman Chair Extension'], 4, 2, 4, 2, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_hamstrings, 'primary', 0.70),
    (eid, mg_glutes, 'primary', 0.70),
    (eid, mg_back, 'secondary', 0.30);

  -- Seated Leg Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Seated Leg Curl', 'machine', 'isolation', 'beginner', false, true,
    'Sit in a seated leg curl machine with pad on top of lower shins. Curl heels toward glutes by flexing knees. Return under control.',
    ARRAY['Seated Hamstring Curl', 'Machine Seated Curl'], 3, 2, 1, 1, 8, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_hamstrings, 'primary', 0.90);

  -- Lying Leg Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Lying Leg Curl', 'machine', 'isolation', 'beginner', false, true,
    'Lie face down on a lying leg curl machine. Hook heels under the pad. Curl pad toward glutes. Lower under control.',
    ARRAY['Prone Leg Curl', 'Lying Hamstring Curl'], 3, 2, 1, 1, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_hamstrings, 'primary', 0.85);

  -- ==========================================
  -- GLUTE EXERCISES
  -- ==========================================

  -- Frog Pump
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Frog Pump', 'bodyweight', 'hip_hinge', 'beginner', false, true,
    'Lie on your back with soles of feet together and knees out to the sides (frog position). Drive hips up by squeezing glutes. Lower with control.',
    ARRAY['Frog Glute Bridge', 'Butterfly Bridge'], 2, 1, 1, 1, 6, 2, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.80);

  -- B-Stance Hip Thrust
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'B-Stance Hip Thrust', 'barbell', 'hip_hinge', 'intermediate', true, true,
    'Set up for a hip thrust but stagger your feet so one is further forward (working leg) and the other is closer with just the heel down for balance. Thrust using primarily the working leg.',
    ARRAY['Staggered Stance Hip Thrust', 'Kickstand Hip Thrust'], 6, 3, 3, 4, 8, 6, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.90),
    (eid, mg_hamstrings, 'secondary', 0.40);

  -- Single-Leg Hip Thrust
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Single-Leg Hip Thrust', 'bodyweight', 'hip_hinge', 'intermediate', false, true,
    'Set up for a hip thrust with back on a bench. Extend one leg out. Drive hips up using only the working leg. Lower with control.',
    ARRAY['One-Leg Hip Thrust', 'Unilateral Hip Thrust'], 5, 2, 2, 4, 8, 5, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.90),
    (eid, mg_hamstrings, 'secondary', 0.35);

  -- Sumo Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dumbbell Sumo Squat', 'dumbbell', 'squat', 'beginner', true, true,
    'Stand with a wide stance, toes pointed outward. Hold a dumbbell or kettlebell with both hands between legs. Squat down until thighs are parallel. Drive back up.',
    ARRAY['Sumo Squat', 'Wide-Stance Squat', 'Plie Squat'], 5, 3, 2, 2, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.75),
    (eid, mg_quads, 'primary', 0.65),
    (eid, mg_hamstrings, 'secondary', 0.30);

  -- Curtsy Lunge
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Curtsy Lunge', 'dumbbell', 'lunge', 'intermediate', true, true,
    'Stand holding dumbbells. Step one leg behind and across the other leg, as if doing a curtsy. Lower into a lunge. Return to standing. Alternate legs.',
    ARRAY['Crossover Lunge', 'Cross-Behind Lunge'], 5, 4, 2, 5, 7, 5, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.80),
    (eid, mg_quads, 'secondary', 0.55);

  -- Fire Hydrant
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Fire Hydrant', 'bodyweight', 'isolation', 'beginner', false, true,
    'Start on all fours. Keeping knee bent at 90 degrees, lift one leg out to the side. Squeeze glute at the top. Lower with control.',
    ARRAY['Dirty Dog', 'Hip Abduction on All Fours'], 2, 1, 1, 1, 5, 2, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.65);

  -- Clamshell
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Clamshell', 'bands', 'isolation', 'beginner', false, true,
    'Lie on your side with knees bent and a band around knees. Keeping feet together, open top knee like a clamshell. Squeeze glute at the top. Lower with control.',
    ARRAY['Banded Clamshell', 'Side-Lying Clamshell'], 1, 1, 1, 1, 4, 1, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.55);

  -- Cable Pull-Through
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cable Pull-Through', 'cable', 'hip_hinge', 'beginner', true, true,
    'Stand facing away from a low cable with rope attachment between legs. Hinge at hips, letting the rope pull between legs. Drive hips forward to stand tall, squeezing glutes.',
    ARRAY['Pull Through', 'Cable Hip Hinge'], 3, 2, 2, 3, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.80),
    (eid, mg_hamstrings, 'secondary', 0.50);

  -- Hip Abduction Machine
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Hip Abduction Machine', 'machine', 'isolation', 'beginner', false, true,
    'Sit in the hip abduction machine with pads against outer thighs. Push legs apart against the resistance. Return with control.',
    ARRAY['Abductor Machine', 'Outer Thigh Machine', 'Seated Hip Abduction'], 2, 2, 1, 1, 6, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.75);

  -- Hip Adduction Machine
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Hip Adduction Machine', 'machine', 'isolation', 'beginner', false, true,
    'Sit in the hip adduction machine with pads against inner thighs. Squeeze legs together against the resistance. Return with control.',
    ARRAY['Adductor Machine', 'Inner Thigh Machine', 'Seated Hip Adduction'], 2, 2, 1, 1, 5, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'secondary', 0.30),
    (eid, mg_glutes, 'secondary', 0.40);

  -- Glute Kickback (Cable)
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cable Glute Kickback', 'cable', 'isolation', 'beginner', false, true,
    'Attach an ankle strap to a low cable. Face the machine and kick one leg straight back, squeezing glute at the top. Return under control.',
    ARRAY['Glute Kickback', 'Cable Donkey Kick'], 2, 2, 1, 2, 6, 3, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.75),
    (eid, mg_hamstrings, 'secondary', 0.30);

  -- ==========================================
  -- CALF EXERCISES
  -- ==========================================

  -- Donkey Calf Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Donkey Calf Raise', 'machine', 'isolation', 'intermediate', false, true,
    'Bend at the hips on a donkey calf raise machine or with a partner on your back. Place balls of feet on a platform edge. Perform calf raises with a full range of motion.',
    ARRAY['Donkey Calf', 'Bent-Over Calf Raise'], 4, 3, 3, 3, 8, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_calves, 'primary', 0.90);

  -- Single-Leg Calf Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Single-Leg Calf Raise', 'bodyweight', 'isolation', 'beginner', false, true,
    'Stand on one foot on the edge of a step. Lower heel below the step for a stretch. Rise up onto toes as high as possible. Hold a dumbbell for added resistance.',
    ARRAY['One-Leg Calf Raise', 'Unilateral Calf Raise'], 3, 3, 1, 2, 7, 4, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_calves, 'primary', 0.85);

  -- Tibialis Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Tibialis Raise', 'bodyweight', 'isolation', 'beginner', false, true,
    'Lean back against a wall with feet about two feet away. Lift toes off the ground toward shins (dorsiflexion). Lower under control. Can add weight on top of feet.',
    ARRAY['Tib Raise', 'Tibialis Anterior Raise', 'Toe Raise'], 2, 2, 1, 2, 5, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_calves, 'primary', 0.60);

  -- Leg Press Calf Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Leg Press Calf Raise', 'machine', 'isolation', 'beginner', false, true,
    'Sit in a leg press machine with just the balls of your feet on the lower edge of the platform. Perform calf raises by pushing through the balls of your feet.',
    ARRAY['Calf Press', 'Leg Press Calf Press'], 3, 3, 1, 2, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_calves, 'primary', 0.85);

  -- ==========================================
  -- CORE / ABS EXERCISES
  -- ==========================================

  -- Ab Wheel Rollout
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Ab Wheel Rollout', 'other', 'isolation', 'intermediate', false, true,
    'Kneel on the floor gripping an ab wheel. Roll the wheel forward, extending your body toward the floor. Use abs to pull back to starting position. Keep core tight throughout.',
    ARRAY['Ab Roller', 'Wheel Rollout', 'Rollout'], 5, 3, 4, 5, 8, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.95);

  -- Dragon Flag
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dragon Flag', 'bodyweight', 'isolation', 'advanced', false, true,
    'Lie on a bench gripping the edges behind your head. Raise your entire body up until only shoulders touch the bench. Lower your rigid body slowly toward the bench.',
    ARRAY['Bruce Lee Dragon Flag'], 6, 3, 4, 8, 8, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.95);

  -- Pallof Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Pallof Press', 'cable', 'rotation', 'beginner', false, true,
    'Stand sideways to a cable machine at chest height. Hold handle at chest with both hands. Press hands straight out, resisting rotation. Return to chest. This is an anti-rotation exercise.',
    ARRAY['Cable Pallof Press', 'Anti-Rotation Press'], 2, 1, 1, 3, 6, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.80);

  -- Copenhagen Plank
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Copenhagen Plank', 'bodyweight', 'isolation', 'advanced', false, true,
    'Side plank position with top leg elevated on a bench. Bottom leg hangs free. Hold position using adductors and obliques. Can add leg lifts for difficulty.',
    ARRAY['Copenhagen Side Plank', 'Adductor Side Plank'], 4, 3, 2, 5, 6, 5, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.70),
    (eid, mg_quads, 'secondary', 0.30);

  -- Dead Bug
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dead Bug', 'bodyweight', 'isolation', 'beginner', false, true,
    'Lie on your back with arms extended toward ceiling and knees bent at 90 degrees. Extend opposite arm and leg toward the floor while keeping lower back flat. Return and alternate.',
    ARRAY['Dead Bug Exercise'], 2, 1, 1, 3, 5, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.70);

  -- Bird Dog
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Bird Dog', 'bodyweight', 'isolation', 'beginner', false, true,
    'Start on all fours. Extend one arm forward and the opposite leg back simultaneously, keeping core tight and back flat. Return and alternate sides.',
    ARRAY['Quadruped Bird Dog'], 2, 1, 1, 2, 4, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.60),
    (eid, mg_glutes, 'secondary', 0.30);

  -- Suitcase Carry
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Suitcase Carry', 'dumbbell', 'carry', 'beginner', true, true,
    'Hold a heavy dumbbell or kettlebell in one hand at your side. Walk while keeping torso upright and resisting lateral bend. Core must work hard to prevent tilting.',
    ARRAY['Single-Arm Carry', 'Unilateral Farmer Carry'], 4, 2, 3, 2, 5, 5, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.75),
    (eid, mg_forearms, 'secondary', 0.50),
    (eid, mg_traps, 'secondary', 0.30);

  -- Turkish Get-Up
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Turkish Get-Up', 'dumbbell', 'rotation', 'advanced', true, true,
    'Lie on your back holding a weight in one hand overhead. Stand up through a series of controlled movements while keeping the weight overhead. Reverse the process to lie back down.',
    ARRAY['TGU', 'Get-Up'], 7, 4, 4, 9, 5, 6, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.70),
    (eid, mg_front_delts, 'secondary', 0.50),
    (eid, mg_glutes, 'secondary', 0.40),
    (eid, mg_quads, 'secondary', 0.30);

  -- Windmill
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Windmill', 'dumbbell', 'rotation', 'advanced', true, true,
    'Hold a weight overhead in one hand. Turn feet at an angle. Hinge and rotate torso to touch the floor with the free hand while keeping the weight overhead. Return to standing.',
    ARRAY['Kettlebell Windmill', 'Overhead Windmill'], 5, 4, 5, 7, 5, 5, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.75),
    (eid, mg_front_delts, 'secondary', 0.40),
    (eid, mg_hamstrings, 'secondary', 0.35);

  -- Cable Crunch
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cable Crunch', 'cable', 'isolation', 'beginner', false, true,
    'Kneel in front of a high cable with a rope attachment. Hold rope behind head. Crunch down, bringing elbows toward knees. Focus on contracting the abs.',
    ARRAY['Kneeling Cable Crunch', 'Rope Crunch'], 3, 1, 3, 3, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.85);

  -- Hanging Leg Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Hanging Leg Raise', 'bodyweight', 'isolation', 'intermediate', false, true,
    'Hang from a pull-up bar with arms extended. Raise legs until they are parallel to the floor or higher. Lower with control. Avoid swinging.',
    ARRAY['Hanging Knee Raise', 'Hanging Raise'], 4, 2, 2, 4, 8, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.90);

  -- Decline Sit-Up
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Decline Sit-Up', 'bodyweight', 'isolation', 'intermediate', false, true,
    'Lie on a decline bench with feet hooked under pads. Cross arms over chest or hold a plate. Sit up by contracting abs. Lower under control.',
    ARRAY['Decline Crunch', 'Weighted Sit-Up'], 4, 2, 4, 3, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.80);

  -- Side Plank
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Side Plank', 'bodyweight', 'isolation', 'beginner', false, true,
    'Lie on one side, propped on elbow. Raise hips off ground forming a straight line from shoulders to feet. Hold for time. Switch sides.',
    ARRAY['Oblique Plank', 'Lateral Plank'], 2, 1, 1, 2, 5, 3, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.65);

  -- ==========================================
  -- TRAP EXERCISES
  -- ==========================================

  -- Farmer's Carry
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Farmer''s Carry', 'dumbbell', 'carry', 'beginner', true, true,
    'Hold a heavy dumbbell or kettlebell in each hand at your sides. Walk with an upright posture for distance or time. Keep shoulders back and core braced.',
    ARRAY['Farmer Walk', 'Farmer''s Walk', 'Loaded Carry'], 6, 2, 5, 2, 6, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_traps, 'primary', 0.70),
    (eid, mg_forearms, 'primary', 0.75),
    (eid, mg_abs, 'secondary', 0.40);

  -- Rack Pull
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Rack Pull', 'barbell', 'hip_hinge', 'intermediate', true, true,
    'Set up a barbell on rack pins at knee height or just below. Grip the bar and stand up by extending hips and knees. Emphasizes the lockout portion of the deadlift.',
    ARRAY['Block Pull', 'Partial Deadlift'], 7, 4, 6, 4, 6, 9, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_traps, 'primary', 0.80),
    (eid, mg_back, 'primary', 0.70),
    (eid, mg_glutes, 'secondary', 0.50),
    (eid, mg_hamstrings, 'secondary', 0.40);

  -- Behind-the-Back Shrug
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Behind-the-Back Barbell Shrug', 'barbell', 'isolation', 'intermediate', false, true,
    'Stand holding a barbell behind your back with an overhand grip. Shrug shoulders straight up toward ears. Hold at the top. Lower under control.',
    ARRAY['Behind Back Shrug', 'Smith Machine Behind Back Shrug'], 4, 2, 3, 3, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_traps, 'primary', 0.85);

  -- Prone Y-Raise
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Prone Y-Raise', 'dumbbell', 'isolation', 'beginner', false, true,
    'Lie face down on an incline bench. Hold light dumbbells and raise arms up and out to form a Y shape, squeezing lower traps and rear delts. Lower under control.',
    ARRAY['Y-Raise', 'Incline Y-Raise', 'Prone Trap Raise'], 3, 2, 1, 3, 6, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_traps, 'primary', 0.70),
    (eid, mg_rear_delts, 'secondary', 0.50);

  -- Barbell Shrug
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Barbell Shrug', 'barbell', 'isolation', 'beginner', false, true,
    'Stand holding a barbell in front of thighs with an overhand grip. Shrug shoulders straight up toward ears. Pause at top. Lower under control.',
    ARRAY['BB Shrug', 'Standing Barbell Shrug'], 4, 2, 3, 2, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_traps, 'primary', 0.90);

  -- ==========================================
  -- FOREARM EXERCISES
  -- ==========================================

  -- Reverse Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Reverse Curl', 'barbell', 'isolation', 'beginner', false, true,
    'Hold a barbell with an overhand (pronated) grip. Curl the bar up toward shoulders, keeping elbows at sides. Lower under control. Targets brachioradialis and forearm extensors.',
    ARRAY['Reverse Barbell Curl', 'Pronated Curl', 'Overhand Curl'], 3, 3, 1, 2, 6, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_forearms, 'primary', 0.80),
    (eid, mg_biceps, 'secondary', 0.45);

  -- Wrist Roller
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Wrist Roller', 'other', 'isolation', 'beginner', false, true,
    'Hold a wrist roller device with arms extended in front. Roll the weight up by alternating wrist rotations. Then slowly unroll. Brutal forearm burn.',
    ARRAY['Forearm Roller', 'Wrist Roll'], 4, 2, 1, 2, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_forearms, 'primary', 0.90);

  -- Plate Pinch
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Plate Pinch', 'other', 'isolation', 'beginner', false, true,
    'Pinch two smooth weight plates together between thumb and fingers. Hold for time. Targets grip strength and finger flexors.',
    ARRAY['Plate Pinch Hold', 'Pinch Grip Hold'], 3, 1, 1, 2, 5, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_forearms, 'primary', 0.80);

  -- Finger Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Finger Curl', 'barbell', 'isolation', 'beginner', false, true,
    'Sit with forearms resting on thighs, wrists over knees, holding a barbell. Let the bar roll down to fingertips. Curl fingers closed to roll bar back into palms.',
    ARRAY['Barbell Finger Curl', 'Wrist Finger Curl'], 2, 1, 1, 2, 5, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_forearms, 'primary', 0.75);

  -- Reverse Wrist Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Reverse Wrist Curl', 'barbell', 'isolation', 'beginner', false, true,
    'Sit with forearms resting on thighs, palms down. Extend wrists upward, lifting the barbell. Lower under control. Targets wrist extensors.',
    ARRAY['Wrist Extension', 'Barbell Wrist Extension'], 2, 2, 1, 2, 5, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_forearms, 'primary', 0.75);

  -- ==========================================
  -- ADDITIONAL COMPOUND / FULL BODY EXERCISES
  -- ==========================================

  -- Trap Bar Deadlift
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Trap Bar Deadlift', 'barbell', 'hip_hinge', 'beginner', true, true,
    'Stand inside a hex/trap bar. Grip the handles at your sides. Drive through feet to stand up, keeping chest up and back neutral. Lower under control.',
    ARRAY['Hex Bar Deadlift', 'Trap Bar DL'], 7, 3, 5, 3, 7, 9, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.70),
    (eid, mg_glutes, 'primary', 0.75),
    (eid, mg_hamstrings, 'primary', 0.65),
    (eid, mg_back, 'secondary', 0.40),
    (eid, mg_traps, 'secondary', 0.45);

  -- Deficit Deadlift
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Deficit Deadlift', 'barbell', 'hip_hinge', 'advanced', true, true,
    'Stand on a low platform (1-3 inches). Perform a standard deadlift with the increased range of motion from the elevated position.',
    ARRAY['Elevated Deadlift', 'Deficit DL'], 9, 5, 8, 7, 7, 9, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_hamstrings, 'primary', 0.85),
    (eid, mg_glutes, 'primary', 0.80),
    (eid, mg_back, 'primary', 0.70),
    (eid, mg_quads, 'secondary', 0.50);

  -- Paused Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Paused Squat', 'barbell', 'squat', 'intermediate', true, true,
    'Perform a barbell back squat but pause at the bottom position for 2-3 seconds before driving back up. Eliminates the stretch reflex and builds strength out of the hole.',
    ARRAY['Pause Squat', 'Pin Squat'], 8, 5, 7, 5, 7, 9, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.90),
    (eid, mg_glutes, 'primary', 0.75),
    (eid, mg_hamstrings, 'secondary', 0.35);

  -- Safety Bar Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Safety Bar Squat', 'barbell', 'squat', 'intermediate', true, true,
    'Use a safety squat bar which sits higher on the traps with handles in front. Squat normally. The cambered design shifts the center of gravity forward, increasing upper back demand.',
    ARRAY['SSB Squat', 'Safety Squat Bar Squat', 'Yoke Bar Squat'], 8, 4, 6, 4, 8, 9, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.90),
    (eid, mg_glutes, 'primary', 0.75),
    (eid, mg_back, 'secondary', 0.45);

  -- Zercher Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Zercher Squat', 'barbell', 'squat', 'advanced', true, true,
    'Hold a barbell in the crooks of your elbows (elbow bend). Squat down and up while cradling the bar. Requires significant core stability and builds total body strength.',
    ARRAY['Zercher'], 8, 6, 5, 7, 7, 8, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.85),
    (eid, mg_glutes, 'primary', 0.70),
    (eid, mg_abs, 'secondary', 0.55),
    (eid, mg_biceps, 'secondary', 0.30);

  -- Good Morning
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Good Morning', 'barbell', 'hip_hinge', 'intermediate', true, true,
    'Place a barbell on your upper back as for squats. With a slight knee bend, hinge at the hips and lower torso until nearly parallel to floor. Drive hips forward to return to standing.',
    ARRAY['Barbell Good Morning', 'BB Good Morning'], 7, 4, 8, 6, 6, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_hamstrings, 'primary', 0.85),
    (eid, mg_glutes, 'primary', 0.70),
    (eid, mg_back, 'secondary', 0.50);

  -- Reverse Lunge
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dumbbell Reverse Lunge', 'dumbbell', 'lunge', 'beginner', true, true,
    'Hold dumbbells at sides. Step one foot back and lower into a lunge until both knees are at 90 degrees. Drive through front foot to return to standing.',
    ARRAY['Reverse Lunge', 'DB Reverse Lunge', 'Backward Lunge'], 5, 3, 2, 3, 7, 5, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.75),
    (eid, mg_glutes, 'primary', 0.70);

  -- Walking Lunge
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Barbell Walking Lunge', 'barbell', 'lunge', 'intermediate', true, true,
    'Place barbell on back. Step forward into a lunge, then drive off front foot and step forward with the other leg into the next lunge. Continue walking.',
    ARRAY['BB Walking Lunge', 'Weighted Walking Lunge'], 7, 4, 5, 5, 7, 7, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.80),
    (eid, mg_glutes, 'primary', 0.75),
    (eid, mg_hamstrings, 'secondary', 0.30);

  -- Dumbbell Bulgarian Split Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dumbbell Bulgarian Split Squat', 'dumbbell', 'lunge', 'intermediate', true, true,
    'Hold dumbbells at sides. Place rear foot on a bench behind you. Lower into a deep split squat by bending the front knee. Drive through front foot to stand.',
    ARRAY['DB Bulgarian Split Squat', 'Rear Foot Elevated Split Squat', 'RFESS'], 6, 4, 2, 5, 8, 6, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.85),
    (eid, mg_glutes, 'primary', 0.70);

  -- ==========================================
  -- ADDITIONAL ISOLATION / ACCESSORY EXERCISES
  -- ==========================================

  -- Cable Lateral Raise (Behind Body)
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Behind-Body Cable Lateral Raise', 'cable', 'isolation', 'intermediate', false, true,
    'Stand with a low cable behind you. Grab handle with the hand furthest from the machine, cable running behind your body. Raise arm out to the side.',
    ARRAY['Cable Behind Back Lateral Raise'], 3, 2, 1, 4, 8, 3, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_side_delts, 'primary', 0.90);

  -- Dumbbell Pullover
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dumbbell Pullover', 'dumbbell', 'isolation', 'intermediate', true, true,
    'Lie across a bench with upper back supported. Hold a dumbbell overhead with both hands. Lower it behind your head in an arc. Pull it back over your chest.',
    ARRAY['DB Pullover', 'Chest Pullover'], 5, 3, 3, 4, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.60),
    (eid, mg_back, 'primary', 0.60),
    (eid, mg_triceps, 'secondary', 0.25);

  -- Machine Pullover
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Machine Pullover', 'machine', 'isolation', 'beginner', false, true,
    'Sit in a pullover machine. Grip the bar or pads above and behind your head. Pull down in an arc until arms are in front of you. Return under control.',
    ARRAY['Nautilus Pullover', 'Pullover Machine'], 4, 2, 1, 1, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.80),
    (eid, mg_chest, 'secondary', 0.30);

  -- Cable Rear Delt Fly
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cable Rear Delt Fly', 'cable', 'isolation', 'beginner', false, true,
    'Stand between two high cable pulleys. Cross the cables and grab opposite handles. Pull arms out to the sides, squeezing rear delts. Return under control.',
    ARRAY['Cable Reverse Fly', 'High Cable Rear Delt Fly'], 3, 2, 1, 3, 7, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_rear_delts, 'primary', 0.85),
    (eid, mg_traps, 'secondary', 0.25);

  -- Dumbbell Rear Delt Fly (Bent-Over)
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Bent-Over Dumbbell Reverse Fly', 'dumbbell', 'isolation', 'beginner', false, true,
    'Bend forward at hips until torso is nearly parallel to floor. Hold dumbbells below chest. Raise arms out to sides, squeezing rear delts at the top. Lower under control.',
    ARRAY['Bent-Over Rear Delt Fly', 'Bent-Over Reverse Fly', 'DB Rear Delt Fly'], 4, 2, 3, 3, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_rear_delts, 'primary', 0.85),
    (eid, mg_traps, 'secondary', 0.30);

  -- EZ Bar Skull Crusher
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'EZ Bar Skull Crusher', 'barbell', 'isolation', 'intermediate', false, true,
    'Lie on a bench holding an EZ bar overhead. Lower the bar toward your forehead by bending elbows. Keep upper arms vertical. Extend elbows to press back up.',
    ARRAY['EZ Bar Lying Extension', 'EZ Skull Crusher'], 4, 4, 2, 4, 8, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.90);

  -- Dip (Tricep-Focused)
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Tricep Dip', 'bodyweight', 'vertical_push', 'intermediate', true, true,
    'Use parallel dip bars. Keep torso upright (not leaning forward) to emphasize triceps. Lower until elbows reach 90 degrees. Press back up.',
    ARRAY['Parallel Bar Dip', 'Upright Dip'], 6, 5, 2, 4, 7, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.85),
    (eid, mg_chest, 'secondary', 0.40),
    (eid, mg_front_delts, 'secondary', 0.30);

  -- Machine Bicep Curl
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Machine Bicep Curl', 'machine', 'isolation', 'beginner', false, true,
    'Sit in a bicep curl machine. Place arms on the pad and grip handles. Curl toward shoulders. Lower under control.',
    ARRAY['Curl Machine', 'Preacher Machine Curl'], 2, 1, 1, 1, 7, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_biceps, 'primary', 0.85);

  -- Machine Tricep Extension
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Machine Tricep Extension', 'machine', 'isolation', 'beginner', false, true,
    'Sit in a tricep extension machine. Press down or push handles forward by extending elbows. Return under control.',
    ARRAY['Tricep Machine', 'Seated Tricep Extension Machine'], 2, 2, 1, 1, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.85);

  -- Incline Dumbbell Fly
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Incline Dumbbell Fly', 'dumbbell', 'isolation', 'beginner', false, true,
    'Lie on an incline bench holding dumbbells above chest with slight elbow bend. Lower dumbbells out to the sides in a wide arc. Bring back together at the top.',
    ARRAY['Incline DB Fly', 'Incline Chest Fly'], 4, 3, 1, 3, 7, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.85),
    (eid, mg_front_delts, 'secondary', 0.25);

  -- Close-Grip Cable Row (V-Bar)
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Close-Grip Cable Row', 'cable', 'horizontal_pull', 'beginner', true, true,
    'Sit at a cable row station with a V-bar attachment. Pull the handle to your lower chest/upper abdomen while keeping elbows close to body. Squeeze back. Return under control.',
    ARRAY['V-Bar Cable Row', 'Neutral Grip Cable Row'], 4, 2, 2, 2, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.85),
    (eid, mg_biceps, 'secondary', 0.45);

  -- Wide-Grip Cable Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Wide-Grip Cable Row', 'cable', 'horizontal_pull', 'beginner', true, true,
    'Sit at a cable row with a wide bar attachment. Row to your upper abdomen with elbows wide. Squeezes mid-back and rear delts. Return under control.',
    ARRAY['Wide Grip Seated Row'], 4, 2, 2, 3, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.80),
    (eid, mg_rear_delts, 'secondary', 0.50),
    (eid, mg_biceps, 'secondary', 0.35);

  -- Dumbbell Upright Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dumbbell Upright Row', 'dumbbell', 'vertical_pull', 'intermediate', true, true,
    'Hold dumbbells in front of thighs. Pull them straight up along your body, leading with elbows, to chin height. Lower under control. Wider grip is shoulder-friendlier.',
    ARRAY['DB Upright Row'], 4, 4, 1, 3, 7, 5, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_side_delts, 'primary', 0.75),
    (eid, mg_traps, 'secondary', 0.50),
    (eid, mg_front_delts, 'secondary', 0.30);

  -- Bench Dip
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Bench Dip', 'bodyweight', 'vertical_push', 'beginner', true, true,
    'Place hands on the edge of a bench behind you with legs extended. Lower body by bending elbows. Press back up. Can elevate feet for more difficulty.',
    ARRAY['Tricep Bench Dip', 'Chair Dip'], 3, 4, 1, 2, 5, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_triceps, 'primary', 0.70),
    (eid, mg_chest, 'secondary', 0.30),
    (eid, mg_front_delts, 'secondary', 0.25);

  -- Cable Chest Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cable Chest Press', 'cable', 'horizontal_push', 'beginner', true, true,
    'Set cables at chest height. Stand between them, grab handles, and press forward until arms are extended. Return with control.',
    ARRAY['Standing Cable Press', 'Cable Press'], 4, 2, 1, 3, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.75),
    (eid, mg_front_delts, 'secondary', 0.35),
    (eid, mg_triceps, 'secondary', 0.35);

  -- Banded Face Pull
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Band Face Pull', 'bands', 'horizontal_pull', 'beginner', false, true,
    'Attach a resistance band at face height. Grip both ends and pull toward face, separating hands and squeezing rear delts and external rotators.',
    ARRAY['Banded Face Pull', 'Band Pull-Apart Face Pull'], 2, 1, 1, 2, 5, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_rear_delts, 'primary', 0.70),
    (eid, mg_traps, 'secondary', 0.35);

  -- Band Pull-Apart
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Band Pull-Apart', 'bands', 'horizontal_pull', 'beginner', false, true,
    'Hold a resistance band in front at shoulder height with arms extended. Pull the band apart by squeezing shoulder blades together until band touches chest. Return slowly.',
    ARRAY['Banded Pull-Apart', 'Band Rear Delt Pull'], 2, 1, 1, 1, 5, 3, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_rear_delts, 'primary', 0.65),
    (eid, mg_traps, 'secondary', 0.30);

  -- Kettlebell Swing
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Kettlebell Swing', 'other', 'hip_hinge', 'intermediate', true, true,
    'Stand with feet shoulder-width, holding a kettlebell with both hands. Hike the bell between legs, then explosively extend hips to swing it to chest height. Let it swing back down and repeat.',
    ARRAY['KB Swing', 'Russian Swing', 'Two-Hand Swing'], 6, 3, 4, 5, 5, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_glutes, 'primary', 0.80),
    (eid, mg_hamstrings, 'primary', 0.65),
    (eid, mg_abs, 'secondary', 0.35);

  -- Dumbbell Lateral Lunge
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Dumbbell Lateral Lunge', 'dumbbell', 'lunge', 'intermediate', true, true,
    'Hold dumbbells at sides. Step wide to one side and lower into a side lunge, pushing hips back. Keep the other leg straight. Push off to return to start.',
    ARRAY['Side Lunge', 'Lateral Lunge', 'Cossack Lunge'], 5, 3, 2, 4, 6, 5, true);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.70),
    (eid, mg_glutes, 'primary', 0.65);

  -- Push Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Push Press', 'barbell', 'vertical_push', 'intermediate', true, true,
    'Hold barbell at shoulders. Dip slightly at the knees and explosively drive the bar overhead using leg drive. Lock out overhead. Lower under control to shoulders.',
    ARRAY['BB Push Press', 'Standing Push Press'], 7, 4, 5, 5, 6, 8, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_front_delts, 'primary', 0.80),
    (eid, mg_triceps, 'secondary', 0.50),
    (eid, mg_quads, 'secondary', 0.30);

  -- Muscle-Up
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Muscle-Up', 'bodyweight', 'vertical_pull', 'advanced', true, true,
    'Hang from a bar. Perform an explosive pull-up and transition over the bar into a dip position. Press up until arms are straight. Lower back down under control.',
    ARRAY['Bar Muscle-Up', 'Ring Muscle-Up'], 8, 6, 3, 9, 6, 7, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.75),
    (eid, mg_chest, 'secondary', 0.40),
    (eid, mg_triceps, 'secondary', 0.50),
    (eid, mg_biceps, 'secondary', 0.40);

  -- V-Up
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'V-Up', 'bodyweight', 'isolation', 'intermediate', false, true,
    'Lie flat on your back with arms extended overhead. Simultaneously raise legs and torso to touch toes, forming a V shape. Lower back down under control.',
    ARRAY['V-Sit', 'Jack Knife Sit-Up', 'Pike Crunch'], 4, 2, 3, 3, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_abs, 'primary', 0.85);

  -- Landmine Row
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Landmine Row', 'barbell', 'horizontal_pull', 'beginner', true, true,
    'Set one end of a barbell in a landmine. Straddle the bar, grab the end with a V-handle or both hands. Row the bar toward your chest. Lower under control.',
    ARRAY['Landmine T-Bar Row', 'Landmine Bent-Over Row'], 5, 3, 4, 3, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.85),
    (eid, mg_biceps, 'secondary', 0.40),
    (eid, mg_rear_delts, 'secondary', 0.30);

  -- Smith Machine Squat
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Smith Machine Squat', 'machine', 'squat', 'beginner', true, true,
    'Stand in a Smith machine with bar on upper back. Feet slightly forward of the bar. Squat down until thighs are parallel. Press back up.',
    ARRAY['Smith Squat'], 5, 3, 4, 2, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_quads, 'primary', 0.85),
    (eid, mg_glutes, 'secondary', 0.50);

  -- Smith Machine Bench Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Smith Machine Bench Press', 'machine', 'horizontal_push', 'beginner', true, true,
    'Lie on a flat bench under a Smith machine. Unrack and lower the bar to mid-chest. Press back up. The fixed bar path provides stability.',
    ARRAY['Smith Bench Press', 'Smith Machine Flat Press'], 5, 3, 2, 2, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.80),
    (eid, mg_triceps, 'secondary', 0.45),
    (eid, mg_front_delts, 'secondary', 0.35);

  -- Weighted Pull-Up
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Weighted Pull-Up', 'bodyweight', 'vertical_pull', 'advanced', true, true,
    'Hang from a pull-up bar with added weight from a dip belt, weighted vest, or dumbbell between feet. Perform pull-ups with the extra load.',
    ARRAY['Weighted Chin-Up', 'Belt Pull-Up'], 8, 5, 3, 6, 8, 9, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.90),
    (eid, mg_biceps, 'secondary', 0.55),
    (eid, mg_abs, 'secondary', 0.25);

  -- Lat Pullover (Cable)
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Cable Pullover', 'cable', 'isolation', 'beginner', false, true,
    'Lie on a bench positioned perpendicular under a high cable with a straight bar. With slight elbow bend, pull bar from overhead to hips in an arc. Return under control.',
    ARRAY['Cable Lat Pullover', 'Lying Cable Pullover'], 3, 2, 2, 3, 7, 4, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_back, 'primary', 0.80),
    (eid, mg_chest, 'secondary', 0.25);

  -- Neutral-Grip Dumbbell Bench Press
  eid := gen_random_uuid();
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, is_compound, is_system, instructions, aliases, fatigue_score, joint_stress, spine_load, skill_score, hypertrophy_score, strength_score, is_unilateral)
  VALUES (eid, 'Neutral-Grip Dumbbell Bench Press', 'dumbbell', 'horizontal_push', 'beginner', true, true,
    'Lie on a flat bench with dumbbells held with a neutral (palms facing each other) grip. Press up and lower to chest.',
    ARRAY['Hammer Grip DB Press', 'Parallel Grip Press'], 5, 2, 2, 2, 7, 6, false);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES
    (eid, mg_chest, 'primary', 0.80),
    (eid, mg_triceps, 'secondary', 0.50),
    (eid, mg_front_delts, 'secondary', 0.30);

  RAISE NOTICE 'Successfully inserted 130+ new exercises with muscle group mappings.';
END $$;
