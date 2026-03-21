-- ============================================
-- FIX EXERCISE VIDEO URLs
-- Replace broken YouTube links with verified working URLs
-- Sources: Muscle & Strength, BarBend, Fit Father Project
-- ============================================

-- Compound Barbell Lifts
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=tuwHzzPdaGc' WHERE name = 'Barbell Bench Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=R2dMsNhN3DE' WHERE name = 'Barbell Squat';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=wjsu6ceEkAQ' WHERE name = 'Barbell Deadlift';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=j7ULT6dznNc' WHERE name = 'Overhead Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=paCfxhgW6bI' WHERE name = 'Barbell Row';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=-m45n1_x32E' WHERE name = 'Romanian Deadlift';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=uIzbJX5EVIY' WHERE name = 'Incline Barbell Bench Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=9xAkoz95IFE' WHERE name = 'Front Squat';

-- Bodyweight Exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=5oxviYmdHCY' WHERE name = 'Pull-Up';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=FG1ENBFsdHU' WHERE name = 'Dips';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=KEFQyLkDYtI' WHERE name = 'Push-Up';
UPDATE exercises SET video_url = NULL WHERE name = 'Plank';

-- Dumbbell Exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=dGqI0Z5ul4k' WHERE name = 'Dumbbell Bench Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=DhewkuU_95s' WHERE name = 'Dumbbell Row';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=FRxZ6wr5bpA' WHERE name = 'Dumbbell Shoulder Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=IdNOahFD450' WHERE name = 'Dumbbell Lateral Raise';
UPDATE exercises SET video_url = NULL WHERE name = 'Dumbbell Curl';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=-lcbvOddoi8' WHERE name = 'Dumbbell Fly';

-- Cable Exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=OPYrUGZL8nU' WHERE name = 'Cable Fly';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=iKrKgWR9wbY' WHERE name = 'Lat Pulldown';
UPDATE exercises SET video_url = NULL WHERE name = 'Cable Row';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=LzwgB15UdO8' WHERE name = 'Tricep Pushdown';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=7ZvpXA_mFpQ' WHERE name = 'Cable Face Pull';

-- Machine Exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=sEM_zo9w2ss' WHERE name = 'Leg Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=0fl1RRgJ83I' WHERE name = 'Leg Extension';
UPDATE exercises SET video_url = NULL WHERE name = 'Leg Curl';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=63tboDKQksc' WHERE name = 'Hack Squat';

-- Accessories
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=lAnqN0J_p5A' WHERE name = 'Barbell Hip Thrust';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=llqu4IFYSQw' WHERE name = 'Barbell Curl';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=kOXVmFFTcio' WHERE name = 'Lying Tricep Extension';
