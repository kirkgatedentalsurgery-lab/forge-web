-- ============================================================
-- Migration 018: Rebuild ALL exercise_muscle_groups mappings
-- Deletes everything and re-inserts correct mappings using the
-- CORRECT muscle group UUIDs from the database.
-- ============================================================

-- Muscle Group UUID Reference (CORRECT):
-- Chest:       a1000000-0000-0000-0000-000000000001
-- Back:        a1000000-0000-0000-0000-000000000002
-- Front Delts: a1000000-0000-0000-0000-000000000003
-- Side Delts:  a1000000-0000-0000-0000-000000000004
-- Rear Delts:  a1000000-0000-0000-0000-000000000005
-- Biceps:      a1000000-0000-0000-0000-000000000006
-- Triceps:     a1000000-0000-0000-0000-000000000007
-- Traps:       a1000000-0000-0000-0000-000000000008
-- Quads:       a1000000-0000-0000-0000-000000000009
-- Hamstrings:  a1000000-0000-0000-0000-00000000000a
-- Glutes:      a1000000-0000-0000-0000-00000000000b
-- Calves:      a1000000-0000-0000-0000-00000000000c
-- Abs:         a1000000-0000-0000-0000-00000000000d
-- Forearms:    a1000000-0000-0000-0000-00000000000e

-- Step 1: Wipe all existing mappings
TRUNCATE exercise_muscle_groups;

-- ============================================================
-- CHEST EXERCISES
-- ============================================================

-- Barbell Bench Press: primary Chest, secondary Front Delts, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Bench Press';

-- Incline Barbell Bench Press: primary Chest, secondary Front Delts, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Incline Barbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Incline Barbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Incline Barbell Bench Press';

-- Decline Barbell Bench Press: primary Chest, secondary Front Delts, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Decline Barbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Decline Barbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Decline Barbell Bench Press';

-- Dumbbell Bench Press: primary Chest, secondary Front Delts, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Dumbbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Dumbbell Bench Press';

-- Incline Dumbbell Bench Press: primary Chest, secondary Front Delts, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Incline Dumbbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Incline Dumbbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Incline Dumbbell Bench Press';

-- Decline Dumbbell Bench Press: primary Chest, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Decline Dumbbell Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Decline Dumbbell Bench Press';

-- Dumbbell Fly: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Fly';

-- Incline Dumbbell Fly: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Incline Dumbbell Fly';

-- Cable Fly: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Fly';

-- Cable Crossover: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Crossover';

-- Pec Deck: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Pec Deck';

-- Machine Chest Press: primary Chest, secondary Front Delts, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Machine Chest Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Machine Chest Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Machine Chest Press';

-- Push-Up: primary Chest, secondary Triceps, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Push-Up';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Push-Up';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Push-Up';

-- Barbell Floor Press: primary Chest, primary Triceps, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Floor Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Floor Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Floor Press';

-- Hex Press: primary Chest, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Hex Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Hex Press';

-- Svend Press: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Svend Press';

-- Low-to-High Cable Fly: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Low-to-High Cable Fly';

-- High-to-Low Cable Fly: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'High-to-Low Cable Fly';

-- Landmine Press: primary Chest, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Landmine Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Landmine Press';

-- Band Chest Flye: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Chest Flye';

-- Band Flye: primary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Flye';

-- ============================================================
-- BACK EXERCISES
-- ============================================================

-- Barbell Bent-Over Row: primary Back, secondary Biceps, secondary Rear Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Bent-Over Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Bent-Over Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Bent-Over Row';

-- Dumbbell Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Dumbbell Row';

-- Cable Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Cable Row';

-- Seated Cable Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Seated Cable Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Seated Cable Row';

-- Lat Pulldown: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Lat Pulldown';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Lat Pulldown';

-- Close-Grip Lat Pulldown: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Close-Grip Lat Pulldown';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Close-Grip Lat Pulldown';

-- Behind-Neck Lat Pulldown: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Behind-Neck Lat Pulldown';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Behind-Neck Lat Pulldown';

-- Pull-Up: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Pull-Up';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Pull-Up';

-- Chin-Up: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Chin-Up';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Chin-Up';

-- Chest-Supported Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Chest-Supported Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Chest-Supported Row';

-- T-Bar Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'T-Bar Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'T-Bar Row';

