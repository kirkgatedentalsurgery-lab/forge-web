-- Auto-imported from wger.de public exercise database
-- Adds 537 new exercises

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Tricep Pushdown on Cable', 'bodyweight', 'isolation', 'intermediate', 'The cable rope push-down is a popular exercise targeting the triceps muscles. It''s easy to learn and perform, making it a favorite for everyone from beginners to advanced lifters. It is usually perfor', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'commando pull-ups', 'bodyweight', 'isolation', 'intermediate', 'variation of the pull-up exercise, it is performed with a grip of one hand supine and one hand prone,&nbsp;do not twist the torso to get back to the front, the head passes once to one side, once to th', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single Arm Plank to Row', 'dumbbell', 'horizontal_pull', 'intermediate', 'Start position as row, extend to plank and back. Finish with row and repeat', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Abdominal Stabilization', 'bodyweight', 'isolation', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Handstand Push Up', 'bodyweight', 'vertical_push', 'intermediate', 'Handstands Push Up which demand high level of skill', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'one-handed kettlebell curls', 'dumbbell', 'isolation', 'intermediate', 'Standing with the kettlebell in one hand and bent at the elbow, start from a fully extended position until your hand reaches shoulder height. To perform the movement correctly, try not to push with yo', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Knee Raises', 'bodyweight', 'isolation', 'intermediate', 'The 90° leg raise on the bar is a very intense exercise that involves all the abdominal muscles.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Hip Adduction', 'bodyweight', 'squat', 'intermediate', 'Starting Position: Sit on the machine with your knees inward and against the pads. Pull the pin to release the pads. Grab the handles on the sides.b', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell Lunges Standing', 'barbell', 'squat', 'intermediate', 'Put barbell on the back of your shoulders. Stand upright, then take the first step forward. Step should bring you forward so that your supporting legs knee can touch the floor. Then stand back up and ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell Ab Rollout', 'barbell', 'isolation', 'intermediate', 'Place a barbell on the floor at your feet.
Bending at the waist, grip the barbell with a shoulder with overhand grip.
With a slow controlled motion, roll the bar out so that your back is straight.
Rol', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell Triceps Extension', 'barbell', 'isolation', 'intermediate', 'Position barbell overhead with narrow overhand grip.
Lower forearm behind upper arm with elbows remaining overhead. Extend forearm overhead. Lower and repeat.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Nordic Curl', 'bodyweight', 'squat', 'intermediate', 'Natural Leg Extension is alternative to Leg Extension machine with no equipment.&nbsp;&nbsp;', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Straight Bar Cable Curls', 'bodyweight', 'isolation', 'intermediate', 'Standing upright in front of Cable Tower using a straight bar', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Fly', 'bodyweight', 'horizontal_push', 'intermediate', 'cable machine, two steps forward, straight back', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg raises pull up bar', 'bodyweight', 'isolation', 'intermediate', 'with a firm grip with both hands on the bar, raise your outstretched legs, until you reach a 90° angle with your torso.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Biceps Curls With Dumbbell', 'dumbbell', 'isolation', 'intermediate', 'Hold two barbells, the arms are streched, the hands are on your side, the palms face inwards. Bend the arms and bring the weight with a fast movement up. At the same time, rotate your arms by 90 degre', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bent Over Rowing', 'barbell', 'horizontal_pull', 'intermediate', 'Holding a barbell with a pronated grip (palms facing down), bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bent Over Dumbbell Rows', 'bodyweight', 'horizontal_pull', 'intermediate', 'With dumbbells in hand, bend at the hip until hands hang just below the knees (similar to straight-legged-deadlift starting position). Keep upper body angle constant while contracting your lats to pul', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Biceps Curls With SZ-bar', 'barbell', 'isolation', 'intermediate', 'Hold the SZ-bar shoulder-wide, the back is straight, the shoulders slightly back, the arms are streched. Bend the arms, bringing the weight up, with a fast movement. Without pausing, let down the bar ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Benchpress Dumbbells', 'bodyweight', 'horizontal_push', 'intermediate', 'The movement is very similar to benchpressing with a barbell, however, the weight is brought down to the chest at a lower point.
Hold two dumbbells and lay down on a bench. Hold the weights next to th', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Biceps Curls With Barbell', 'barbell', 'isolation', 'intermediate', 'Hold the Barbell shoulder-wide, the back is straight, the shoulders slightly back, the arms are streched. Bend the arms, bringing the weight up, with a fast movement. Without pausing, let down the bar', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bench Press', 'barbell', 'horizontal_push', 'intermediate', 'Lay down on a bench, the bar should be directly above your eyes, the knees are somewhat angled and the feet are firmly on the floor. Concentrate, breath deeply and grab the bar more than shoulder wide', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bench Press Narrow Grip', 'barbell', 'isolation', 'intermediate', 'Lay down on a bench, the bar is directly over your eyes, the knees form a slight angle and the feet are firmly on the ground. Hold the bar with a narrow grip (around 20cm.). Lead the weight slowly dow', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Biceps Curl With Cable', 'bodyweight', 'isolation', 'intermediate', 'Stand around 30 - 40cm away from the cable, the feet are firmly on the floor. Take the bar and lift the weight with a fast movements. Lower the weight as with the dumbbell curls slowly and controlled.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single Leg Extension', 'bodyweight', 'squat', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bent High Pulls', 'dumbbell', 'vertical_push', 'intermediate', 'Bend over slightly while holding two dumbbells.  Pull the dumbbells up to your chest, keeping your elbows as high as you can.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lat Pulldown (Wide Grip)', 'bodyweight', 'horizontal_pull', 'intermediate', 'ExecutionStarting position:Arms extended overhead, feeling a stretch in your lats.Keep your shoulders depressed (don’t shrug upward).Pulling phase (concentric):Pull the bar&nbsp;down to your upper che', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Preacher Curl (Close Grip)', 'barbell', 'isolation', 'intermediate', 'Sitting reverse on a Biceps Bench with a close grip', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Close-grip Lat Pull Down', 'bodyweight', 'horizontal_pull', 'intermediate', 'Grip the pull-down bar with your hands closer than shoulder width apart, with your palms facing away from you. Lean back slightly. Pull the bar down towards your chest, keeping your elbows close to yo', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Braced Squat', 'bodyweight', 'squat', 'intermediate', 'Stand with feet slightly wider than shoulder-width apart, while standing as tall as you can.
Grab a weight plate and hold it out in front of your body with arms straight out. Keep your core tight and ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Calf Press Using Leg Press Machine', 'bodyweight', 'isolation', 'intermediate', 'Put  the balls of your feet on an extended leg press pad.  Use your calves to press the weight by flexing your feet/toes into a pointed position, and releasing back into a relaxed position.
This exerc', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Chin-ups', 'bodyweight', 'horizontal_pull', 'intermediate', 'The chin-up (also known as a chin or chinup) is a strength training exercise. People frequently do this exercise with the intention of strengthening muscles such as the latissimus dorsi and biceps, wh', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Calf Raises on Hackenschmitt Machine', 'bodyweight', 'isolation', 'intermediate', 'Place yourself on the machine with your back firmly against the backrest, the feet are on the platform for calf raises. Check that the feet are half free and that you can completely stretch the calf m', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Butterfly Narrow Grip', 'bodyweight', 'horizontal_push', 'intermediate', 'The movement is the same as with a regular butterfly, only that the grip is narrow:
Sit on the butterfly machine, the feet have a good contact with the floor, the upper arms are parallel to the floor.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Butterfly', 'bodyweight', 'horizontal_push', 'intermediate', 'Sit on the butterfly machine, the feet have a good contact with the floor, the upper arms are parallel to the floor. Press your arms together till the handles are practically together (but aren''t!). G', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Crunches on Machine', 'bodyweight', 'isolation', 'intermediate', 'The procedure is very similar as for regular crunches, only with the additional weight of the machine. Sit on the machine, put both feet firmly on the ground. Grab the to the weights, cables, etc. and', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Crunches', 'bodyweight', 'isolation', 'intermediate', 'Lay down on your back on a inclined bench, feet are on one end of the bench. Ask a partner or use some other help (barbell, etc.) to keep them fixed, your hands are behind your head. From this positio', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Butterfly Reverse', 'bodyweight', 'vertical_push', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Crunches', 'bodyweight', 'isolation', 'intermediate', 'Lay down on your back a soft surface, the feet are on the floor. Ask a partner or use some other help (barbell, etc.) to keep them fixed, your hands are behind your head. From this position move your ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Crunches With Legs Up', 'bodyweight', 'isolation', 'intermediate', 'On your back, legs extended straight up, reach toward your toes with your hands and lift your shoulder blades off the ground and back.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Chest Press', 'bodyweight', 'horizontal_push', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cross-Bench Dumbbell Pullovers', 'dumbbell', 'horizontal_push', 'intermediate', 'Grasp a moderately weighted dumbbell so your palms are flat against the underside of the top plates and your thumbs are around the bar. Lie on your back across a flat bench so only your upper back and', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Woodchoppers', 'bodyweight', 'isolation', 'intermediate', 'Set cable pulley slightly lower than chest height. Keep body facing forward with hips stable.  Grab the pulley handle, fully extend your arms and bring your arms forward and across your body. Hold for', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Flutter Kicks', 'bodyweight', 'isolation', 'intermediate', '-Laying on the back, lift your straightened legs from the ground at a 45 degree angle. 
-As your Left foot travels downward and nearly touches the floor, your Right foot should seek to reach a 90 degr', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Deadlifts', 'barbell', 'horizontal_pull', 'intermediate', 'Stand firmly, with your feet slightly more than shoulder wide apart. Stand directly behind the bar where it should barely touch your shin, your feet pointing a bit out. Bend down with a straight back,', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Facepull', 'bodyweight', 'vertical_push', 'intermediate', 'Attach a rope to a pulley station set at about chest level.
Step back so you''re supporting the weight with arms completely outstretched and assume a staggered (one foot forward) stance. Bend the knees', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Goblet Squat', 'dumbbell', 'squat', 'intermediate', 'Grasp dumbbell with both hands at the sides of the upper plates. Hold dumbbell in front of chest, close to torso. Place feet about shoulderwide apart, keep knees slightly bent.
Squat down until thighs', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Decline Bench Press Barbell', 'barbell', 'horizontal_push', 'intermediate', 'Lay down on a decline bench, the bar should be directly above your eyes, the knees are somewhat angled and the feet are firmly on the floor. Concentrate, breath deeply and grab the bar more than shoul', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Decline Bench Press Dumbbell', 'dumbbell', 'horizontal_push', 'intermediate', 'Take two dumbbells and sit on a decline bench, the feet are firmly on the floor, the head is resting the bench. Hold the weights next to the chest, at the height of your nipples and press them up till', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Lunges Standing', 'dumbbell', 'squat', 'intermediate', '.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse EZ Bar Cable Curls', 'barbell', 'isolation', 'intermediate', 'Standing in front of cable tower using a SZ Bar', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Machine chest fly', 'bodyweight', 'horizontal_push', 'intermediate', 'seated machine, straight back, slow exercise', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Decline Pushups', 'bodyweight', 'horizontal_push', 'intermediate', 'With your feet raised approximately 30cm on a platform, align your shoulders, elbows and hands, then perform regular pushups. This emphasises the clavicular fibers of the pectoralis major.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Fly With Cable', 'bodyweight', 'horizontal_push', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Lunges Walking', 'dumbbell', 'squat', 'intermediate', 'Take two dumbbells in your hands, stand straight, feet about shoulder wide. Take one long step so that the front knee is approximately forming a right angle. The back leg is streched, the knee is low ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Fly With Dumbbells, Decline Bench', 'dumbbell', 'horizontal_push', 'intermediate', 'The exercise is the same as with a regular bench:
Take two dumbbells and lay on a bench, make sure the feet are firmly on the ground and your back is not arched, but has good contact with the bench. T', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Fly With Dumbbells', 'dumbbell', 'horizontal_push', 'intermediate', 'Take two dumbbells and lay on a bench, make sure the feet are firmly on the ground and your back is not arched, but has good contact with the bench. The arms are stretched in front of you, about shoul', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Incline Curl', 'dumbbell', 'isolation', 'intermediate', 'Setup: Set an adjustable bench to an incline of approximately 45 to 60 degrees.Starting Position: Sit back against the bench with a dumbbell in each hand. Let your arms hang straight down toward the f', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Triceps Extension', 'dumbbell', 'isolation', 'intermediate', 'Position one dumbbell over head with both hands under inner plate (heart shaped grip).
With elbows over head, lower forearm behind upper arm by flexing elbows. Flex wrists at bottom to avoid hitting d', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dips Between Two Benches', 'bodyweight', 'isolation', 'intermediate', 'Put two benches so far appart, that you can hold onto one with your hands and are just able to reach the other with your feet. The legs stay during the exercise completely stretched. With your elbows ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbells on Scott Machine', 'bodyweight', 'isolation', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front Raises with Plates', 'bodyweight', 'vertical_push', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hanging Leg Raises', 'bodyweight', 'isolation', 'intermediate', 'Hanging from bar or straps, bring legs up with knees extended or flexed', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front Raises', 'barbell', 'vertical_push', 'intermediate', 'To execute the exercise, the lifter stands with their feet shoulder width apart and weights or resistance handles held by their side with a pronated (overhand) grip.
The movement is to bring the arms ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hyperextensions', 'bodyweight', 'horizontal_pull', 'intermediate', 'Lie on the hyperextension pillow with your navel at the front edge, allowing your upper body to hang freely. Tighten all your back muscles and raise your torso until you''re horizontal, but no higher. ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hindu Squats', 'bodyweight', 'squat', 'intermediate', 'Start with your feet shoulder width apart and arms slightly behind your back.
As you descend towards the floor, raise your heels off the ground, while keeping your back as vertical  as possible. 
Upon', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front Squats', 'barbell', 'squat', 'intermediate', 'This variation of the squat trains the hamstrings and gluteus maximus. It also works the back extensors and abductors.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hammercurls on Cable', 'bodyweight', 'isolation', 'intermediate', 'Take a cable in your hands (palms parallel, point to each other), the body is straight. Bend the arms and bring the weight up with a fast movement. Without any pause bring it back down with a slow, co', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hammer Curls', 'dumbbell', 'isolation', 'intermediate', 'Start: Hold dumbbells at your sides with palms facing your torso.Curl: Lift the weights toward your shoulders while maintaining the neutral grip (like holding a hammer).Squeeze: Contract the biceps at', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Skullcrusher Dumbbells', 'bodyweight', 'isolation', 'intermediate', 'Hold the dumbbells and lay down on a flat bench in such a way that around 1/4 of your head is over the edge. Stretch arms straight up and then lean dumbbells away from your toes to a 10-20 degree angl', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Skullcrusher SZ-bar', 'bodyweight', 'isolation', 'intermediate', 'Hold the SZ-bar and lay down on a flat bench in such a way that around 1/4 of your head is over the edge. Stretch your arms with the bar and bend them so that the bar is lowered. Just before it touche', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front Pull narrow', 'barbell', 'horizontal_pull', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front pull wide', 'barbell', 'horizontal_pull', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hercules Pillars', 'bodyweight', 'isolation', 'intermediate', 'Grab two cables stand in the middle so both have tension and hold', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Handstand Pushup', 'bodyweight', 'vertical_push', 'intermediate', 'The handstand push-up (press-up) - also called the vertical push-up (press-up) or the inverted push-up (press-up) also called commandos- is a type of push-up exercise where the body is positioned in a', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hip Thrust', 'barbell', 'squat', 'intermediate', 'The bar should go directly on your upper thigh, directly below your crotch. Your feet should be directly under your knees. Push your hips up so that you form a straight line from your knees to your sh', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'High Pull', 'bodyweight', 'vertical_push', 'intermediate', 'Use a light barbell, perform explosive lift up starting from underneath knee cap level. Lift/raise explosively using hips, at shoulder level. Tempo: 2111', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hollow Hold', 'bodyweight', 'isolation', 'intermediate', 'Get on a mat and lie on your back. Contract your abs, stretch your raise and legs and raise them (your head and shoulders are also be raised). Make sure your lower back remains in contact with the mat', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Rope Pullover/row', 'bodyweight', 'horizontal_pull', 'intermediate', 'Set up bench in front of cable row machine. Lean over bench to do a row/pullover with rope that targets lats. See picture.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single arm row', 'bodyweight', 'horizontal_pull', 'intermediate', 'Sitting on the ground, use a high cable in a single grip, to do lat pulldowns with a focus on a long stretch in the lats.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell Clean and press', 'dumbbell', 'vertical_push', 'intermediate', 'This exercise involves lifting a barbell from the ground to the shoulders, then pressing it overhead. It is a compound movement that targets multiple muscle groups, including the legs, back, shoulders', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Good Mornings', 'bodyweight', 'squat', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front Plate Raise', 'bodyweight', 'vertical_push', 'intermediate', 'The plate front raise is a variation of the dumbbell front raise where the lifter holds a weight plate between two hands, rather than using a dumbbell, barbell, or other weight. It can provide variety', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Curls (laying)', 'bodyweight', 'squat', 'intermediate', 'Lay on a bench and put your calves behind the leg holder (better if they are hold on around the lower calves). Hold a grip on the bars to make sure the body is firmly in place. Bend your legs bringing', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lat Pull Down (Leaning Back)', 'bodyweight', 'horizontal_pull', 'intermediate', 'Lean Back, Pull into chest', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lat Pull Down (Straight Back)', 'bodyweight', 'horizontal_pull', 'intermediate', 'Pull bar down to strenum and keep straight back.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Curls (sitting)', 'bodyweight', 'squat', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lateral Rows on Cable, One Armed', 'bodyweight', 'vertical_push', 'intermediate', 'Set cable at waist height, start with arm across your belly and move han over and out too other side, one arm at the time.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lateral Raises', 'dumbbell', 'vertical_push', 'intermediate', 'This exercise works the deltoid muscle of the shoulder. The movement starts with the arms straight, and the hands holding weights at the sides or in front of the body. Body is in a slight forward-lean', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Smith Press', 'bodyweight', 'vertical_push', 'intermediate', 'Sitting almost 90 degree angle, smith machine&nbsp;', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Isometric Wipers', 'bodyweight', 'horizontal_push', 'intermediate', 'Assume push-up position, with hands slightly wider than shoulder width.
Shift body weight as far as possible to one side, allowing the elbow on that side to flex. 
Reverse the motion, moving completel', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Curl', 'bodyweight', 'squat', 'intermediate', 'The leg curl, also known as the hamstring curl, is an isolation exercise that targets the hamstring muscles. The exercise involves flexing the lower leg against resistance towards the buttocks. Other ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lateral-to-Front Raises', 'dumbbell', 'vertical_push', 'intermediate', '-(1) Perform a lateral raise, pausing at the top of the lift (2).
-Instead of lowering the weight, bring it to the front of your body so that you appear to be at the top position of a front raise.  Yo', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Push up', 'bodyweight', 'horizontal_push', 'intermediate', 'Regular push with a 30 degree incline.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Squats on Multipress', 'bodyweight', 'squat', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Jumping Jacks', 'bodyweight', 'squat', 'intermediate', 'A jumping jack or star jump, also called side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide and the hands going overhead,', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Plank With Alternate Floor Touch', 'bodyweight', 'isolation', 'intermediate', 'Perform the plank with legs elevated, feet on a gymball. Once stabilised, slowly move one foot sideways off the ball, then make it touch the floor, then come back to starting position. Alternate with ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Kettlebell Swings', 'dumbbell', 'squat', 'intermediate', 'Hold the kettlebell securely in both hands. Keep your back flat throughout the move, avoiding any rounding of the spine.Keeping your knees "soft", hinge your hips backwards, letting the kettlebell swi', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Cross-over', 'bodyweight', 'horizontal_push', 'intermediate', 'Begin with cables at about shoulder height, one in each hand. Take a step forward so that one foot is in front of the other, for stability, and so that there is tension on the cables. Bring hands toge', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leverage Machine Iso Row', 'bodyweight', 'horizontal_pull', 'intermediate', 'Adjust seat height so that the handles are at the bottom of your pectorals or just below.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Long-Pulley, Narrow', 'bodyweight', 'horizontal_pull', 'intermediate', 'The exercise is the same as the regular long pulley, but with a narrow grip:
Sit down, put your feet on the supporting points and grab the bar with a wide grip. Pull the weight with a rapid movement t', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Negative Crunches', 'bodyweight', 'isolation', 'intermediate', 'Sit yourself on the decline bench and fix your legs. Cross your arms over the chest and bring with a rolling movement your upper body up, go now without a pause and with a slow movement down again. Do', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Diamond push ups', 'bodyweight', 'horizontal_push', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Raises, Standing', 'bodyweight', 'isolation', 'intermediate', 'Put your forearms on the pads on the leg raise machine, the body is hanging freely. Lift now your legs with a fast movement as high as you can, make a short pause of 1sec at the top, and bring them do', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Straight Bar Cable Front Raise', 'barbell', 'vertical_push', 'intermediate', 'Back to cable tower, cable between legs, SZ Bar', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leverage Machine Chest Press', 'bodyweight', 'horizontal_push', 'intermediate', 'Be sure to adjust seat height so that the handles are towards the bottom of your pectorals.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Quadriped Arm and Leg Raise', 'bodyweight', 'horizontal_pull', 'intermediate', 'In this exercise, the back muscles and the muscles of the back of the leg and back of the arm are activated by lifting the crossed arm and leg at the same time in the crawling position. It also improv', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Raises, Lying', 'bodyweight', 'isolation', 'intermediate', 'Lay down on a bench and hold onto the recliner with your hands to keep you stable. Hold your legs straight and lift them till they make an angle of about 45°. Make a short pause of 1 sec. and go slowl', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Raise', 'bodyweight', 'squat', 'intermediate', 'The leg raise is a strength training exercise which targets the iliopsoas (the anterior hip flexors). Because the abdominal muscles are used isometrically to stabilize the body during the motion, leg ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Long-Pulley (low Row)', 'bodyweight', 'horizontal_pull', 'intermediate', 'Sit down, put your feet on the supporting points and grab the bar with a wide grip. Pull the weight with a rapid movement towards your belly button, not upper. Keep your arms and elbows during the mov', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Curls (standing)', 'bodyweight', 'squat', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Press on Hackenschmidt Machine', 'bodyweight', 'squat', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Presses (narrow)', 'bodyweight', 'squat', 'intermediate', 'The exercise is very similar to the wide leg press:
Sit on the machine and put your feet on the platform so far apart  that you could just put another foot in between them. The feet are parallel and p', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Presses (wide)', 'bodyweight', 'squat', 'intermediate', 'Sit on the machine and put your feet on the platform, a bit more than shoulder wide. The feet are turned outwards by a few degrees.
Lower the weight so much, that the knees form a right angle. Push im', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Muscle up', 'bodyweight', 'horizontal_pull', 'intermediate', 'The body is then explosively pulled up by the arms in a radial pull-up, with greater speed than a regular pull-up. When the bar approaches the upper chest, the wrists are swiftly flexed to bring the f', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pendelay Rows', 'barbell', 'horizontal_pull', 'intermediate', 'Back excercise with a barbell with a starting position which is in a bent over position with the back paralell to the ground. The barbell is on the ground at chest level.For the movement grab the barb', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Rack Deadlift', 'bodyweight', 'horizontal_pull', 'intermediate', 'Deadlift to be done using a Smith machine or a free rack. Bar or barbell hould be just right under the knee cap level. Lift using the glutes and through the heels, then come back to starting postion w', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pause Bench', 'barbell', 'horizontal_push', 'intermediate', 'Lower the bar to your chest and pause (but do not rest) there for 2 seconds. Press back up. use the same weight you would on bench press, but perform only single reps. Total the number of reps you did', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Preacher Curls', 'barbell', 'isolation', 'intermediate', 'Place the EZ curl bar on the rest handles in front of the preacher bench. Lean over the bench and grab the EZ curl bar with palms up. Sit down on the preacher bench seat so your upper arms rest on top', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pike Push Ups', 'bodyweight', 'isolation', 'intermediate', 'Push Up performed from a pike position (optional to have feet elevated).', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pistol Squat', 'bodyweight', 'squat', 'intermediate', 'Stand with feet hip-width apart, toes pointed forward, and chest tall.Extend your leg straight out; extend both arms in front of you, at shoulder level. Brace your core and look straight ahead.Slowly ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pull Ups on Machine', 'bodyweight', 'horizontal_pull', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Dumbbell Side Lateral', 'dumbbell', 'vertical_push', 'intermediate', 'seated slightly leaned forward at beginning of exercise', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pull-ups', 'bodyweight', 'horizontal_pull', 'intermediate', 'Grab the pull up bar with a wide grip, the body is hanging freely. Keep your chest out and pull yourself up till your chin reaches the bar or it touches your neck, if you want to pull behind you. Go w', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Overhand Cable Curl', 'bodyweight', 'isolation', 'intermediate', 'Hands at shoulder height, curl arms in toward head, then back out.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Scissors', 'bodyweight', 'isolation', 'intermediate', 'Scissors is an abdominal exercise that strengthens the transverse abdominals, helping flatten your belly and strengthen your entire core. Scissors is not only a core strength move, but it is also a gr', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Rowing seated, narrow grip', 'bodyweight', 'horizontal_pull', 'intermediate', 'Tighten musclesControlled movementSlow movementKeep upper body uprightDo not lean backPull toward chest', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Bar Curl', 'barbell', 'isolation', 'intermediate', 'Hold bar with reverse (or "overhand") grip, palms facing the floor.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Renegade Row', 'dumbbell', 'horizontal_pull', 'intermediate', 'Get into pushup position gripping some dumbbells. Perform one pushup, then drive your left elbo up, bringing the dumbell up to your body. Return the dumbell to starting position. 
Perform another push', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Rowing, T-bar', 'bodyweight', 'horizontal_pull', 'intermediate', 'The execution of this exercise is very similar to the regular bent over rowing, only that the bar is fixed here.
Grab the barbell with a wide grip (slightly more than shoulder wide) and lean forward. ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Triceps Press', 'bodyweight', 'isolation', 'intermediate', 'Sit down on a back (better with back support). Take a dumbbell firmly with both hands and hold it with extended arms over your head. With your palms facing upward and holding the weight of the dumbbel', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Rowing, Lying on Bench', 'bodyweight', 'horizontal_pull', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Ring Dips', 'bodyweight', 'isolation', 'intermediate', 'Dips peformed on gymnastic rings.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bent Over Rowing Reverse', 'barbell', 'horizontal_pull', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder Press, on Machine', 'bodyweight', 'vertical_push', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Grip Bench Press', 'barbell', 'horizontal_push', 'intermediate', 'Upper chest focuses exercise that also works triceps', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Modified pulldown', 'bodyweight', 'horizontal_pull', 'intermediate', 'With an inclined bench in front of the pulldown machine, use a close-grip to do latfocused pulldowns.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Bent Over Face Pull', 'dumbbell', 'horizontal_pull', 'intermediate', 'This exercise involves using dumbbells to perform a bent over face pull, which targets the upper back and shoulders. The movement involves pulling the weights towards the face while keeping the elbows', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Doorway Pectoral Stretch', 'bodyweight', 'horizontal_push', 'intermediate', 'Place the forearm vertically on a door frame or stationary object at head heightStep forward past the arm, keeping it still against the object to stretch the chest', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shotgun Row', 'bodyweight', 'horizontal_pull', 'intermediate', 'Attach a single handle to a low cable.
After selecting the correct weight, stand a couple feet back with a wide-split stance. Your arm should be extended and your shoulder forward. This will be your s', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Splinter Sit-ups', 'bodyweight', 'isolation', 'intermediate', 'Lie on your back with your legs straight and arms at your sides, keeping your elbows bent at 90 degrees. As you sit up, twist your upper body to the left and bring your left knee toward your right elb', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder Press, on Multi Press', 'bodyweight', 'vertical_push', 'intermediate', 'The exercise is basically the same as with a free barbell:
Sit on a bench, the back rest should be almost vertical. Take a bar with a shoulder wide grip and bring it down to chest height. Press the we', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Sit-ups', 'bodyweight', 'isolation', 'intermediate', 'Sit on a mat, your calves are resting on a bench, the knees make a right angle. Hold your hands behind your neck. Go now up with a rolling movement of your back, you should feel how the individual ver', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder Press, Dumbbells', 'dumbbell', 'vertical_push', 'intermediate', 'Sit on a bench, the back rest should be almost vertical. Take two dumbbells and bring them up to shoulder height, the palms and the elbows point during the whole exercise to the front. Press the weigh', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder Press, Barbell', 'barbell', 'vertical_push', 'intermediate', 'Sit on a bench, the back rest should be almost vertical. Take a barbell with a shoulder wide grip and bring it up to chest height. Press the weight up, but don''t stretch the arms completely. Go slowly', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single-arm Preacher Curl', 'dumbbell', 'isolation', 'intermediate', 'Sit on the preacher curl bench and perform a bicep curl with a dumbbell in one hand. Your other hand can be at rest, or beneath your curling arm''s elbow.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Sitting Calf Raises', 'bodyweight', 'isolation', 'intermediate', 'Sit on a bench for calf raises and check that the feet are half free and that you can completely stretch the calf muscles down. Pull your calves up, going as far (up) as you can. Make at the highest p', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Side Dumbbell Trunk Flexion', 'dumbbell', 'isolation', 'intermediate', 'AKA dumbbell side bends. Stand in line with the hips with slightly bent knees, maintain the natural curvature of the spine, hand stretched by the body, grip the barbell with one hand.  Make slow and c', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Side to Side Push Ups', 'bodyweight', 'horizontal_push', 'intermediate', '-start in push up position
-lean the body weight to the right side, and complete a push up with the chest over the right hand
-come back to the centered position
-on rep 2, lean to the left side', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Smith Machine Close-grip Bench Press', 'bodyweight', 'isolation', 'intermediate', 'Perform a standard bench press on the smith machine, but have your hands on the bar about shoulder width apart, and keep your elbows close to your body.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Side Crunch', 'bodyweight', 'isolation', 'intermediate', 'Hold weight in one hand. Bend side ways to the knee. Pull upo to upright position using your obliquus.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shrugs, Barbells', 'barbell', 'vertical_push', 'intermediate', 'Take a barbell and stand with a straight body, the arms are hanging freely in front of you. Lift from this position the shoulders as high as you can, but don''t bend the arms during the movement. On th', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shrugs on Multipress', 'bodyweight', 'vertical_push', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shrugs, Dumbbells', 'dumbbell', 'vertical_push', 'intermediate', 'Stand with straight body, the hands are hanging freely on the side and hold each a dumbbell. Lift from this position the shoulders as high as you can, but don''t bend the arms during the movement. On t', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder Shrug', 'bodyweight', 'vertical_push', 'intermediate', 'The shoulder shrug (usually called simply the shrug) is an exercise in weight training used to develop the upper trapezius muscle. The lifter stands erect, hands about shoulder width apart, and raises', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Side Bends on Machine', 'dumbbell', 'isolation', 'intermediate', '', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Straight-arm Pull Down (bar Attachment)', 'bodyweight', 'horizontal_pull', 'intermediate', 'Use the straight bar attachment on a high pulley. Grasp the two ends of the bar with your palms facing downward and your arms straight out in front of you. Pull your hands down towards your hips, whil', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Sumo Squats', 'bodyweight', 'squat', 'intermediate', 'Stand with your feet wider than your shoulders, with your toes pointed out at a 45 degree angle and barbell on your shoulder.
While keeping your back straight, descend slowly by bending at the knees a', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Straight-arm Pull Down (rope Attachment)', 'bodyweight', 'horizontal_pull', 'intermediate', 'Use the rope attachment on a high pulley. Grasp the two ends of the rope with your arms straight out in front of you. Pull your hands down towards your hips, while keeping your arms straight, then rai', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Squat Thrust', 'bodyweight', 'squat', 'intermediate', 'The burpee, or squat thrust, is a full body exercise used in strength training and as an aerobic exercise. The basic movement is performed in four steps and known as a four-count burpee: Begin in a st', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Stiff-legged Deadlifts', 'barbell', 'squat', 'intermediate', 'Keep legs straight
Keep back straight', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Standing Calf Raises', 'bodyweight', 'isolation', 'intermediate', 'Get onto the calf raises machine, you should able to completely push your calves down. Stand straight, don''t make a hollow back and don''t bend your legs. Pull yourself up as high as you can. Make a sm', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Squat Jumps', 'bodyweight', 'squat', 'intermediate', 'Jump wide, then close', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Squats', 'barbell', 'squat', 'intermediate', 'Place a barbell in a rack just below shoulder-height. Dip under the bar to put it behind the neck across the top of the back, and grip the bar with the hands wider than shoulder-width apart. Lift the ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Standing Bicep Curl', 'dumbbell', 'isolation', 'intermediate', 'Stand holding dumbbells at shoulder width apart. Face forearm upward and keep upper arm still while raising each dumbbell up to your shoulder.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Tricep Dumbbell Kickback', 'dumbbell', 'isolation', 'intermediate', 'Start with a dumbbell in each hand and your palms facing your torso. Keep your back straight with a slight bend in the knees and bend forward at the waist. Your torso should be almost parallel to the ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Triceps Extensions on Cable With Bar', 'bodyweight', 'isolation', 'intermediate', 'Grab the bar, stand with your feet shoulder wide, keep your back straight and lean forward a little. Push the bar down, making sure the elbows don''t move during the exercise. Without pause go back to ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Superman', 'bodyweight', 'horizontal_pull', 'intermediate', 'Lay flat on your stomach with your arms extended in front of you on the ground as your legs are lying flat. Lift both your arms and legs at the same time, as if you were flying, and contract the lower', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Triceps on Machine', 'bodyweight', 'isolation', 'intermediate', 'Sit down and hold the bar firmly with your hands. Now press the weight upwards (don''t fully extend your arms) and lower it slowly again. As with other triceps exercises, it''s important not to move you', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wide-grip Pulldown', 'bodyweight', 'horizontal_pull', 'intermediate', 'Lat pulldowns with a wide grip on the bar.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Underhand Lat Pull Down', 'bodyweight', 'horizontal_pull', 'intermediate', 'Grip the pull-down bar with your palms facing you and your hands closer than shoulder-width apart. Lean back slightly and keep your back straight. Pull the bar down towards your chest, pulling your sh', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Upright Row w/ Dumbbells', 'dumbbell', 'vertical_push', 'intermediate', 'Feet apart at shoulder width. Nice and Slow!', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Curl with kettlebell two hands', 'dumbbell', 'isolation', 'intermediate', 'Stand upright and grip the kettlebell with both hands. Perform the elbow flexion motion, starting from a fully extended position until your hand reaches shoulder height. Spread your legs a little for ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Power Clean', 'barbell', 'horizontal_push', 'intermediate', 'Olympic weight lifting', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Calf raises, one legged', 'bodyweight', 'isolation', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Upright Row, SZ-bar', 'barbell', 'vertical_push', 'intermediate', 'Stand straight, your feet are shoulder-width apart. Hold the SZ-bar with an overhand grip on your thighs, the arms are stretched. Lift the bar close to the body till your chin. The elbows point out so', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wall Pushup', 'bodyweight', 'isolation', 'intermediate', 'Pushup against a wall', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Upright Row, on Multi Press', 'bodyweight', 'vertical_push', 'intermediate', 'The movements are basically the same as with an SZ-bar, but you use the bar on the multi press:
Stand straight, your feet are shoulder-width apart. Hold the bar with an overhand grip on your thighs, t', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Upper External Oblique', 'bodyweight', 'horizontal_push', 'intermediate', 'Exercise for upper external oblique muscles', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Trunk Rotation With Cable', 'bodyweight', 'isolation', 'intermediate', 'Seated trunk rotation with cable', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wall Slides', 'bodyweight', 'horizontal_pull', 'intermediate', 'Stand with heels, shoulders, back of head, and hips touching the wall. Start with biceps straight out and elbows at a 90 degree angle. Straighten the arms while remaining againstthe wall without archi', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Overhead Press', 'barbell', 'horizontal_push', 'intermediate', '', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Elevated prayer stretch', 'bodyweight', 'horizontal_pull', 'intermediate', 'Starting position:
Kneel in front of a bench, far enough so that your torso can fit between your knees and the bench. With your back straight, place your elbows on the bench, with palms together, hand', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Plate twist', 'bodyweight', 'isolation', 'intermediate', 'Step 1: Sit on an exercise mat with your legs extended in front of you. 
Step 2: Grasp a plate in both hands as if holding a steering wheel, arms slightly bent, and hold it in front of your abdominals', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hindu Pushups', 'bodyweight', 'vertical_push', 'intermediate', 'Exercise to strengthen the shoulders and pectorals. Its name is due to the fact that it begins in the Yoga position "Dog Facing Down", passing to "Cobra" but without resting the legs or torso on the g', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Bent Over Row', 'dumbbell', 'vertical_push', 'intermediate', '&nbsp;Hold&nbsp;your dumbbells&nbsp;at your sides and hinge at the hips until your chest is parallel to the floor, dumbbells hanging below your knees (picture 1). Keeping your elbows close to your bod', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Close-grip Press-ups', 'bodyweight', 'horizontal_push', 'intermediate', 'Drop into a strong plank position, bringing your hands close together until they''re almost touching.&nbsp;(picture 1)&nbsp;Bend your elbows to slowly bring your chest to the floor&nbsp;(picture 2). Ke', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Medicine ball twist', 'bodyweight', 'isolation', 'intermediate', 'In a seated position, the torso is rotated from side to side without forcing, approaching the knees and making the ball touch the ground from time to time', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Vpushup', 'bodyweight', 'isolation', 'intermediate', 'Lift your body off the ground by pushing your arms upwards', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Plank Shoulter Taps', 'bodyweight', 'isolation', 'intermediate', 'In the correct plank position, place your feet slightly wider than shoulder-width apart. alternately lift and touch the opposite shoulder with one hand.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Unilateral Cable row', 'bodyweight', 'horizontal_pull', 'intermediate', 'With an inclined bench in front of the cable row machine, do onehanded rows with focus on a big stretch in the lats.&nbsp;', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Front Squat', 'dumbbell', 'squat', 'intermediate', 'This exercise involves holding a dumbbell in each hand at shoulder height and performing a squat. It targets the lower body muscles, including the quads, hamstrings, and glutes, while also engaging th', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Kettlebell One Legged Deadlift', 'dumbbell', 'squat', 'intermediate', 'This exercise involves holding a kettlebell in one hand and standing on one leg while bending forward to touch the kettlebell to the ground. It targets the hamstrings, glutes, and lower back while als', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Incline Fly', 'dumbbell', 'horizontal_push', 'intermediate', 'This exercise involves lying on an incline bench and holding dumbbells in each hand. The arms are then extended out to the sides, parallel to the ground, and then brought back together in a hugging mo', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Decline Bench Press', 'dumbbell', 'horizontal_push', 'intermediate', 'The dumbbell decline bench press is a great exercise for targeting your lower chest muscles', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Weighted Crunch', 'dumbbell', 'isolation', 'intermediate', 'The Weighted Crunch is a variation of the classic crunch exercise that involves adding resistance (a weight) to increase the intensity of the abdominal work.

