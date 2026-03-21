-- ============================================
-- EXERCISE VIDEO URLs (curated YouTube links)
-- Using well-known fitness education channels
-- ============================================

-- Compound lifts
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=rT7DgCr-3pg' WHERE name = 'Barbell Bench Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=ultWZbUMPL8' WHERE name = 'Barbell Back Squat';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=op9kVnSso6Q' WHERE name = 'Conventional Deadlift';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=_RlRDWO2jfg' WHERE name = 'Overhead Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=eGo4IYlbE5g' WHERE name = 'Barbell Row';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=XB_7En-zf_M' WHERE name = 'Pull-Up';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=2z8JmcrW-As' WHERE name = 'Dip';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=Dy28eq2PjcM' WHERE name = 'Romanian Deadlift';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=SLV0FW-GwMk' WHERE name = 'Incline Barbell Bench Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=0JfYxMRsUCQ' WHERE name = 'Barbell Front Squat';

-- Dumbbell exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=VmB1G1K7v94' WHERE name = 'Dumbbell Bench Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=ykJmrZ5v0Oo' WHERE name = 'Dumbbell Row';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=qEwKCR5JCog' WHERE name = 'Dumbbell Shoulder Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=hChjZQhX1HM' WHERE name = 'Dumbbell Lateral Raise';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=vy1JJxT8yxA' WHERE name = 'Dumbbell Curl';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=d_KZxkY_0cM' WHERE name = 'Dumbbell Fly';

-- Cable exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=WEM9FCIPlxQ' WHERE name = 'Cable Crossover';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=Oe06bczMJSo' WHERE name = 'Cable Lateral Raise';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=V8dZ3pyiCBo' WHERE name = 'Lat Pulldown';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=DR7MQWK4XlY' WHERE name = 'Seated Cable Row';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=2-LAMcpzODU' WHERE name = 'Cable Tricep Pushdown';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=NFzTWp2qpiE' WHERE name = 'Face Pull';

-- Machine exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=IZxyjW7MPJQ' WHERE name = 'Leg Press';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=YyvSfVjQeL0' WHERE name = 'Leg Extension';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=1Tq3QdYUuHs' WHERE name = 'Leg Curl';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=Aw6fHb4PjPE' WHERE name = 'Hack Squat';

-- Bodyweight exercises
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=IODxDxX7oi4' WHERE name = 'Push-Up';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=ASdvN_XEl_c' WHERE name = 'Plank';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=jDwoBqPH0jk' WHERE name = 'Hanging Leg Raise';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=rloXYB8M3dY' WHERE name = 'Inverted Row';

-- Popular accessories
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=Fo63Dz92fQY' WHERE name = 'Hip Thrust';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=d4zGxMz5A9E' WHERE name = 'Barbell Shrug';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=AjdU2KJbrRk' WHERE name = 'Barbell Curl';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=nRiJVZDpdL0' WHERE name = 'Skull Crusher';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=UCXxvVItLoM' WHERE name = 'Preacher Curl';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=dFzUjzfih7k' WHERE name = 'Calf Raise';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=AHKobl1xFtg' WHERE name ILIKE '%Nordic Curl%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=m0GcZ5gMNJk' WHERE name ILIKE '%Bulgarian Split Squat%' AND equipment = 'dumbbell';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=6kALZikXxLc' WHERE name ILIKE '%Arnold Press%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=CnBc2sUuPjg' WHERE name ILIKE '%Pallof Press%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=PjdXDjmBeg8' WHERE name ILIKE '%Ab Wheel%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=Fj6wMBOntdg' WHERE name ILIKE '%Turkish Get%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=y7Iig1waRaU' WHERE name ILIKE '%Farmer%Carry%' OR name ILIKE '%Farmer%Walk%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=lueEJGjTuPQ' WHERE name ILIKE '%Pendlay Row%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=sqP_GQsL3LI' WHERE name ILIKE '%Zottman Curl%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=ECA4zXkGqSs' WHERE name ILIKE '%Spider Curl%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=1ZXobu7JvvE' WHERE name ILIKE '%Meadows Row%';
UPDATE exercises SET video_url = 'https://www.youtube.com/watch?v=vB5OHsJ3EME' WHERE name ILIKE '%GHR%' OR name ILIKE '%Glute Ham Raise%';