-- Meadows Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Meadows Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Meadows Row';

-- Pendlay Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Pendlay Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Pendlay Row';

-- Yates Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Yates Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Yates Row';

-- Kroc Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Kroc Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Kroc Row';

-- Straight-Arm Pulldown: primary Back
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Straight-Arm Pulldown';

-- Inverted Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Inverted Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Inverted Row';

-- Single-Arm Cable Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Single-Arm Cable Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Single-Arm Cable Row';

-- Machine Row: primary Back, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Machine Row';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Machine Row';

-- ============================================================
-- QUADS EXERCISES
-- ============================================================

-- Barbell Back Squat: primary Quads, secondary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Back Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Back Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Back Squat';

-- Barbell Squat: primary Quads, secondary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Squat';

-- Barbell Front Squat: primary Quads, secondary Glutes, secondary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Front Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Front Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Front Squat';

-- Front Squat: primary Quads, secondary Glutes, secondary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Front Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Front Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Front Squat';

-- Leg Press: primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Leg Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Leg Press';

-- Leg Extension: primary Quads
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Leg Extension';

-- Hack Squat: primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Hack Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Hack Squat';

-- Hack Squat Machine: primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Hack Squat Machine';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Hack Squat Machine';

-- Bulgarian Split Squat: primary Quads, primary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Bulgarian Split Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Bulgarian Split Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Bulgarian Split Squat';

-- Barbell Bulgarian Split Squat: primary Quads, primary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Bulgarian Split Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Bulgarian Split Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Bulgarian Split Squat';

-- Walking Lunge: primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Walking Lunge';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Walking Lunge';

-- Reverse Lunge: primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Reverse Lunge';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Reverse Lunge';

-- Goblet Squat: primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Goblet Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Goblet Squat';

-- Sissy Squat: primary Quads
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Sissy Squat';

-- Cyclist Squat: primary Quads
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cyclist Squat';

-- Spanish Squat: primary Quads
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Spanish Squat';

-- Belt Squat: primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Belt Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Belt Squat';

-- Single-Leg Leg Press: primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Single-Leg Leg Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Single-Leg Leg Press';

-- Wall Sit: primary Quads
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Wall Sit';

-- Step-Up (Barbell): primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Step-Up (Barbell)';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Step-Up (Barbell)';

-- Step-Up (Dumbbell): primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Step-Up (Dumbbell)';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Step-Up (Dumbbell)';

-- Pendulum Squat: primary Quads, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Pendulum Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Pendulum Squat';

-- Paused Squat: primary Quads, secondary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Paused Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Paused Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Paused Squat';

-- Safety Bar Squat: primary Quads, secondary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Safety Bar Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Safety Bar Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Safety Bar Squat';

-- Zercher Squat: primary Quads, secondary Glutes, secondary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Zercher Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Zercher Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Zercher Squat';

-- ============================================================
-- HAMSTRINGS EXERCISES
-- ============================================================

-- Romanian Deadlift: primary Hamstrings, secondary Glutes, secondary Back
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Romanian Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Romanian Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Romanian Deadlift';

-- Barbell Romanian Deadlift: primary Hamstrings, secondary Glutes, secondary Back
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Romanian Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Romanian Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Romanian Deadlift';

-- Barbell Romanian Deadlift (RDL): primary Hamstrings, secondary Glutes, secondary Back
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Romanian Deadlift (RDL)';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Romanian Deadlift (RDL)';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Romanian Deadlift (RDL)';

-- Dumbbell Romanian Deadlift: primary Hamstrings, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Romanian Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Dumbbell Romanian Deadlift';

-- Lying Leg Curl: primary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Lying Leg Curl';

-- Seated Leg Curl: primary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Seated Leg Curl';

-- Leg Curl: primary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Leg Curl';

-- Nordic Curl: primary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Nordic Curl';

-- Nordic Hamstring Curl: primary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Nordic Hamstring Curl';

-- Glute-Ham Raise: primary Hamstrings, primary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Glute-Ham Raise';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Glute-Ham Raise';

-- Sliding Leg Curl: primary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Sliding Leg Curl';

-- Single-Leg RDL: primary Hamstrings, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Single-Leg RDL';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Single-Leg RDL';

-- 45-Degree Back Extension: primary Hamstrings, primary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = '45-Degree Back Extension';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = '45-Degree Back Extension';