Lay down(Optional) Bend your knees to add', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Side Bend', 'dumbbell', 'isolation', 'intermediate', 'This exercise involves holding a dumbbell in one hand and bending sideways to work the oblique muscles on the side of the body. It can be done standing or seated and is often used as a core strengthen', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Rear Lunge', 'dumbbell', 'squat', 'intermediate', 'This exercise involves holding a dumbbell in each hand and stepping back into a lunge position, then returning to standing. It primarily targets the glutes, hamstrings, and quadriceps.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Side Squat', 'bodyweight', 'squat', 'intermediate', 'This exercise involves holding a dumbbell in one hand and performing a squat while stepping to the side. It targets the legs, glutes, and core muscles.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Machine lateral wise', 'bodyweight', 'vertical_push', 'intermediate', 'The machine lateral raise is an isolation exercise that targets the medial (side) deltoid muscle to build wider, more defined shoulders. The machine''s fixed path of motion provides greater stability t', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Machine Chest Press Exercise', 'bodyweight', 'horizontal_push', 'intermediate', '. It provides an effective but straightforward way to work your upper body. With no weights to balance and no tricky techniques to master, the chest press leaves you free to focus on your training.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Skull Crush', 'bodyweight', 'isolation', 'intermediate', 'Siting in a 45 Degree Angle, using DB to do Incline Skull Crush', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Rear Delt Raise', 'dumbbell', 'vertical_push', 'intermediate', 'Seated on a bench with the dumbbells on the floor bend over at 45 Degrees and then slowly raise each dumbbell to shoulder height and hold for a couple seconds before lowering to the starting position.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Bench Press', 'bodyweight', 'horizontal_push', 'intermediate', 'Set up the chest press machine so that the grips are aligned with your lower chest when you sit down. Make sure you''re sitting with your back flat against the seat. Grab a handle in each hand, stick y', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated rear delt rise', 'dumbbell', 'horizontal_pull', 'intermediate', 'Seated, bent 45 deg forward. Arms fully stretched out, raise arms up to shoulder height and back down', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dynamic side hold', 'dumbbell', 'isolation', 'intermediate', 'Sling a rubber band on a kettlebell and lift the kettlebell by the rubber band. Let it hang by your side and stand on one leg, switch leg while continuing hold. Repeat with other hand', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wall balls', 'bodyweight', 'squat', 'intermediate', 'Get a medicine ball, shoulder width stance, squat, thrust the ball as high as possible against the wall and catch', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Horizontal traction isometry', 'bodyweight', 'isolation', 'intermediate', 'Perform a timed isometric pull-up on the bar', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Alternate back lunges', 'bodyweight', 'squat', 'intermediate', 'The posterior muscles of the buttocks, hamstrings, soleus and gastrocnemius are trained more', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'walking bridge', 'bodyweight', 'isolation', 'intermediate', 'from a standing position with knees slightly bent and hands resting on the floor. From here, proceed forward with your hands keeping your buttocks contracted and without losing control of your lower b', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Knee Tuck', 'bodyweight', 'isolation', 'intermediate', 'Sit on floor or mat. Place arms slightly behind you. Raise legs. Now extend your legs and pull them back.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Concentration Curl', 'bodyweight', 'isolation', 'intermediate', 'The concentration curl is a classic exercise for building the biceps one arm at a time. It can be performed bent over or kneeling, but is more often performed seated on a bench. It''s great for emphasi', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Push-Ups | Incline', 'bodyweight', 'horizontal_push', 'intermediate', 'Inclined push-ups primarily target the chest muscles (pectoralis major and minor), but also work the triceps, shoulders, and core to a lesser extent. Because the upper body is elevated, the incline pu', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Push-Ups | Decline', 'bodyweight', 'horizontal_push', 'intermediate', 'Decline push-ups are another modified version of the traditional push-up that target the upper body muscles in a different way. To perform a decline push-up, elevate your feet on an elevated surface, ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Push-Ups | Parallettes', 'bodyweight', 'horizontal_push', 'intermediate', 'Parallettes push-ups are a variation of the traditional push-up that are performed with the hands on parallel bars, known as parallettes. To perform a parallettes push-up, assume a push-up position wi', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Arabesque', 'bodyweight', 'squat', 'intermediate', 'Take all your weight onto one&nbsp;leg&nbsp;and you''re going to&nbsp;maintain that position, keeping your hips and pelvis level the whole time. With&nbsp;your back in a neutral position you want to ti', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Triceps Pushdown', 'bodyweight', 'isolation', 'intermediate', 'Triceps pushdown on cable using lat bar.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Curl de biceps con agarre prono', 'dumbbell', 'isolation', 'intermediate', 'POSICIÓN INICIAL:Seleccione el peso adecuado en una barra. Colóquese de pie con la barra usando un agarre prono y las manos a la anchura de los hombros. Contraiga el suelo pelvico y el core mientras m', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Alternating Biceps Curls With Dumbbell', 'dumbbell', 'isolation', 'intermediate', 'Hold two barbells, the arms are streched, the hands are on your 
side, the palms face inwards. Bend one arm at a time and bring the weight with a 
fast movement up. At the same time, rotate your arms ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Russian Twist', 'dumbbell', 'isolation', 'intermediate', '&nbsp;Hold a dumbbell, barbell weight or something else that is heavy with both hands, but make sure it is not too heavy and you are able to keep in form.Lean back to a 45-degree angle from the floor.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Side Slides + Squats', 'bodyweight', 'squat', 'intermediate', 'With feet a little wider than shoulder-width apart and staying low to mimic a defensive position, you should step with their lead leg and push off with their plant leg.
After three slides, rotate your', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wall Drills', 'bodyweight', 'squat', 'intermediate', 'Exercises for strengthening knee and leg musculature.Lateral Wall Drills March - https://youtu.be/9RiTlJ6MmekLateral Wall Drills OPEN - https://youtu.be/ADRlN8-WfdgLateral Wall Drills CROSS - https://', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Inverted Rows', 'bodyweight', 'horizontal_push', 'intermediate', 'Maintain a straight body, retract your shoulder blades, and pull your 
chest to the bar for an effective back and upper body workout.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dragon squat', 'bodyweight', 'squat', 'intermediate', 'Start standing with your feet hip-width apart. Cross your right foot behind you to the left corner and back of the room while bending both knees. Return and repeat, alternating sides. Keep your hips a', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Calf raises, left leg', 'bodyweight', 'isolation', 'intermediate', 'Stand on the floor or on the edge of a step to increase the range of movement.&nbsp;Raise one foot.Lift your heel until you''re standing on your toes.(variable) Stay in this position for three secondsS', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Romanian deadlift, single leg', 'dumbbell', 'squat', 'intermediate', 'Also known as: &nbsp;RDL.