-- Good Morning: primary Hamstrings, secondary Back, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Good Morning';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Good Morning';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Good Morning';

-- Stiff-Leg Deadlift: primary Hamstrings, secondary Glutes, secondary Back
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Stiff-Leg Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Stiff-Leg Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Stiff-Leg Deadlift';

-- Band Leg Curl: primary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Leg Curl';

-- ============================================================
-- DEADLIFTS (multi-muscle)
-- ============================================================

-- Conventional Deadlift: primary Back, primary Hamstrings, secondary Glutes, secondary Quads
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Conventional Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Conventional Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Conventional Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Conventional Deadlift';

-- Sumo Deadlift: primary Quads, primary Glutes, secondary Hamstrings, secondary Back
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Sumo Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Sumo Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Sumo Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Sumo Deadlift';

-- Trap Bar Deadlift: primary Quads, primary Back, secondary Hamstrings, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Trap Bar Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Trap Bar Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Trap Bar Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Trap Bar Deadlift';

-- Deficit Deadlift: primary Back, primary Hamstrings, secondary Glutes, secondary Quads
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Deficit Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Deficit Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Deficit Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Deficit Deadlift';

-- Snatch-Grip Deadlift: primary Back, primary Hamstrings, secondary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Snatch-Grip Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Snatch-Grip Deadlift';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Snatch-Grip Deadlift';

-- ============================================================
-- GLUTES EXERCISES
-- ============================================================

-- Barbell Hip Thrust: primary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Hip Thrust';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Hip Thrust';

-- Hip Thrust: primary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Hip Thrust';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Hip Thrust';

-- Glute Bridge: primary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Glute Bridge';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Glute Bridge';

-- B-Stance Hip Thrust: primary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'B-Stance Hip Thrust';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'B-Stance Hip Thrust';

-- Single-Leg Hip Thrust: primary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Single-Leg Hip Thrust';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Single-Leg Hip Thrust';

-- Cable Glute Kickback: primary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Glute Kickback';

-- Cable Pull-Through: primary Glutes, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Pull-Through';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Cable Pull-Through';

-- Frog Pump: primary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Frog Pump';

-- Sumo Squat: primary Glutes, primary Quads
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Sumo Squat';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0
FROM exercises e WHERE e.name = 'Sumo Squat';

-- Curtsy Lunge: primary Glutes, secondary Quads
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Curtsy Lunge';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Curtsy Lunge';

-- Fire Hydrant: primary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Fire Hydrant';

-- Clamshell: primary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Clamshell';

-- Hip Abduction Machine: primary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Hip Abduction Machine';

-- Hip Adduction Machine: primary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Hip Adduction Machine';

-- Band Clamshell: primary Glutes
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Clamshell';

-- Kettlebell Swing: primary Glutes, primary Hamstrings, secondary Back
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0
FROM exercises e WHERE e.name = 'Kettlebell Swing';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0
FROM exercises e WHERE e.name = 'Kettlebell Swing';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Kettlebell Swing';

-- ============================================================
-- SHOULDERS EXERCISES
-- ============================================================

-- Overhead Press: primary Front Delts, secondary Triceps, secondary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Overhead Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Overhead Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Overhead Press';

-- Barbell Overhead Press: primary Front Delts, secondary Triceps, secondary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Overhead Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Overhead Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Overhead Press';

-- Dumbbell Shoulder Press: primary Front Delts, secondary Triceps, secondary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Shoulder Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Dumbbell Shoulder Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Dumbbell Shoulder Press';

-- Arnold Press: primary Front Delts, primary Side Delts, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Arnold Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Arnold Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Arnold Press';

-- Z-Press: primary Front Delts, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Z-Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Z-Press';

-- Push Press: primary Front Delts, secondary Triceps, secondary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Push Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Push Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Push Press';

-- Machine Shoulder Press: primary Front Delts, secondary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Machine Shoulder Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Machine Shoulder Press';

-- Bradford Press: primary Front Delts, secondary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Bradford Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Bradford Press';

-- Scott Press: primary Side Delts, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Scott Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Scott Press';

-- Dumbbell Lateral Raise: primary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Lateral Raise';

-- Lateral Raise: primary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Lateral Raise';

-- Cable Lateral Raise: primary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Lateral Raise';