Steps:', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Full Sit Outs', 'bodyweight', 'isolation', 'intermediate', '(A) Get in high plank position on your hands and toes.(B) Shift your weight to your left hand as you turn your body to the right; bend your right leg behind you and extend your right arm up. Return to', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Snow Angel', 'bodyweight', 'horizontal_pull', 'intermediate', 'Lay flat on your stomach with your arms extended in front of you on the ground as your legs are lying flat. Lift both your arms and move them to your side slowly. Then, move them back.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'knee push-ups', 'bodyweight', 'isolation', 'intermediate', 'Start by kneeling on the floor, keeping your knees together. Place your hands on the floor in front of you, slightly wider than shoulder-width apart.Make sure your body forms a straight line from head', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Australian pull-ups', 'bodyweight', 'isolation', 'intermediate', 'Lie down under a high bar or suspension bar, positioned at an appropriate height.Position yourself on your back under the bar, gripping the bar with a supinated grip (palms facing you).Adjust your pos', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder Dumbbell Pendular Exercise', 'dumbbell', 'vertical_push', 'intermediate', 'Lean forward to rest your hand on a chair or other object, holding a dumbbell in the other hand  Gently swing the dumbbell in a circular motion', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder External Rotation with Dumbbell', 'dumbbell', 'vertical_push', 'intermediate', 'Lie on your side holding a dumbbell in your upper handTuck your elbow into your side and rest the hand in front of youRotate the shoulder so the hand raises up  Lower the hand down', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Claps over the head', 'bodyweight', 'isolation', 'intermediate', 'Stand with your feet shoulder width apart. Raise your arms and clap over your head', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell drag curls', 'dumbbell', 'isolation', 'intermediate', 'Hold a dumbbell in each hand with your palms facing forward. Pull your elbows back and lift the dumbbells to your chest height. Slowly lower the dumbbell and repeat the exercise.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Shoulder Press Up', 'bodyweight', 'horizontal_push', 'intermediate', 'Place your hands on the bench in a press up positionPush your chest away from the bench to separate your shoulder bladesKeeping your elbows straight, lower your chest towards the bench so your shoulde', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell wide bicep curls', 'dumbbell', 'isolation', 'intermediate', 'Hold a dumbbell in each hand with your hands slightly wider than shoulder-width apart and palms facing forward. 