-- Band Lateral Raise: primary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Lateral Raise';

-- Machine Lateral Raise: primary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Machine Lateral Raise';

-- Lu Raise: primary Side Delts, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Lu Raise';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Lu Raise';

-- Bus Driver Raise: primary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Bus Driver Raise';

-- Cable Y-Raise: primary Side Delts, secondary Rear Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Y-Raise';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Cable Y-Raise';

-- Front Raise (Dumbbell): primary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Front Raise (Dumbbell)';

-- Front Raise (Barbell): primary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0
FROM exercises e WHERE e.name = 'Front Raise (Barbell)';

-- Cable Face Pull: primary Rear Delts, secondary Traps, secondary Side Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Face Pull';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Cable Face Pull';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Cable Face Pull';

-- Band Face Pull: primary Rear Delts, secondary Traps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Face Pull';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Band Face Pull';

-- Dumbbell Rear Delt Fly: primary Rear Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Rear Delt Fly';

-- Reverse Pec Deck: primary Rear Delts, secondary Traps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0
FROM exercises e WHERE e.name = 'Reverse Pec Deck';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Reverse Pec Deck';

-- Prone Y-Raise: primary Rear Delts, secondary Traps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0
FROM exercises e WHERE e.name = 'Prone Y-Raise';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Prone Y-Raise';

-- Upright Row (Barbell): primary Side Delts, secondary Traps, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Upright Row (Barbell)';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Upright Row (Barbell)';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Upright Row (Barbell)';

-- Upright Row (Dumbbell): primary Side Delts, secondary Traps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0
FROM exercises e WHERE e.name = 'Upright Row (Dumbbell)';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Upright Row (Dumbbell)';

-- Band Pull-Apart: primary Rear Delts, secondary Traps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Pull-Apart';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Band Pull-Apart';

-- ============================================================
-- BICEPS EXERCISES
-- ============================================================

-- Barbell Curl: primary Biceps, secondary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Curl';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Barbell Curl';

-- Dumbbell Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Curl';

-- Dumbbell Bicep Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Bicep Curl';

-- EZ-Bar Curl: primary Biceps, secondary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'EZ-Bar Curl';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'secondary', 0.5
FROM exercises e WHERE e.name = 'EZ-Bar Curl';

-- Hammer Curl: primary Biceps, secondary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Hammer Curl';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Hammer Curl';

-- Incline Dumbbell Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Incline Dumbbell Curl';

-- Preacher Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Preacher Curl';

-- Preacher Curl Machine: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Preacher Curl Machine';

-- Concentration Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Concentration Curl';

-- Cable Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Curl';

-- Spider Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Spider Curl';

-- Bayesian Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Bayesian Curl';

-- Drag Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Drag Curl';

-- Zottman Curl: primary Biceps, primary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Zottman Curl';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Zottman Curl';

-- Waiter Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Waiter Curl';

-- Cross-Body Hammer Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cross-Body Hammer Curl';

-- 21s Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = '21s Curl';

-- Band Curl: primary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Curl';

-- Reverse Curl: primary Forearms, secondary Biceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Reverse Curl';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Reverse Curl';

-- ============================================================
-- TRICEPS EXERCISES
-- ============================================================

-- Tricep Pushdown: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Tricep Pushdown';

-- Cable Tricep Pushdown: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Tricep Pushdown';

-- Overhead Tricep Extension: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Overhead Tricep Extension';

-- Lying Tricep Extension: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Lying Tricep Extension';

-- Skull Crusher: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Skull Crusher';

-- Close-Grip Bench Press: primary Triceps, primary Chest, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Close-Grip Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Close-Grip Bench Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Close-Grip Bench Press';

-- Dip: primary Triceps, secondary Chest, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dip';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Dip';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Dip';

-- Tricep Dip: primary Triceps, secondary Chest, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Tricep Dip';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Tricep Dip';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Tricep Dip';

-- Chest Dip: primary Chest, primary Triceps, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0
FROM exercises e WHERE e.name = 'Chest Dip';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Chest Dip';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Chest Dip';

-- Diamond Push-Up: primary Triceps, secondary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Diamond Push-Up';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Diamond Push-Up';

-- Dumbbell Kickback: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Kickback';

-- Cable Kickback: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Kickback';

-- JM Press: primary Triceps, secondary Chest
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'JM Press';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5
FROM exercises e WHERE e.name = 'JM Press';

-- Tate Press: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Tate Press';

-- French Press: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'French Press';

-- Overhead Cable Extension: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Overhead Cable Extension';

-- Single-Arm Cable Pushdown: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Single-Arm Cable Pushdown';

-- Band Tricep Pushdown: primary Triceps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Tricep Pushdown';

-- ============================================================
-- CALVES EXERCISES
-- ============================================================

-- Standing Calf Raise: primary Calves
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0
FROM exercises e WHERE e.name = 'Standing Calf Raise';

-- Seated Calf Raise: primary Calves
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0
FROM exercises e WHERE e.name = 'Seated Calf Raise';

-- Leg Press Calf Raise: primary Calves
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0
FROM exercises e WHERE e.name = 'Leg Press Calf Raise';

-- Bodyweight Calf Raise: primary Calves
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0
FROM exercises e WHERE e.name = 'Bodyweight Calf Raise';

-- Donkey Calf Raise: primary Calves
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0
FROM exercises e WHERE e.name = 'Donkey Calf Raise';

-- Single-Leg Calf Raise: primary Calves
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0
FROM exercises e WHERE e.name = 'Single-Leg Calf Raise';

-- Tibialis Raise: primary Calves
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0
FROM exercises e WHERE e.name = 'Tibialis Raise';

-- ============================================================
-- ABS EXERCISES
-- ============================================================

-- Plank: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Plank';

-- Cable Crunch: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Crunch';

-- Crunch: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Crunch';

-- Machine Crunch: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Machine Crunch';

-- Hanging Leg Raise: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Hanging Leg Raise';

-- Ab Wheel Rollout: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Ab Wheel Rollout';

-- Pallof Press: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Pallof Press';

-- Band Pallof Press: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Band Pallof Press';

-- Russian Twist: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Russian Twist';

-- Copenhagen Plank: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Copenhagen Plank';

-- Dead Bug: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dead Bug';

-- Bird Dog: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Bird Dog';

-- Suitcase Carry: primary Abs, secondary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Suitcase Carry';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Suitcase Carry';

-- Turkish Get-Up: primary Abs, secondary Front Delts
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Turkish Get-Up';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Turkish Get-Up';

-- Windmill: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Windmill';

-- Decline Sit-Up: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Decline Sit-Up';

-- Side Plank: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Side Plank';

-- V-Up: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'V-Up';

-- Dragon Flag: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dragon Flag';

-- Cable Rotation: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Cable Rotation';

-- Leg Raise: primary Abs
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0
FROM exercises e WHERE e.name = 'Leg Raise';

-- ============================================================
-- TRAPS EXERCISES
-- ============================================================

-- Barbell Shrug: primary Traps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Shrug';

-- Dumbbell Shrug: primary Traps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0
FROM exercises e WHERE e.name = 'Dumbbell Shrug';

-- Behind-Back Shrug: primary Traps
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0
FROM exercises e WHERE e.name = 'Behind-Back Shrug';

-- Farmer''s Walk: primary Traps, primary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0
FROM exercises e WHERE e.name = 'Farmer''s Walk';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Farmer''s Walk';

-- Farmer''s Carry: primary Traps, primary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0
FROM exercises e WHERE e.name = 'Farmer''s Carry';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Farmer''s Carry';

-- Rack Pull: primary Traps, primary Back, secondary Hamstrings
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0
FROM exercises e WHERE e.name = 'Rack Pull';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0
FROM exercises e WHERE e.name = 'Rack Pull';

INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5
FROM exercises e WHERE e.name = 'Rack Pull';

-- ============================================================
-- FOREARMS EXERCISES
-- ============================================================

-- Wrist Curl: primary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Wrist Curl';

-- Barbell Reverse Wrist Curl: primary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Barbell Reverse Wrist Curl';

-- Reverse Wrist Curl: primary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Reverse Wrist Curl';

-- Wrist Roller: primary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Wrist Roller';

-- Plate Pinch: primary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Plate Pinch';

-- Finger Curl: primary Forearms
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude)
SELECT e.id, 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0
FROM exercises e WHERE e.name = 'Finger Curl';