Bend your elbows and lift the dumbbells to your shoulders. Slowly return and repeat.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Kneck extension', 'barbell', 'isolation', 'intermediate', 'Unilateral triceps exercise with your back to the pulley, with the pulley at the top', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell bicep curl to press', 'dumbbell', 'isolation', 'intermediate', 'Bend your elbows and lift the dumbbells to your shoulders.

Push the dumbbells over your head while rotating your arms to make your palms face forward. Reverse it to lower down. Repeat the exercise.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell rear delt row', 'dumbbell', 'vertical_push', 'intermediate', 'Hold a dumbbell in each hand. Bend at your hips to make your back almost parallel to the floor. Let your arms hang down. Keep your arms in line with your shoulders. bend and lift your elbows out to th', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell close grip bench press', 'dumbbell', 'isolation', 'intermediate', 'Lie down with your back on a flat bench. Hold a dumbbell in each hand. Raise your arms towards the ceiling with your palms facing each other and dumbbells pressed together.

Slowly lower the dumbbells', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Snach', 'barbell', 'vertical_push', 'intermediate', 'Stand with your feet at hip width and your shins against the bar. Grasp the bar at double shoulder width and, keeping your lower back flat, drive your heels into the floor to begin lifting the bar. Wh', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell upright-row', 'dumbbell', 'isolation', 'intermediate', 'Hold a dumbbell in each hand in front of your body. Keep your palms towards your body. Lift you hands straight up until your hands are under your chin, then lower them. Repeat the exercise.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Crunches With Cable', 'bodyweight', 'isolation', 'intermediate', 'Take the cable on your hands and hold it next to your temples. Knee down and hold your upper body straight and bend forward. Go down with a fast movement, rolling your back in (your ellbows point to y', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Triceps stretch left', 'bodyweight', 'isolation', 'intermediate', 'Put your right hand on your back, use your left hand to grab your right elbow and gently pull it. Hold this position for a few seconds.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Cable Rows', 'bodyweight', 'horizontal_pull', 'intermediate', '“Stay leaned forward - tuck elbows in on the negative”', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Triceps stretch right', 'bodyweight', 'isolation', 'intermediate', 'Put your right hand on your back, use your left hand to grab your right elbow and gently pull it. Hold this position for a few seconds.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Standing biceps stretch left', 'bodyweight', 'isolation', 'intermediate', 'Stand with your left arm close to a wall. Extend your left arm and put your left hand on the wall, then gently turn your body to the right.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Triceps Extensions on Cable', 'bodyweight', 'isolation', 'intermediate', 'Grab the cable, stand with your feet shoulder wide, keep your back straight and lean forward a little. Push the bar down, making sure the elbows don''t move during the exercise. Rotate your hands outwa', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Standing biceps stretch right', 'bodyweight', 'isolation', 'intermediate', 'Stand with your right arm close to a wall. Extend your right arm and put your left hand on the wall, then gently turn your body to the right.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Single-leg Hip Thrust', 'barbell', 'squat', 'intermediate', 'The single-leg hip thrust is performed by placing your upper back on a weight bench, raising one leg, and extending the hip of the other leg to achieve an isolated contraction of the glute.

By workin', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Remo alto polea alta', 'barbell', 'horizontal_pull', 'intermediate', 'High pulley row with support using a single grip', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wall Squat', 'bodyweight', 'squat', 'intermediate', 'Find a nice flat piece of wall and stand with your back leaning against the wall. Slowly slide down the wall while moving your feet away from it, until your thighs are parallel to the ground and both ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Frog stand', 'bodyweight', 'isolation', 'intermediate', 'Starting position:

Stand with your feet shoulder-width apart and your toes pointing forward, facing a wall or bench for support if needed.
Bend your knees into a squat position.
Place your hands on t', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Standing Calf Stretch', 'bodyweight', 'squat', 'intermediate', 'This stretch targets the gastrocnemius (the chief muscle of the calf of the leg, which flexes the knee and foot). It is easy to perform anywhere. All you need is a wall or a chair.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Standing Soleus Stretch', 'bodyweight', 'squat', 'intermediate', 'This stretch targets the Soleus part of your calf. It may be performed with a wall or chair.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Exercise Band Dorsiflexion', 'bodyweight', 'squat', 'intermediate', 'This exercise uses an exercise band. It targets the Soleus and Tibialis anterior.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Exercise Band Plantarflexion', 'bodyweight', 'squat', 'intermediate', 'Banded plantarflexion is a great way to bridge the gap between plantarflexion range of motion and the more strenuous calf raises in weight bearing. This can help strengthen the calf muscles, load the ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Double Leg Calf Raise', 'bodyweight', 'squat', 'intermediate', 'The double leg heel raise is important to strengthen and create control and stability around the ankle and knee, and provide balance and control for the hip and pelvis.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Yoga exercise: Cow-cat', 'bodyweight', 'horizontal_pull', 'intermediate', 'First get into the four-footed stance. The hands are underneath the shoulders. The fingers are fanned out wide and ensure a stable stance. It is best to rest your front body weight on your thumbs and ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front Lever', 'bodyweight', 'isolation', 'intermediate', 'The front lever is a figure where the body is kept in a horizontal position parallel to the floor.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Ice Scream maker', 'bodyweight', 'isolation', 'intermediate', 'From the final phase of a pull-up, we push ourselves back with our shoulders until we reach the front lever position. From there, we pull ourselves back up to the starting position.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front lever pull-up', 'bodyweight', 'isolation', 'intermediate', 'in the front lever position, with legs extended or easier if collected, pull by bringing the chest closer to the bar.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front lever tuck', 'bodyweight', 'horizontal_pull', 'intermediate', 'The muscles involved in the Front Lever, most subjected to stress, are mainly the extensors such as: the latissimus dorsi, the teres major, the posterior deltoid and the long head of the biceps.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable External Rotation', 'bodyweight', 'vertical_push', 'intermediate', 'Steps:

Start off placing an extension band around a post or in a secure position where it will not release and is at elbow level.
Position yourself to the side of the band and with your hand that is ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Concentration Curl', 'dumbbell', 'isolation', 'intermediate', 'Sit on bench. Grasp dumbbell between feet. Place back of upper arm to inner thigh. Lean into leg to raise elbow slightly.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Low Pulley Cable fFly', 'bodyweight', 'horizontal_push', 'intermediate', 'Adjust the cable machine: Set the pulley to the lowest setting possible.
Choose your handles: You can use neutral grip handles (palms facing each other) or straight handles depending on your preferenc', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pullover', 'dumbbell', 'horizontal_pull', 'intermediate', 'Doubling as a back and chest exercise, the Dumbbell Pullover can train both your pecs and lats.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Sitting Calf Stretch (Dorsiflexion)', 'bodyweight', 'squat', 'intermediate', 'This is a light stretch for the calf that is great for rehab.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Dumbbell Press', 'dumbbell', 'horizontal_push', 'intermediate', 'The incline dumbbell press is a mixture of the dumbbell chest press and the shoulder press, and both the front deltoids and the upper portions of the chest muscles are worked in this exercise.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Chest Press', 'bodyweight', 'horizontal_push', 'intermediate', 'The dumbbell chest press is a pressing exercise similar to the barbell bench press, except that it is performed with dumbbells.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Biceps Close Grip Pull Down', 'bodyweight', 'isolation', 'intermediate', 'On a lat pull down machine, hold the bar keeping your hands relatively close. Use an underhand grip (I.E.: the back of your hand must be facing the machine). Then pull down the bar in a straight line ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Isometria trazioni impugnatura inversa', 'bodyweight', 'horizontal_pull', 'intermediate', 'Trazioni in isometria con impugnatura inversa', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Chest-Supported Dumbbell Row', 'bodyweight', 'horizontal_pull', 'intermediate', 'Set up an adjustable bench at a 45-degree angle.
    Lay on your stomach with your head hanging just above the edge of the bench.
    Grab a dumbbell in each hand and set up with a good posture – core', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pseudo Planche Push-up', 'bodyweight', 'vertical_push', 'intermediate', 'You should have the shoulder line in front of your wrists an perform a push-up, maintaining the shoulder in the same position', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dynamic Planche', 'bodyweight', 'isolation', 'intermediate', 'Start in a plank position, with your hands directly under your shoulders and your feet hip-width apart.Engage your core to keep your body in a straight line from head to toe.From this position, bend y', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reach ups', 'bodyweight', 'isolation', 'intermediate', 'Pour effectuer cet exercice, allongez-vous sur le dos, bras étendus au-dessus de la tête. Ensuite, contractez vos abdominaux et soulevez votre torse du sol en tendant les bras vers le plafond pour "at', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Planche de cote dynamique', 'bodyweight', 'isolation', 'intermediate', 'La planche latérale dynamique implique de se placer sur le côté, en appui sur un coude et le côté du pied, puis de basculer les hanches de haut en bas tout en maintenant une ligne droite du corps.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Dumbbell Curls', 'dumbbell', 'isolation', 'intermediate', 'Seated Dumbbell Curls are an effective bicep workout that isolates the muscles by stabilizing the upper body, reducing momentum that can detract from the exercise’s effectiveness. This exercise is per', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Grip Barbell Curls', 'barbell', 'isolation', 'intermediate', 'Hold the barbell with an overhand grip (palms facing down) approximately shoulder-width apart. Ensure your back is straight, shoulders slightly pulled back, and arms fully extended.
Curl the barbell u', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Trazioni impugnatura inversa', 'bodyweight', 'isolation', 'intermediate', 'Trazioni alla sbarra con i i pollici rivolti verso l''esterno', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'One armed push-ups', 'bodyweight', 'isolation', 'intermediate', 'Perform push-ups with one hand, alternating the sides', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Arco femorale una gamba', 'bodyweight', 'horizontal_pull', 'intermediate', 'Nello specifico i muscoli coinvolti sono: bicipite femorale. muscolo semimembranoso. muscolo semitendinoso.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Helms Row', 'dumbbell', 'horizontal_pull', 'intermediate', 'Setup: Place your chest on the end of a bench, using a towel or anything soft to keep your chest protected. You want your chest to be in contact with the bench around the nipple line. Your back should', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Triceps Press', 'bodyweight', 'isolation', 'intermediate', 'A single arm exercise that starts with the hand close to the chest with with the elbows bent, and the elbow flared out. Press forward and down against the cable straightening the elbow.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front Plank', 'bodyweight', 'isolation', 'intermediate', 'The plank is a bodyweight exercise. As a multi-functional movement, the plank not only targets your abdominal muscles but also the spine and hip. Plank strengthens and tightens your entire body, impro', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lying Leg Raise', 'bodyweight', 'isolation', 'intermediate', 'Leg raise is one of the most effective exercises for the lower abdominal muscles. Although this exercise targets the rectus abdominus and oblique muscles, it is particularly useful for burning and tig', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Crunches HD', 'bodyweight', 'isolation', 'intermediate', 'Crunch movement is one of the most basic exercises designed to strengthen the core muscles of the body. Exercise helps to strengthen core muscles, improve posture, and increase muscle mobility and fle', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bench Dips On Floor HD', 'bodyweight', 'isolation', 'intermediate', 'Triceps dips on floor are a compound exercise as they worked multiple muscle groups simultaneously. Although this bodyweight exercise mainly targets the triceps, it also hits your chest and front of y', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bodyweight lunge HD', 'bodyweight', 'squat', 'intermediate', 'Bodyweight lunges are an effective calisthenic exercise for 
strengthening the lower body, improving balance and stability, and 
developing functional strength. They are a popular choice for bodyweigh', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lateral Push Off', 'bodyweight', 'squat', 'intermediate', 'Push off the ground and land on one leg and regain balance before jumping to the other leg', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'One Arm Overhead Cable Tricep Extension', 'bands', 'isolation', 'intermediate', 'Set the pulley at the bottom of the cable machine and grab onto it without using any attachments. Extend the cable directly overhead.While keeping your back straight and upper arm stationary, lower th', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Hip Abduction', 'bodyweight', 'squat', 'intermediate', 'Starting Position:Adjust the seat height so that your knees are aligned with the pivot point of the machine.Sit with your back flat against the backrest, maintaining good posture.Place the outside of ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Romanian Deadlifts', 'dumbbell', 'squat', 'intermediate', 'Stand with your feet shoulder-width apart and hold a dumbbell with both hands.With your eyes facing forward, lift the dumbbells and place them at pelvic level (At this time, do not bend your arm).With', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Push-Ups', 'bodyweight', 'horizontal_push', 'intermediate', '1.&nbsp;Hands shoulder-width on the floor, fingers 
forward; feet together or hip-width; body in a straight line from head 
to heels; engage core and glutes.2.&nbsp;Inhale and bend elbows, keeping the', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Triceps Overhead (Dumbbell)', 'dumbbell', 'isolation', 'intermediate', 'Ellbogen fixierenMuskulatur anspannenKein Schwung holenKontrollierte BewegungLangsame BewegungImmer angewinkelt lassenNicht überdehnen', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder Press (Dumbbell)', 'dumbbell', 'isolation', 'intermediate', 'Muskulatur anspannenKein Schwung holenKontrollierte BewegungLangsame BewegungImmer angewinkelt lassenNicht überdehnen', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Schoulder Raise (Dumbbell)', 'dumbbell', 'vertical_push', 'intermediate', 'Muskulatur anspannenKein Schwung holenKontrollierte BewegungLangsame BewegungImmer angewinkelt lassenNicht überdehnen', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wall Angels', 'bodyweight', 'vertical_push', 'intermediate', 'The Wall Angels exercise primarily targets the upper back and shoulder muscles, helping improve posture, shoulder mobility, and scapular control.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'seated figure four', 'bodyweight', 'squat', 'intermediate', 'Seat on&nbsp; a bench. Feet flat on the ground. Place your left ankle over your right knee. Your right knee stays flat. Keep your back straight. Gently push your left knee down.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Thruster', 'barbell', 'squat', 'intermediate', 'Start by doing a front squat
At the top position, push the bar above your head (similar to a press)
Lower the bar to the shoulders', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Thruster', 'dumbbell', 'squat', 'intermediate', 'Start with the dumbbells resting on your shoulders and squat down. Push 
into standing and raise the dumbbells into an overhead position. Bring 
the dumbbells back to your shoulders and repeat.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Glute Bridge Single-Arm Press', 'dumbbell', 'isolation', 'intermediate', 'With one dumbbell in hand, perform a glute bridge. Now hold the dumbbell above your chest, this is the rep starting position.&nbsp;Lower the dumbbell so that your elbow touches the floor or is roughly', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bear crawl pull through', 'dumbbell', 'isolation', 'intermediate', 'Place a dumbbell at around hip level and assume a bear crawl position. Push the knees off the floor and hold.With the opposite hand reach for the dumbbell and pull it to the other side. Place your han', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Double Kettlebell Clean and Press', 'dumbbell', 'isolation', 'intermediate', 'Full-body muscles building exercise.&nbsp;This exercise provides a huge range of benefits in terms of strength &amp; size and is extremely functional.&nbsp;', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Double Kettlebell Front Squat', 'dumbbell', 'squat', 'intermediate', 'The kettlebell front squat is a compound, multi-joint exercise that works several muscle groups.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single Leg RDL', 'bodyweight', 'squat', 'intermediate', 'Stand with your feet hip-width apart, shift your weight onto one leg and slightly bend the other. Keep your back straight while hinging at your hips. Use your hamstring to pull yourself back up.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Triceps Dips (Assisted)', 'bodyweight', 'isolation', 'intermediate', 'Assisted triceps dips&nbsp;&nbsp;is a gym work out exercise that targets triceps and also involves chest.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Rotary Torso Machine', 'bodyweight', 'isolation', 'intermediate', '- Slow and Steady
- Not too much weight', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Lateral Raises (Single Arm)', 'bodyweight', 'vertical_push', 'intermediate', 'The single arm cable lateral raise is a variation of the lateral raise and an exercise used to build the muscles of the shoulders.
Position a cable at the lowest position possible and attach a single ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Upper Back', 'bodyweight', 'horizontal_pull', 'intermediate', 'Upper Back is suitable for building up the core muscles with a special focus on the deltoid and rhomboid muscles and the upper back muscles', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pullover Machine', 'bodyweight', 'horizontal_pull', 'intermediate', 'Pullover machine, sitting, elbows on pads', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hamstring Kicks', 'bodyweight', 'squat', 'intermediate', 'Stand with your feet hip-width apart and extend one arm in front of you. Swing that leg up in front of you and back down while keeping your leg as straight as possible and your toes pointed up.Repeat ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Toe Touch', 'bodyweight', 'squat', 'intermediate', 'Stand with your feet closer together. Hinge at your hips and lower your upper body towards your toes. Reach your hands towards your feet, try to touch your toes, the ground, or as far down your legs a', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Elephant Walks', 'bodyweight', 'squat', 'intermediate', 'Hinge at your hips until you feel a stretch behind your knees. Bend one leg while the other is straight then fluidly bend the other knee while straightening the first knee.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single Leg Hamstring Stretch', 'bodyweight', 'squat', 'intermediate', 'Sit on the ground with one leg straight out in front of you and the other leg bent in toward you. Reach forward with both hands, trying to touch the toes of your straight leg.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Sit & Reach', 'bodyweight', 'horizontal_pull', 'intermediate', 'Sit on the ground with your legs extended straight in front of you. Reach both hands forward, trying to reach past your toes or as far as you can go. Return to the starting position and repeat.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Crossbody Leg Swings', 'bodyweight', 'squat', 'intermediate', 'Hold onto a wall or something near you for support. Swing one leg across the front of your body, then back and out to the side. Repeat while slowly increasing your range of motion.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Standing Pancake', 'bodyweight', 'squat', 'intermediate', 'Stand and open your legs as wide as possible into a straddle position. Then bend at the hips, pushing them back while keeping your back straight.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hamstring Chokes', 'bodyweight', 'squat', 'intermediate', 'Sit on the ground and bend one leg, bringing your knee toward you. Place your hand behind your hamstring and gently pull your leg toward your chest, feeling a stretch in the back of your thigh. Straig', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Crossbody Hamstring Stretch', 'bodyweight', 'squat', 'intermediate', 'While standing, cross one leg behind the other (keep this leg straight). Reach downward and try to touch the toes of that leg. Slightly bend the other leg so that you can bend down.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Kickstand RDL', 'barbell', 'squat', 'intermediate', 'use non-working leg''s toes to help with balance and perform an RDL.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Plank-to-Elbow Extension', 'bodyweight', 'isolation', 'intermediate', 'The Plank-to-Elbow Extension is a dynamic exercise that combines the plank with an elbow extension movement', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cossack squat', 'bodyweight', 'squat', 'intermediate', 'The Cossack Squat is a multi-joint exercise that works mainly on the legs and buttocks, but also involves stabilizing muscles. It is an excellent exercise for improving strength, mobility and stabilit', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wall-sit', 'bodyweight', 'squat', 'intermediate', 'The Wall Sit (or wall chair) is an isometric exercise that mainly involves the leg muscles, improving muscular endurance and stability. Here are the main and secondary muscles activated during the exe', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dragon-flag', 'bodyweight', 'isolation', 'intermediate', 'Keep your body completely rigid throughout the movement, avoiding sagging in your lower back.
Use a firm grip to stabilize your upper body.
Start with simpler versions (such as with bent knees) to bui', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Plank with Alternating Leg Lift', 'bodyweight', 'squat', 'intermediate', 'In a plank position, lift one leg alternately.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Heel Touches', 'bodyweight', 'isolation', 'intermediate', 'Starting Position:Lie on your back on an exercise mat.Bend your knees, keeping your feet flat on the floor and hip-width apart.Place your arms along your sides, palms facing inward, just off the floor', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'bicycle crunches', 'bodyweight', 'isolation', 'intermediate', 'Bicycle crunches are a core exercise performed on the floor. Lie on your back with your hands behind your head and legs extended. Lift your shoulders off the ground, bring one knee toward your chest, ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hack Squats', 'bodyweight', 'squat', 'intermediate', 'Hack squats target the lower body and are performed on a hack squat machine or with a barbell. For the machine variation, position yourself on the platform with your shoulders under the pads and feet ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Crunches', 'dumbbell', 'isolation', 'intermediate', 'Dumbbell crunches are a weighted variation of traditional crunches designed to target the abdominal muscles more intensely. Lie flat on your back with your knees bent and feet flat on the floor. Hold ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Biceps Curl Machine', 'bodyweight', 'isolation', 'intermediate', 'The biceps curl machine is designed to isolate the biceps muscles and provide a controlled range of motion. Sit on the machine with your back against the pad and adjust the seat so your arms are align', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Toe Taps', 'bodyweight', 'isolation', 'intermediate', 'Toe taps are a core-focused exercise performed lying on your back. Lie flat with your arms by your sides and your legs raised to a tabletop position (knees bent at 90 degrees). Slowly lower one foot t', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Standing Side Crunches', 'bodyweight', 'isolation', 'intermediate', 'Standing side crunches are a dynamic exercise that targets the obliques while improving balance and stability. Stand upright with your feet shoulder-width apart and hands behind your head or holding a', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Shoulder Rotations', 'dumbbell', 'vertical_push', 'intermediate', 'Dumbbell shoulder rotations are designed to strengthen the rotator cuff muscles and improve shoulder stability and mobility.External Rotation: Hold a dumbbell in one hand, keeping your elbow bent at 9', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Plate Pinch Hold', 'bodyweight', 'isolation', 'intermediate', 'The plate pinch hold is a grip strength exercise designed to target the forearms and improve grip endurance. Select one or two weight plates (smooth-edged plates work best) and pinch them together bet', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Wood Chops', 'bodyweight', 'horizontal_pull', 'intermediate', 'Attach a looping resistance band to a rack below knee heightGrip the other end of the band like holding a baseball bat with both handsStretch the band facing itStart with your hands at the side of you', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lat Pull DB', 'dumbbell', 'horizontal_pull', 'intermediate', 'Bend upper body forwardMove dumbbells near your body with slightly bent arms towards your back', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Scapula Pulls', 'bodyweight', 'horizontal_pull', 'intermediate', 'Hang straight on a pull-up barPull shoulder blades together, moving the body slightly up', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pin Bench Press BB', 'barbell', 'horizontal_push', 'intermediate', 'Set security pins to about the height of your sticking pointLower the bar, rest on the pins for 1s while holding tensionMove bar up with maximum force', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pin Squat', 'barbell', 'squat', 'intermediate', 'Set security pins to about the height of your sticking pointLower the bar, rest on the pins for 2s keeping tensionStand up with maximum force', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Clean', 'barbell', 'squat', 'intermediate', 'Regular olympic lift clean.
Pull bar from ground, catch on shoulders performing a front squat.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pin OHP', 'barbell', 'vertical_push', 'intermediate', 'Set security pins to the height of your lower chinRest bar on pins keeping tensionRaise bar over head', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Push OHP', 'barbell', 'vertical_push', 'intermediate', 'Rest bar in front on your shouldersBend knees while keeping upper body straightExtend legs pushing the bar overhead with force', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline OHP DB', 'dumbbell', 'vertical_push', 'intermediate', 'Sit on a bench with 45° inclineEllbows 45° outMove dumbbells down until upper arms are parallel to shouldersMove dumbbells up, meeting overhead', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Kreis Press DB', 'dumbbell', 'vertical_push', 'intermediate', 'Sit on a bench with 45° inclineHold dumbbells overheadMove dumbbells down as if doing overhead pressRotate dumbbells palms facing up and extend your arms in front of your bodyMove hands together until', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder Raise Side and Front DB', 'dumbbell', 'vertical_push', 'intermediate', 'Stand while holding dumbbells beside bodyKeep arms almost fully extendedWithout momentum raise dumbbells to the side of your body until shoulder height, palms facing downLower dumbbells beside body, p', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Chest Press DB', 'dumbbell', 'horizontal_push', 'intermediate', 'Bench 45° inclineHold dumbbells parallel on your chestPress up until arms extended', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Jerk OL', 'barbell', 'vertical_push', 'intermediate', 'Olympic lift jerk
Hold bar in front on shoulders like push pressBend and extend knees pushing bar up while diving under the barCatch bar overhead with straight arms using lungeMove feet parallel while', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Clean and Jerk OL', 'barbell', 'vertical_push', 'intermediate', 'Olympic lift clean and jerk.
Combination of clean and jerk in one motion.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Snatch OL', 'barbell', 'horizontal_pull', 'intermediate', 'Olympic lift snatch
Pull barbell from ground to overhead lockout using a wide grip and overhead squat.Move bar slowly until cleared knees then explosively extend hips, pull bar up and dive under the b', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated W Curl', 'bodyweight', 'isolation', 'intermediate', 'Sit on bench with 60° inclineHold dumbbells beside body near the ground, palms facing outwards, arms fully extendedMove dumbbells up using only biceps and without momentum', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cobra Stretch', 'bodyweight', 'horizontal_pull', 'intermediate', 'The Cobra Stretch is a back extension exercise that helps improve spinal flexibility and relieve lower back tension. To perform, lie face down on the floor with your hands placed under your shoulders.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Torso rotation strech', 'bodyweight', 'horizontal_push', 'intermediate', 'The torso rotation stretch helps improve spinal mobility and relieves tension in the lower back and obliques. It can be performed standing or seated.Standing Variation: Stand upright with your feet sh', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Knee to Chest Stretch', 'bodyweight', 'squat', 'intermediate', 'The knee to chest stretch is a simple yet effective exercise for relieving lower back tension and improving hip mobility. To perform, lie flat on your back with your legs extended. Bring one knee towa', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Towel Superman', 'bodyweight', 'horizontal_pull', 'intermediate', 'In this exercise, you lie flat on your stomach, hold a 
towel with your arms extended in front of you, and pull it apart to 
create tension. Then, you move it forward and back under your stomach. 
Thi', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Press Around', 'bodyweight', 'horizontal_push', 'intermediate', 'Set the cable pulley at chest height and attach a D-handle bar. Grab 
the handle with a neutral grip and hold it next to your chest with your 
elbow fully flexed and tight to your side. Turn away from', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cross-Body Cable Y-Raise', 'bodyweight', 'horizontal_pull', 'intermediate', 'Attach a D-Bar to the cable machine. Perform a motion akin to drawing a sword from across your body.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'No Leg Drive Dumbbell Chest Press', 'bodyweight', 'horizontal_push', 'intermediate', 'Set up for a normal Dumbbell chest press but lift your leg ups straight or put them on another bench to remove the leg drive.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'punches', 'bodyweight', 'isolation', 'intermediate', 'stand stable and throw normal straight punches', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Underhand Dead Row', 'dumbbell', 'isolation', 'intermediate', 'The Dumbbell Underhand Dead Row will involve the back, which means you can try a bit heavier weight. The catch is that you need to be able to control the weight for all the reps.Start by holding a pai', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pause Hack Squats', 'bodyweight', 'squat', 'intermediate', 'Hack Squats but with a 1-2s pause at the bottom of the movement. This makes sure that there is no more elastic energy stored in the muscles.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Calf Raise using Hack Squat Machine', 'bodyweight', 'squat', 'intermediate', 'Ideally using a trapeze addon, Lift the weight up using your calves by getting on your toes.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Close Grip Barbell Bench Press', 'barbell', 'isolation', 'intermediate', 'Narrower grip than regular bench press, just outside shoulder width.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Floor Skull Crusher', 'barbell', 'isolation', 'intermediate', 'Allowing you to safely load more weight than a regular skull crusher, lie on the floor and rest the weight on the floor in between each repetition.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bent over Cable Flye', 'bodyweight', 'horizontal_push', 'intermediate', 'Holding your upper body at an approximate 105° angle.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Shrug-In', 'bodyweight', 'vertical_push', 'intermediate', 'Attach two D-Handles to two low cables and shrug in using your upper traps.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Cable Flye', 'bodyweight', 'horizontal_pull', 'intermediate', 'Attach D-Handles to two cable pulleys in the upper position. Grab the left on with your right hand and vice-versa.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'W-Raise', 'bodyweight', 'isolation', 'intermediate', 'This challenging exercise is a variation of reverse crunches that is made up of three parts in which we’re basically drawing an upside down ‘W’ with our legs.

Start position is lying face up flat on ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Black Widow Knee Slides', 'bodyweight', 'isolation', 'intermediate', 'In
this bottom-up rotation exercise movement, you’ll cross your knee over and
drive it into that opposite elbow. Start in high plank position (or tabletop
position) with hands directly beneath your sh', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Butterfly Sit Up', 'bodyweight', 'isolation', 'intermediate', 'In
this midrange exercise your arm muscles provide you with a little bit of
momentum to help to get you off the ground. You also open them up in overhead
position which engages the upper back. Start
l', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Corkscrew', 'bodyweight', 'isolation', 'intermediate', 'To
do this abs and obliques exercise, start with your hands back behind your body
and bring your knees in and across, really trying to contract the obliques.
Then extend your legs back out to starting', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Levitation Crunch', 'bodyweight', 'isolation', 'intermediate', 'For
this top down movement, we’re trying to move the upper torso without moving the
lower torso. Start lying on the ground with feet flat on the floor and crossed
arms above your head with hands behin', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Sit Up Elbow Thrust', 'bodyweight', 'isolation', 'intermediate', 'This
is a top down rotation movement, and it’s a bit more
explosive, too.

Lying with knees bent and feet on the floor, sit up and then drive your left elbow across your entire body toward the right, ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lying Triceps Extensions', 'barbell', 'isolation', 'intermediate', 'Starting position for this
     practical triceps exercise is lying on a standard bench holding a barbell or two dumbbells in both hands with an overhand grip, hands at shoulder width apart.
 Begin wi', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Drag Pushdown', 'barbell', 'isolation', 'intermediate', 'Starting
     position for this rope pushdown is standing facing a cable machine with
     the handles of a rope attachment in both hands and feet shoulder width
     apart.
 Hinge
     forward slight', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Cheat Curl', 'dumbbell', 'isolation', 'intermediate', 'Starting position is standing
     with feet shoulder width apart.
 Hands should take an underhand
     or supinated grip on the dumbbells holding them with hands shoulder
     width apart.
 Keeping e', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bizeps Curls Trifecta', 'dumbbell', 'isolation', 'intermediate', 'This exercise is a mixture of three different curls: the Supinated Cross Body Curl, the Pronated Cross Body Curl and the No Money Curl. You
alternate between three curl variations that each accomplish', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Omni Cable Cross-over', 'barbell', 'horizontal_push', 'intermediate', 'Adjust the weights based on the
     motion. When pulling from top to bottom, increase the weight by 20% to 40%
     more than the bottom-to-top motion. This accounts for the fact that when
     opera', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Rocking Triceps Pushdown', 'barbell', 'isolation', 'intermediate', 'Set your feet below the rope and lean your upper body towards the rope. Set one foot back. Push down the rope and lean your entire body back onto the rear foot as you push down to get your hands behin', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Alternating High Cable Row', 'bodyweight', 'horizontal_pull', 'intermediate', 'Start
     by putting the attachment in a high position on the cable station and step back about 1m from the attachment. Grab
     the cable pulley handle in your left hand at about head height with y', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hyper Y W Combo', 'bodyweight', 'horizontal_pull', 'intermediate', 'Use a glute-ham raise or a
     stability ball for this exercise and a light weight plate in each hand.
 Raise your torso to form a straight line with your legs and raise the
     arms outward slightl', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Plank Jacks', 'bodyweight', 'isolation', 'intermediate', 'Jumping jacks from the plank position.&nbsp;', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lying Triceps Kickback', 'dumbbell', 'isolation', 'intermediate', 'Set the bench to an 60deg angle. Stand still and rest your upper body on the inclined bench, ensuring a nearly straight line of your entire body. Squeeze your shoulder blades together, so that your el', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Remada unilateral no cabo', 'bodyweight', 'horizontal_pull', 'intermediate', 'pegada neutra&nbsp;A remada unilateral, também conhecida como remada serrote, é um exercício que&nbsp;fortalece as costas e os bíceps, além de melhorar a postura.&nbsp;', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'High Row', 'bodyweight', 'horizontal_pull', 'intermediate', 'Kneeling down on one leg and pulling cable down while driving elbow into the lats.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'DB Upper Chest Variation', 'dumbbell', 'horizontal_push', 'intermediate', 'Dumbbell in hand in a curl fashion, lean body into the arm to help the dumbbell up above the chest, next to the head, to activate chest and delt combo', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'DB Underhand bench press', 'bodyweight', 'horizontal_push', 'intermediate', 'Underhand grip DB, perform a normal bench press movement, keeping the elbows close to the chest', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Elbows Tucked DB Bench Press', 'bodyweight', 'isolation', 'intermediate', 'Elbows Tucked DB Bench Press, chest press movement focusing on the triceps. DB stays parallel with body', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'DB Skull Crushers', 'dumbbell', 'isolation', 'intermediate', 'Alike tricpes extensions, DBs fall down near the head and pushed back up. Unlike for the triceps extension tring to extend the arms as far back', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Alternative DB Gorilla rows', 'dumbbell', 'horizontal_pull', 'intermediate', 'Slightly bent down and knees to mimic a gorilla position and pull/row up the DBs to the chest. DB stay straight (thumbs pointing up)', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'DB Cross Body Hammer Curls', 'dumbbell', 'isolation', 'intermediate', 'Dumbbell cross body biceps curls, works on the braccialis', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Frog Press', 'dumbbell', 'squat', 'intermediate', 'Similar to hip thrust, but with feet put up together, lifting the butt off the ground in a frog like position.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbel Bradford press', 'dumbbell', 'vertical_push', 'intermediate', 'From a front hold of the DBs in a OHP, press above the head, bring back towards the rear of the shoulders, down, and press back forward.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Alternating dumbbell hammer curl', 'dumbbell', 'isolation', 'intermediate', 'Stand with your knees slightly bent and your back straight. Hold a dumbbell in each hand, using a neutral grip at your sides.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Fly Middle Chest', 'bodyweight', 'horizontal_push', 'intermediate', 'ExecutionStart position:&nbsp;Arms extended out to your sides (a big “T” shape), feeling a stretch in your chest.Movement:&nbsp;Bring your hands together in front of your chest in a&nbsp;wide hugging ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Fly Upper Chest', 'bodyweight', 'horizontal_push', 'intermediate', 'ExecutionStart position:Arms down and slightly behind your body, elbows slightly bent.Feel a light stretch across your chest.Movement:Bring your hands&nbsp;upward and together&nbsp;in front of your up', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'High-Incline Smith Machine Press', 'bodyweight', 'horizontal_push', 'intermediate', 'Set the bench to a 45-60° incline. Touch the upper chest with the bar.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Neutral Grip Lat Pulldown', 'bodyweight', 'horizontal_pull', 'intermediate', 'Lat pull downs with a neutral grip on the bar.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Kong Curl', 'dumbbell', 'isolation', 'intermediate', 'This exercise is somewhat similar to a cable curl and a cable crossover. But instead of a chest/biceps exercise, this exercise targets the brachialis muscle, responsible for that broad arm when viewed', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Drop Curl', 'dumbbell', 'isolation', 'intermediate', 'Drop curls in a modified position at a slow pace effectively engage the brachialis for arm width.

Starting position is with both arms in a slight angle towards each other at chest height with a dumbb', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lateral Walk', 'bodyweight', 'horizontal_pull', 'intermediate', 'Lateral walks, also known as side steps or squat walks, are a type of exercise where you move sideways in a squatting position. They can be performed with or without resistance bands. These exercises ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Press Toe Press', 'bodyweight', 'squat', 'intermediate', 'Move the leg press&nbsp;using your calves by placing your feet at the bottom of the platform.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Handstand', 'bodyweight', 'vertical_push', 'intermediate', 'Handstand free standing by pressing arms into the ground and contracting core and glutes', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Fly Lower Chest', 'bodyweight', 'horizontal_push', 'intermediate', 'ExecutionStart position:Arms extended out to your sides in a “Y” shape.Feel a stretch in your chest (slight bend in elbows — don’t lock them).Movement:Bring your hands&nbsp;downward and together&nbsp;', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Smith Press', 'bodyweight', 'horizontal_push', 'intermediate', 'ExecutionStart position:Unrack the bar and hold it above your upper chest with arms fully extended.Keep your shoulder blades&nbsp;retracted and pressed into the bench.Lowering phase (eccentric):Slowly', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Overhead Triceps Extension', 'barbell', 'isolation', 'intermediate', 'Overhead Triceps Extension with EZ Bar – Quick GuideThe overhead position emphasizes the long head of the triceps (because it''s stretched under load), the exercise does engage all three triceps heads ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline Static Hold', 'dumbbell', 'horizontal_push', 'intermediate', 'ExecutionHold Position:Lower the dumbbells&nbsp;a few inches above your chest&nbsp;— about the&nbsp;midpoint&nbsp;of a normal incline press.This is where your upper chest is under maximum tension.Stat', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Flat Machine Press', 'bodyweight', 'horizontal_push', 'intermediate', 'ExecutionStart position:Elbows bent at roughly 90°, hands just outside your chest.Keep wrists straight and aligned with your forearms.Pressing phase (concentric):Push the handles forward until your ar', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Glute Drive', 'bodyweight', 'squat', 'intermediate', 'Lie down on the back pad and strap yourself in with the waistband. Position yout feet&nbsp;shoulder-length apart. They should be slightly splayed.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lying Dumbbell Curls', 'bodyweight', 'isolation', 'intermediate', 'Take a
dumbbell in each hand and lie backwards on a bench, similar to a classic chest press.
Let your arms hang down at your sides, with the dumbbells possibly touching the
floor. Now start to lift th', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Curls', 'bodyweight', 'isolation', 'intermediate', 'Bicep Curls using cables. Can be seated or standing', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pull-Ups (Wide Grip)', 'bodyweight', 'horizontal_pull', 'intermediate', 'ExecutionPulling phase (concentric):Drive your&nbsp;elbows down and slightly back, pulling your chest&nbsp;toward the bar.Focus on leading with your&nbsp;chest, not your chin.Keep your&nbsp;shoulders ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell Row (Overhand)', 'barbell', 'horizontal_pull', 'intermediate', 'ExecutionStarting position:Hold the barbell with arms fully extended toward the floor.Maintain tension in your lats and back muscles.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell Row (Underhand)', 'barbell', 'horizontal_pull', 'intermediate', 'ExecutionStarting position:Hold the barbell with arms fully extended toward the floor.Maintain tension in your lats and back muscles.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'lying bicep curl', 'bodyweight', 'isolation', 'intermediate', 'RP fitness bicept curle variant to get a good streach on bicept', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Delt Stretch', 'bodyweight', 'vertical_push', 'intermediate', 'Stretch your deltoids for a certain period of time.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pull-up Isometric Hold', 'bodyweight', 'horizontal_pull', 'intermediate', 'Hold the pull-up movement in any position', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell Romanian Deadlift (RDL)', 'barbell', 'horizontal_pull', 'intermediate', 'ExecutionHinge at the hips:Push your&nbsp;hips backward, keeping a slight bend in the knees (soft knees).Lower the barbell&nbsp;along the front of your thighs/shins&nbsp;while maintaining a&nbsp;neutr', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'One-Arm Heavy Row', 'dumbbell', 'horizontal_pull', 'intermediate', 'ExecutionRowing phase (concentric):Pull the dumbbell&nbsp;toward your lower chest or waist, leading with your&nbsp;elbow.Keep your torso&nbsp;stable&nbsp;— avoid twisting or rotating your shoulders.Pa', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Patadas traseras', 'bodyweight', 'isolation', 'intermediate', 'The dumbbell kickback is a popular strength training exercise that targets the triceps muscles in the back of your upper arms. It helps strengthen and tone the triceps, contributing to overall arm str', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wide Pull Up', 'bodyweight', 'horizontal_pull', 'intermediate', 'The grip width for a wide grip pull-up is typically wider than 
shoulder-width apart, which means your hands will be positioned farther 
apart than they would be for a standard pull-up. This wider gri', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Tuck L-sit', 'bodyweight', 'isolation', 'intermediate', 'The tuck L-sit is a bodyweight hold where you support yourself on parallel bars, parallettes, or the floor with straight arms while pulling your knees toward your chest. Your hips stay lifted, your sp', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Archer Pull Up', 'bodyweight', 'horizontal_pull', 'intermediate', 'An archer pull-up is an advanced bodyweight exercise that strengthens your back and biceps, serving as a progression towards a one-arm pull-up. It gets its name from the "bow-drawing" position your bo', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Larsen Press', 'barbell', 'horizontal_push', 'intermediate', 'Put your legs up on a separate Bench and press with no leg drive', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bulgarian Squat with Dumbbells', 'dumbbell', 'squat', 'intermediate', 'The Bulgarian split squat consists of performing a squat on one leg with the rear foot resting on a raised platform. Elevating your back leg on a bench creates instability and increases the range of m', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Butchers Block Stretch', 'bodyweight', 'vertical_push', 'intermediate', 'Kneel down with the hands togetherRest the elbows on a bench in front of you and lower the chest down  Keep the elbows bent with good posture and hold', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Clap Push-UP', 'bodyweight', 'horizontal_push', 'intermediate', 'The clap push-up is an explosive upper body movement that builds power and fast-twitch muscle strength. It adds a plyometric challenge to the traditional push-up by requiring the hands to leave the gr', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Sleeper Stretch', 'bodyweight', 'vertical_push', 'intermediate', 'Lie on your side so that you are resting a little weight on your shoulder blade to keep it stillExtend your arm to 90 degrees in front of you, resting on the floor/matLift your hand with your elbow so', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Ab wheel', 'bodyweight', 'isolation', 'intermediate', 'Starting Position: Kneel on the floor with the ab wheel in front of you.Grip the Wheel: Hold the handles firmly.Roll Out: Slowly roll the wheel forward, extending your body while keeping your core tig', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Snap Down', 'bodyweight', 'squat', 'intermediate', 'Begin in a standing position with your 
arms up over your head and your toes pushing into the ground raising 
your heels up becoming as tall as you can. From this position, perform a
 small hop with b', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bretzel stretch', 'bodyweight', 'horizontal_pull', 'intermediate', 'How to Perform the Bretzel Stretch&nbsp; &nbsp; Starting Position:&nbsp; &nbsp; &nbsp; &nbsp; Lie on your back on a flat surface, such as a mat.&nbsp; &nbsp; &nbsp; &nbsp; Bend your knees and place yo', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hip hinge', 'barbell', 'squat', 'intermediate', 'Hip Hinge Exercise DescriptionThe hip hinge is a fundamental movement pattern that involves bending at the hips while keeping the spine neutral. It is commonly used in exercises like deadlifts, kettle', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Perpendicular Unilateral Landmine Row', 'barbell', 'vertical_push', 'intermediate', 'Using a landmine attachment with the barbell running at 90 degrees to either side, hinge slightly at the hips and grip the barbell by the plate sleeve. Raise the barbell to chest height, with your upp', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Trap press', 'barbell', 'vertical_push', 'intermediate', 'Laying flat with arm pointing straight upwards, elbow fully extended, use only your shoulder to raise the weight as high as comfortable and back to rest.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Side-laying interior rotation', 'barbell', 'vertical_push', 'intermediate', 'Laying on your side and using the arm closest to the bench, maintain a 90 degree bend at the elbow and allow the weight to fall towards the ground past the bench as low as comfortable. Bring the weigh', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Supine press', 'barbell', 'horizontal_pull', 'intermediate', 'Take a close grip and push perpendicular to the bench. Keep back flat.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Estiramiento de piernas y cadera', 'bodyweight', 'squat', 'intermediate', 'Movimientos suaves para mejorar la flexibilidad de la parte inferior del cuerpo y liberar tensión en la cadera.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Estiramiento de brazos y cuello', 'bodyweight', 'isolation', 'intermediate', 'Alivia tensiones en la parte superior del cuerpo, especialmente útil para personas con trabajo de oficina o posturas prolongadas.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Smith Machine Split Squat', 'barbell', 'squat', 'intermediate', 'The "Smith Machine Split Squat" is a strength exercise 
performed on the Smith machine, ideal for targeting the legs and glutes.
 It involves placing one foot forward and the other back, lowering the ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pull-Ups (Neutral Grip)', 'bodyweight', 'horizontal_pull', 'intermediate', 'ExecutionPulling phase (concentric):Drive your&nbsp;elbows down and back, pulling your&nbsp;chest toward your hands.Keep your shoulders&nbsp;depressed and retracted&nbsp;(avoid shrugging).Focus on squ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Fly Standing', 'bands', 'vertical_push', 'intermediate', 'Stand with a good posture holding a cable in each hand opposite the machineStarting with the hands in front of your chest pull the arms out to 
your side into the shape of a T with the elbows nearly s', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Horizontal Shoulder Flexion Stretch', 'bodyweight', 'vertical_push', 'intermediate', 'Raise your arm out to the side, placing your hand on a wall or doorway beside you at shoulder heightTurn your body away from your arm to stretch the chest, as far as is comfortable', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Jalon caballero unialteral', 'dumbbell', 'horizontal_pull', 'intermediate', 'Pull performed in knight''s stance', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbbell Scaption', 'dumbbell', 'vertical_push', 'intermediate', 'Starting position:Stand upright with your feet shoulder-width apart.Hold a dumbbell in each hand with a neutral grip (palms facing each other).Keep a slight bend in your elbows, shoulders relaxed and ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg curl with elastic', 'bands', 'isolation', 'intermediate', 'Standing position: Place the band under your feet in the middle of your foot and grasp it with a hammer grip.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Sliding Lateral Lunge', 'barbell', 'squat', 'intermediate', 'Stand upright with your feet hip-width apart, holding a kettlebell close to your chest in goblet position. Place one foot on a slider, gliding disc, or towel. Keep your chest tall and core engaged. Sl', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Copenhagen Adduction Exercise', 'bodyweight', 'squat', 'intermediate', 'Lie on your side with the elbow placed directly under the shoulder, similar to a side plank position. Place the upper leg on a bench with the inside of the foot or ankle resting on it. Lift your hips ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Arm Raises (T/Y/I)', 'bodyweight', 'isolation', 'intermediate', 'Stand upright with feet hip-width apart, core engaged, and arms relaxed at your sides. From this position, perform three different arm raises to target the shoulders and upper back:

T Raise: Lift you', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Typewriter Pull-ups', 'bodyweight', 'horizontal_pull', 'intermediate', 'Hang from a pull-up bar with an overhand grip, slightly wider than shoulder-width. Pull yourself up until your chin is above the bar. At the top position, instead of going straight down, shift your bo', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bodyweight Biceps Curl', 'bodyweight', 'isolation', 'intermediate', 'Set up under a straight bar (around waist or chest height). Grip the bar with your palms facing you (supinated grip), hands about shoulder-width apart. Lean back with straight arms so that your body i', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Glute Kickback (Machine)', 'bodyweight', 'squat', 'intermediate', '&nbsp;Drive through your heel, not your toes, to hit the glute.&nbsp;&nbsp;&nbsp;Don’t hyperextend your lower back at the top.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Row (Machine)', 'bodyweight', 'horizontal_pull', 'intermediate', '&nbsp;Keep your chest up and squeeze your shoulder blades at the end.&nbsp;&nbsp;&nbsp;Don’t hunch forward or round your back during the pull.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'kettlebell sumo deadlift', 'dumbbell', 'squat', 'intermediate', 'Place your feet wider than shoulder-width apart, pointing your toes outward.
Keep your back straight, shoulders back, and chest up.
The knees must follow the same direction as the toes and not move fo', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'rubber band glute kickback', 'bands', 'squat', 'intermediate', 'A rubber band glute kickback is an exercise performed on hands and knees, where you anchor a resistance band to your foot and kick your heel back and up, squeezing your glute at the top of the movemen', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Patada de burro con mancuerna', 'dumbbell', 'squat', 'intermediate', 'La patada de burro con mancuerna es un ejercicio efectivo para trabajar los músculos de los glúteos y los isquiotibiales. Este ejercicio se realiza generalmente en una posición de cuatro patas, utiliz', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Crunch en maquina', 'bodyweight', 'isolation', 'intermediate', 'El crunch en máquina es un ejercicio diseñado para trabajar los músculos abdominales, específicamente el recto abdominal. Este ejercicio se realiza en una máquina específica que proporciona soporte y ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Straight-Arm Pulldown (Cable)', 'bodyweight', 'horizontal_pull', 'intermediate', '&nbsp;Keep arms straight but not locked, pulling with your lats, not your shoulders.&nbsp;&nbsp;&nbsp;Don’t let your shoulders shrug up during the movement.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Dumbbell Calf Raise', 'dumbbell', 'isolation', 'intermediate', 'The seated dumbbell calf raise is a targeted exercise for strengthening the lower leg muscles. It follows the same movement pattern as the machine version: you place the weight on your knees, and by e', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Side Straight-Arm Pulldown (Cable)', 'bodyweight', 'horizontal_pull', 'intermediate', 'Keep your torso still, pulling the handle down along your side using the outer lat.&nbsp;&nbsp;&nbsp;Don’t twist your body or rotate your torso to cheat the rep.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder Internal Rotation (Cable)', 'bodyweight', 'vertical_push', 'intermediate', 'Keep your elbow tucked to your side like it''s superglued there.&nbsp;&nbsp;&nbsp;Don’t rotate your torso — only your forearm should move.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shoulder External Rotation (Cable)', 'bodyweight', 'vertical_push', 'intermediate', 'Keep elbow fixed at your side and rotate forearm outward smoothly.&nbsp;&nbsp;&nbsp;Don’t let your wrist or elbow drift upward — stay in one plane.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Side Lateral Raise (Cable)', 'bodyweight', 'horizontal_pull', 'intermediate', '&nbsp;Lift with your elbows leading, not your hands.&nbsp;&nbsp;&nbsp;Don’t shrug your shoulders; keep traps quiet.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Front Raise (Cable)', 'bodyweight', 'vertical_push', 'intermediate', '&nbsp;Raise the handle in a slight arc with controlled movement.&nbsp;&nbsp;&nbsp;Don’t swing your torso to start the rep.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Face pulls with yellow/green band', 'bands', 'horizontal_pull', 'intermediate', 'Face pulls with band – standing horizontal pull. Grab the band at face height, pull elbows high and wide towards your face while squeezing shoulder blades together. Trains upper back, rear shoulders a', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Isometric Squat to Failure', 'bodyweight', 'squat', 'intermediate', 'sometric Squat to Failure: A Strength Training TechniqueDefinitionThe isometric squat to failure is a variation of the squat exercise where you hold a static squat position at a specific angle, mainta', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single-Leg Lunge with Kettlebell:', 'dumbbell', 'squat', 'intermediate', 'How to do a single-leg kettlebell lungePreparation: Stand with your feet together. Hold the kettlebell with both hands by the handle, keeping it close to your chest, or hold it with one hand (on the s', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single-leg side glute press', 'bodyweight', 'squat', 'intermediate', 'The Single-Leg Side Glute Press is a leg press machine variation where you angle your body sideways on the pad, placing one foot high and slightly angled to press the weight, powerfully targeting the ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single-Leg Deadlift with Dumbbell', 'dumbbell', 'squat', 'intermediate', 'Starting Position: Stand upright with a slight bend in your knees, holding a dumbbell in one or both hands. Shift your weight onto your supporting leg (e.g., your right leg) and lift your non-supporti', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Single Leg Glute Bridge', 'bodyweight', 'squat', 'intermediate', 'A glute bridge, where you use just one leg at a time.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Windshield Wipers', 'bodyweight', 'isolation', 'intermediate', 'Hang from a pull-up bar, raise your legs to the ceiling. Move lower body from left to right with straight legs like a windshield wiper', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Machine Side Lateral Raises', 'bodyweight', 'vertical_push', 'intermediate', 'Machine side lateral raises are an isolation exercise for the side (lateral) deltoids, performed on a machine for stability, targeting the outer shoulder by lifting pads or handles out to the sides to', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable Front Raise with a small bar', 'bodyweight', 'vertical_push', 'intermediate', 'The Cable Front Raise with a small bar isolates your anterior deltoids (front shoulders) by providing constant tension, requiring you to stand facing away from a low pulley, grab the bar with an overh', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Floor dumbbell bench press', 'dumbbell', 'horizontal_push', 'intermediate', 'This exercise involves lying on your back with a dumbbell in each hand, and pressing them up towards the ceiling, targeting the chest muscles. The dumbbells are then lowered back down to the starting ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Machine Hip Abduction', 'bodyweight', 'squat', 'intermediate', 'Technique and ExecutionStarting Position&nbsp; &nbsp; Seated Positioning: Sit in the machine with back against the pad&nbsp; &nbsp; Leg Placement: Inner thighs against the machine''s padded resistance ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cable pull through', 'bodyweight', 'squat', 'intermediate', 'The Cable Pull Through is a lower-body exercise that targets the glutes and hamstrings using a "hip hinge" motion. To perform it, attach a rope to the lowest pulley setting, face away from the machine', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated machine row', 'bodyweight', 'horizontal_pull', 'intermediate', 'A seated row machine is a
 gym apparatus for strength training the back (lats, rhomboids, traps) 
by pulling handles toward the torso from a seated position, 
featuring adjustable seats and chest pads', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse crunch', 'bodyweight', 'isolation', 'intermediate', 'Lay downPlace your hands near your butt (often slightly in front or under or both)Raise your legs, but about 70% of the way you should be able to also raise your pelvis(optional/variable) Hold 1/2 sec', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Legend Incline Bench Press', 'bodyweight', 'horizontal_push', 'intermediate', 'incline bench press on LeverEdge machine.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell squat', 'barbell', 'squat', 'intermediate', 'Stand with your feet shoulder-width apart and the barbell resting securely on your upper back (not your neck), gripping it slightly wider than shoulder-width. Keep your chest up, back straight, and co', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Deficit Push ups', 'bodyweight', 'horizontal_push', 'intermediate', 'Pushup on blocks or grips, so you can dip lower than the hands in the decent.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Frog Stretch', 'bodyweight', 'squat', 'intermediate', 'Get on your hands and knees.Widen your knees outwards, and drop to your elbows.Without moving your elbows or knees, start to rock forwards and backwards, trying to get your bum closer to your feet.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'unilateral cross body cable pull down', 'bodyweight', 'vertical_push', 'intermediate', 'on a cable rack place cable high, and with a straight arm pull that cable across you from high to low. focus on tension in back shoulder.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell Full Squat', 'barbell', 'squat', 'intermediate', 'The barbell full squat is a&nbsp;compound exercise&nbsp;that&nbsp;targets multiple muscle groups&nbsp;in the lower body, including the quadriceps, hamstrings, and glutes.Proper form is crucial for max', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Trap Bar Squat', 'bodyweight', 'squat', 'intermediate', 'A combination of squat and deadlift principles with the use of a hex/trap bar, easing stress on the lower back by better centering the weight.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'ankle dorsiflexion rocks', 'bodyweight', 'squat', 'intermediate', 'Move your knee forward, keeping your heel on the ground. Hold the position for a couple of seconds and return to the starting position.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Lat Pull Down', 'bodyweight', 'horizontal_pull', 'intermediate', 'The lat pull down is an exercise used to build the muscles of the back. While the exercise will primarily target the lats, you will also notice a fair amount of bicep and middle back activation.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Behind the Back Cable Lateral Raise', 'bodyweight', 'vertical_push', 'intermediate', 'Lateral raises have long been a staple for building capped delts, and lifters use everything from dumbbells and bands to machines and single-arm variations to make them grow.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Parallel Bar Hold', 'bodyweight', 'isolation', 'intermediate', 'Stand between a set of parallel bars.Place your hands, knuckles outwards, on the bars.Push down on your hands to lift yourself off the floor.Hold yourself in this position with your arms straight for ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Reverse Hyperextension', 'bodyweight', 'squat', 'intermediate', 'Lie face-down on a bench with your legs hanging off the edge.
Bend your hips so your thighs are vertical, bending your knees at the same time so your shins stay horizontal.Straighten out your legs so ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Sphinx', 'bodyweight', 'isolation', 'intermediate', 'Lie on your stomach flat, legs extended and the backs of your feet on 
the ground. Bring your forearms under your shoulders, elbows directly 
underneath. Then press your hands into the floor to lift y', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Dumbell Tate Press', 'bodyweight', 'isolation', 'intermediate', 'Set Up: Lie flat with a dumbbell in each hand. Extend your arms straight up over your chest as if you were at the top of a dumbbell bench pressStarting Position: Position the dumbbells so they are tou', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Chest-Supported Rear Delt Raise', 'bodyweight', 'vertical_push', 'intermediate', '"The Y"Position: Set an incline bench to 30-45 degrees. Lie face-down with your chest supported, keeping your head neutral or looking slightly down to avoid neck strain.Grip: Hold light dumbbells with', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Band pull-apart with external rotation', 'bands', 'vertical_push', 'intermediate', 'Stand tall with your feet shoulder-width apart, chest out, and shoulders back.Hold the resistance band with both hands, palms facing up or facing each other, depending on the band type.Bend your elbow', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Double-Leg Abdominal Press', 'bodyweight', 'isolation', 'intermediate', 'Lie on your back with knees and hips bent at 90 degrees (tabletop).Place your hands on your thighs just above your knees. Push your hands against your knees as hard as possible while using your abs to', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Abdominal Draw-In', 'bodyweight', 'isolation', 'intermediate', 'Lie
 on your back with knees bent. Gently pull your belly button toward your
 spine without moving your hips or holding your breath.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Landmine Squat to Press', 'barbell', 'squat', 'intermediate', 'Bar Position: Anchor one end of a barbell in a landmine attachment or a secure corner.Stance: Stand facing the barbell with feet slightly wider than shoulder-width. Turn your toes out 10–35 degrees to', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Barbell Step Back Lunge', 'barbell', 'squat', 'intermediate', 'Step 1: Stand with your feet hip-width apart, holding a barbell on your upper back.
    Step 2: Keep your back straight, chest up, and core engaged.
    Step 3: Take a step back with one leg and lower', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hammerstrength Decline Chest Press', 'bodyweight', 'horizontal_push', 'intermediate', '1. Sit upright in a hammerstrength decline chest press machine while squeezing your shoulder blades together and placing your heels firmly on the ground underneath your knees.

2. The back pad should ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'External Rotation Stretch', 'barbell', 'vertical_push', 'intermediate', 'Sit with your feet pressed against each other, and one knee raised all the way out to the side of your body.Place your elbow on your raised knee, bend it at 90 degrees, and point your hand directly fo', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Banded Shoulder Drills', 'bands', 'vertical_push', 'intermediate', 'Attach a resistance band to something solid behind you. Stand away from it, holding it in your hand so it is taut.See the attached youtube video: https://www.youtube.com/watch?v=zdwEWchSjrI .', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Shoulder Extension Stretch', 'bodyweight', 'vertical_push', 'intermediate', 'Sit with your hands behind you, shoulder width apart.Lock your elbows.Scoot your feet and hips out forwards, lowering your shoulders down towards ground.Go as far as possible to obtain a good stretch.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Banded Clamshell', 'bands', 'squat', 'intermediate', 'PositionSide plank with the elbow and the forearm on the ground and the legs slightly bent. Stretch a doubled-up resistance band between your thighs, just above the knee.ExecutionLift
 your upper knee', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Standing Pancake Good Morning', 'bodyweight', 'squat', 'intermediate', 'Stand with your feet wider than shoulder-width apart and toes pointed slightly outward. Place your hands on the back of your head. Hinge at your hips and lower your upper body towards the ground, keep', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Pancake Good Morning', 'bodyweight', 'squat', 'intermediate', 'Sit with your legs completely straight (knees locked), spread wide in a straddle position.Place your hands on the back of your neck.Hinge your torso and head towards the floor.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Horse Stance (Side Splits)', 'bodyweight', 'squat', 'intermediate', 'Stand as for a squat, with your feet wide and your toes pointed slightly outwards.Gently squat into a deep, wide squat - your hips should be below your knees.Hold for 3 to 5 seconds.Come up under cont', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Straddle L-Sit', 'bodyweight', 'isolation', 'intermediate', 'With your legs in a sitting saddle position, push your body upwards off the ground. Your legs should be horizontal and point straight outwards. Your arms should be between your legs.Hold isometrically', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'L-sit', 'bodyweight', 'isolation', 'intermediate', 'Sit on the ground with your legs together and your arms by your sides. Push your body off the ground using your hands, maintaining the same sitting position so that your legs are straight and your fee', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'L-Sit (Foot Supported)', 'bodyweight', 'isolation', 'intermediate', 'As with an L-sit, but allow your feet to touch the floor to support the some of the weight of your legs.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Calves foam roller', 'bodyweight', 'squat', 'intermediate', 'Move your calves slowly over the foam roller', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Foam Roller Iliotibial band', 'bodyweight', 'squat', 'intermediate', 'Slide on the Foam Roller over your iliotibial band. Is english terrible checker', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Foam Roller quadriceps', 'bodyweight', 'squat', 'intermediate', 'Slide the Foam Roller over your quadriceps. Is english, please', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Foam Roller Gluteus', 'bodyweight', 'squat', 'intermediate', 'Slide on the Foam Roller over your gluteus. Is english please', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Banded Scapular Retraction', 'bands', 'horizontal_pull', 'intermediate', 'Attach one end of resistance band to wall/upright/... at shoulder height. Insert arm into the loop, at the tricep. Step back until band is pulled straight. Pull back elbow and shoulder against the res', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Bench Press Dumbbell', 'dumbbell', 'horizontal_push', 'intermediate', 'Setup: Sit on a flat bench with dumbbells on your thighs. Lie back, using your knees to help kick the weights into position.Stability: Plant your feet to engage the Gastrocnemius and Biceps femoris, w', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Incline DB Y-Raise', 'dumbbell', 'vertical_push', 'intermediate', 'Set
 an incline bench to a 45-degree angle and sit facing the bench, chest 
against the pad, with a dumbbell in each hand, palms facing each other.Position your feet firmly on the ground for stability', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Wide Grip Pull Up', 'bodyweight', 'horizontal_pull', 'intermediate', 'Using a pronated grip, grasp the pull bar with a wider than shoulder width grip.Take a deep breath, squeeze your glutes and brace your abs. Depress 
the shoulder blades and then drive the elbows strai', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'High-Cable Lateral Raise', 'bodyweight', 'vertical_push', 'intermediate', 'Stand next to a cable machine with the pulley set to waist height.&nbsp;Grab the opposite-side handle with the hand farthest from the 
pulley, keeping your palm facing in.Keep your core engaged, chest', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Shinbox IR Stretch', 'bodyweight', 'squat', 'intermediate', 'Starting Position: Sit on the floor with both hips and knees bent at 90-degree angles.Leg Placement:
 Place one leg in front of you (external rotation) and the other leg out
 to the side/behind you (i', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'YTWL Exercise', 'dumbbell', 'vertical_push', 'intermediate', 'Purpose: Improves shoulder stability, posture, and scapular (shoulder blade) control. Often used in physical therapy and warm-ups.Starting Position:
 Stand with feet shoulder-width apart. Hinge forwar', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Supine Hip Abduction', 'dumbbell', 'squat', 'intermediate', 'Starting Position:
 Lie on your back (supine) on a mat, with your legs extended and 
relaxed. Arms can be placed alongside your body or out to the sides for 
stability.The Movement:
 Slightly lift one', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Decline Bench Leg Raise', 'bodyweight', 'isolation', 'intermediate', 'Setup: Lie on a decline bench with your head at the top and grip the handles.The Start: Extend legs fully, keeping them slightly elevated to engage your core.The Lift: Raise your legs toward the ceili', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Tricep Rope Pushdowns', 'bodyweight', 'isolation', 'intermediate', 'Setup: Stand facing the cable, feet shoulder-width apart, with a slight forward lean.Grip: Hold the rope with palms facing each other and elbows tucked tight to your ribs.Execution: Push the rope down', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Clean and Press', 'barbell', 'vertical_push', 'intermediate', 'The First Pull: Lift the bar from the floor to knee-height by driving with the legs, keeping the angle of your back constant.The "Power" Position: As the bar reaches mid-thigh, explosively shrug and e', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Weighted push-ups', 'bodyweight', 'horizontal_push', 'intermediate', 'Setup: Begin in a standard plank position with a weight plate balanced securely on your upper back.Alignment: Maintain a straight line from your head to your heels, engaging your core to prevent your ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Walking Lunges', 'bands', 'squat', 'intermediate', 'Starting Position: Stand with feet hip-width apart and hands either on your hips or holding dumbbells at your sides.The Stride: Take a wide step forward with your right leg.The Descent: Lower your hip', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Pullback', 'bodyweight', 'horizontal_pull', 'intermediate', 'Set weight and grip for the cables in the cage. Take a few steps away, bend over, pull and extend the back at the same time.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Hip Bridge', 'bodyweight', 'squat', 'intermediate', 'Get into bridge position, balance yourself on heels and start extending legs unilaterally.Keep hip extended as much as possible.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Unilateral Lunges', 'bodyweight', 'squat', 'intermediate', 'No stops during movement, hands on the hips.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Butterfly Superman', 'bodyweight', 'horizontal_pull', 'intermediate', 'Lie on stomach, intertwine fingers behind the head and start raising your head and raise elbows as far as they go.', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Leg Wheel', 'bodyweight', 'isolation', 'intermediate', 'Lay on the back and lift legs in perpendicular fashion, keeping the knees together.Start making small circles in one direction with both of your knees with very small range of motion, focusing on abs ', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Kneeling Superman', 'bodyweight', 'horizontal_pull', 'intermediate', '- Push one foot back until leg fully extended, concentrating on the having the foot high and pushed back as if pulled.- Extend arm forward with focus having the shoulder high up.Unilateral and static ', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Cat Plank', 'bodyweight', 'squat', 'intermediate', 'On your fours and raise the knees of the floor ever so slightly.&nbsp;
Curl your back out and push back from your shoulders as to resemble a cat making itself look large.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Core Rotation', 'bodyweight', 'isolation', 'intermediate', 'Sit back, raise feet above the ground with knees bent and start rotating left and right with hands touching the ground every move.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Unilateral Hip Thrust', 'bodyweight', 'squat', 'intermediate', 'Extend one leg while laying down and start raising your body with one leg touching the ground through the heel.', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Isometria alle parallele', 'bodyweight', 'vertical_push', 'intermediate', 'The parallel bars isometric hold is a static upper-body exercise performed on dip bars (parallel bars). Instead of moving up and down like in a traditional dip, you hold a fixed position under tension', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Tuck planche', 'bodyweight', 'vertical_push', 'intermediate', 'Basic calisthenics progression for the full planche', true, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
END $$;

DO $$
DECLARE ex_id UUID;
BEGIN
  INSERT INTO exercises (id, name, equipment, movement_pattern, difficulty, instructions, is_compound, is_system)
  VALUES (gen_random_uuid(), 'Seated Cable chest fly', 'bodyweight', 'horizontal_push', 'intermediate', 'Place a bench between two cable pulleys and adjust the pulleys so they are at chest/shoulder height when you are seated.Grab the handles with a neutral grip and lean against the upright backrest.Bring', false, true)
  RETURNING id INTO ex_id;
  INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES (ex_id, 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
END $$;
