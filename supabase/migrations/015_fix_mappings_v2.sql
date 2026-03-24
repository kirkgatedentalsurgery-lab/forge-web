-- Fix muscle mappings v2: delete by exercise_id then re-insert
-- Fixes 62 exercises

-- Close-Grip Lat Pulldown
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'a293c919-eb2a-4fd9-a12e-3faac12d8041';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('a293c919-eb2a-4fd9-a12e-3faac12d8041', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('a293c919-eb2a-4fd9-a12e-3faac12d8041', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Band Pull-Apart
DELETE FROM exercise_muscle_groups WHERE exercise_id = '6c18d2e3-b7e1-4d71-acf5-5eabde458943';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6c18d2e3-b7e1-4d71-acf5-5eabde458943', 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6c18d2e3-b7e1-4d71-acf5-5eabde458943', 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);

-- Reverse Pec Deck
DELETE FROM exercise_muscle_groups WHERE exercise_id = '39c30b49-8966-4d46-90ac-a92d104d5140';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('39c30b49-8966-4d46-90ac-a92d104d5140', 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('39c30b49-8966-4d46-90ac-a92d104d5140', 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);

-- Close-Grip Bench Press
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'e93e00ad-57ca-43a9-ac09-591fced9cbc0';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('e93e00ad-57ca-43a9-ac09-591fced9cbc0', 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('e93e00ad-57ca-43a9-ac09-591fced9cbc0', 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('e93e00ad-57ca-43a9-ac09-591fced9cbc0', 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);

-- Lying Leg Curl
DELETE FROM exercise_muscle_groups WHERE exercise_id = '942660e7-7af5-470c-b3f9-3b71375ee3cb';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('942660e7-7af5-470c-b3f9-3b71375ee3cb', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('942660e7-7af5-470c-b3f9-3b71375ee3cb', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Seated Leg Curl
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'e3f2c190-9a42-480a-8bee-68d7b18500f1';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('e3f2c190-9a42-480a-8bee-68d7b18500f1', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('e3f2c190-9a42-480a-8bee-68d7b18500f1', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Band Leg Curl
DELETE FROM exercise_muscle_groups WHERE exercise_id = '81ab1091-f65f-4ab3-b80b-cb625edfc82f';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('81ab1091-f65f-4ab3-b80b-cb625edfc82f', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('81ab1091-f65f-4ab3-b80b-cb625edfc82f', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Cable Kickback
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'bae72edf-593f-479c-9766-4a8951de21ca';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('bae72edf-593f-479c-9766-4a8951de21ca', 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('bae72edf-593f-479c-9766-4a8951de21ca', 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);

-- Leg Press Calf Raise
DELETE FROM exercise_muscle_groups WHERE exercise_id = '6e20fb10-414b-4455-9186-916e428acb8f';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6e20fb10-414b-4455-9186-916e428acb8f', 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);

-- Conventional Deadlift
DELETE FROM exercise_muscle_groups WHERE exercise_id = '8ed27fc9-7059-4cff-b731-a3649ae585e0';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('8ed27fc9-7059-4cff-b731-a3649ae585e0', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('8ed27fc9-7059-4cff-b731-a3649ae585e0', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('8ed27fc9-7059-4cff-b731-a3649ae585e0', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Stiff-Leg Deadlift
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'ba528da5-6f4b-44b9-9c4a-454ca377eb6e';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('ba528da5-6f4b-44b9-9c4a-454ca377eb6e', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('ba528da5-6f4b-44b9-9c4a-454ca377eb6e', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('ba528da5-6f4b-44b9-9c4a-454ca377eb6e', 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);

-- Sumo Deadlift
DELETE FROM exercise_muscle_groups WHERE exercise_id = '08024270-973d-4a2d-a8ab-c2db19efe00a';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('08024270-973d-4a2d-a8ab-c2db19efe00a', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('08024270-973d-4a2d-a8ab-c2db19efe00a', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('08024270-973d-4a2d-a8ab-c2db19efe00a', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Snatch-Grip Deadlift
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'e56893c9-f232-4b62-97f1-a0dc4fe4576b';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('e56893c9-f232-4b62-97f1-a0dc4fe4576b', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('e56893c9-f232-4b62-97f1-a0dc4fe4576b', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('e56893c9-f232-4b62-97f1-a0dc4fe4576b', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Sliding Leg Curl
DELETE FROM exercise_muscle_groups WHERE exercise_id = '6a55c2e8-ba09-42e7-ae0a-24811500a96b';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6a55c2e8-ba09-42e7-ae0a-24811500a96b', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6a55c2e8-ba09-42e7-ae0a-24811500a96b', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Dumbbell Sumo Squat
DELETE FROM exercise_muscle_groups WHERE exercise_id = '4c697622-8913-4670-a120-285d893ba3d7';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('4c697622-8913-4670-a120-285d893ba3d7', 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('4c697622-8913-4670-a120-285d893ba3d7', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('4c697622-8913-4670-a120-285d893ba3d7', 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);

-- Cable Glute Kickback
DELETE FROM exercise_muscle_groups WHERE exercise_id = '01ca8d1f-2115-41e6-9484-a53c6632ac87';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('01ca8d1f-2115-41e6-9484-a53c6632ac87', 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('01ca8d1f-2115-41e6-9484-a53c6632ac87', 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);

-- Reverse Curl
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'a31024c8-0fb3-4ccf-8c73-36cf8ff332a9';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('a31024c8-0fb3-4ccf-8c73-36cf8ff332a9', 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('a31024c8-0fb3-4ccf-8c73-36cf8ff332a9', 'a1000000-0000-0000-0000-00000000000c', 'primary', 1.0);

-- Trap Bar Deadlift
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'f0dd391a-a141-4d4d-b8a1-faa40a6c8795';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('f0dd391a-a141-4d4d-b8a1-faa40a6c8795', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('f0dd391a-a141-4d4d-b8a1-faa40a6c8795', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('f0dd391a-a141-4d4d-b8a1-faa40a6c8795', 'a1000000-0000-0000-0000-00000000000b', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('f0dd391a-a141-4d4d-b8a1-faa40a6c8795', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Deficit Deadlift
DELETE FROM exercise_muscle_groups WHERE exercise_id = '262c7058-87da-499d-a56e-9d8183897099';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('262c7058-87da-499d-a56e-9d8183897099', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('262c7058-87da-499d-a56e-9d8183897099', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('262c7058-87da-499d-a56e-9d8183897099', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Bent-Over Dumbbell Reverse Fly
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'b8959992-9173-48ff-b7d6-0e2f339969da';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('b8959992-9173-48ff-b7d6-0e2f339969da', 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('b8959992-9173-48ff-b7d6-0e2f339969da', 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);

-- Close-Grip Cable Row
DELETE FROM exercise_muscle_groups WHERE exercise_id = '2e86612b-ad98-42f5-a5a8-8555c87b9260';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('2e86612b-ad98-42f5-a5a8-8555c87b9260', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('2e86612b-ad98-42f5-a5a8-8555c87b9260', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Wide-Grip Cable Row
DELETE FROM exercise_muscle_groups WHERE exercise_id = '517aa9c7-1820-493d-bd81-f479eede8934';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('517aa9c7-1820-493d-bd81-f479eede8934', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('517aa9c7-1820-493d-bd81-f479eede8934', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Push Press
DELETE FROM exercise_muscle_groups WHERE exercise_id = '4222f711-3c1f-4499-86f1-68bfe94f8dfb';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('4222f711-3c1f-4499-86f1-68bfe94f8dfb', 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('4222f711-3c1f-4499-86f1-68bfe94f8dfb', 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('4222f711-3c1f-4499-86f1-68bfe94f8dfb', 'a1000000-0000-0000-0000-00000000000d', 'secondary', 0.5);

-- Neutral-Grip Dumbbell Bench Press
DELETE FROM exercise_muscle_groups WHERE exercise_id = '50ecfb20-69e8-4ca6-9313-e9703c30c8c2';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('50ecfb20-69e8-4ca6-9313-e9703c30c8c2', 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('50ecfb20-69e8-4ca6-9313-e9703c30c8c2', 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('50ecfb20-69e8-4ca6-9313-e9703c30c8c2', 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);

-- Bench Press Narrow Grip
DELETE FROM exercise_muscle_groups WHERE exercise_id = '2251c9c6-e54e-400c-83af-c4523443d92a';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('2251c9c6-e54e-400c-83af-c4523443d92a', 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('2251c9c6-e54e-400c-83af-c4523443d92a', 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('2251c9c6-e54e-400c-83af-c4523443d92a', 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);

-- Lat Pulldown (Wide Grip)
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'd3e0b4c8-e017-4eab-9d9e-061087e5344b';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('d3e0b4c8-e017-4eab-9d9e-061087e5344b', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('d3e0b4c8-e017-4eab-9d9e-061087e5344b', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Reverse Preacher Curl (Close Grip)
DELETE FROM exercise_muscle_groups WHERE exercise_id = '24db4ada-c0c1-4aff-b6b0-f462956e6d9e';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('24db4ada-c0c1-4aff-b6b0-f462956e6d9e', 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('24db4ada-c0c1-4aff-b6b0-f462956e6d9e', 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);

-- Close-grip Lat Pull Down
DELETE FROM exercise_muscle_groups WHERE exercise_id = '053e1993-445e-4e31-9e19-b26d0d8d8890';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('053e1993-445e-4e31-9e19-b26d0d8d8890', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('053e1993-445e-4e31-9e19-b26d0d8d8890', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Calf Press Using Leg Press Machine
DELETE FROM exercise_muscle_groups WHERE exercise_id = '1c05d445-9833-40bc-b7c7-8b1df2b45a16';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('1c05d445-9833-40bc-b7c7-8b1df2b45a16', 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);

-- Calf Raises on Hackenschmitt Machine
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'c71c0e5b-75d3-4b37-8ccd-204ed7dbd6bb';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('c71c0e5b-75d3-4b37-8ccd-204ed7dbd6bb', 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);

-- Leg Curls (laying)
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'fa30a596-632e-4c19-baaf-58526909c04f';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('fa30a596-632e-4c19-baaf-58526909c04f', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('fa30a596-632e-4c19-baaf-58526909c04f', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Leg Curls (sitting)
DELETE FROM exercise_muscle_groups WHERE exercise_id = '5d3915d1-e508-40e5-badc-0fe8feeb025d';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('5d3915d1-e508-40e5-badc-0fe8feeb025d', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('5d3915d1-e508-40e5-badc-0fe8feeb025d', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Leg Curl
DELETE FROM exercise_muscle_groups WHERE exercise_id = '9c49c92d-a21b-4407-be70-d6cb73ed58a0';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('9c49c92d-a21b-4407-be70-d6cb73ed58a0', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('9c49c92d-a21b-4407-be70-d6cb73ed58a0', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Lateral-to-Front Raises
DELETE FROM exercise_muscle_groups WHERE exercise_id = '9105e4f1-06c6-4020-904c-487dad6af678';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('9105e4f1-06c6-4020-904c-487dad6af678', 'a1000000-0000-0000-0000-000000000006', 'primary', 1.0);

-- Leg Curls (standing)
DELETE FROM exercise_muscle_groups WHERE exercise_id = '01f8b9a5-b158-4d8c-96fc-f60b7d6de1c5';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('01f8b9a5-b158-4d8c-96fc-f60b7d6de1c5', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('01f8b9a5-b158-4d8c-96fc-f60b7d6de1c5', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Leg Presses (narrow)
DELETE FROM exercise_muscle_groups WHERE exercise_id = '5e1f65b0-ce88-426b-81d5-63ee02338096';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('5e1f65b0-ce88-426b-81d5-63ee02338096', 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('5e1f65b0-ce88-426b-81d5-63ee02338096', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('5e1f65b0-ce88-426b-81d5-63ee02338096', 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);

-- Rack Deadlift
DELETE FROM exercise_muscle_groups WHERE exercise_id = '6dfdffb5-1f9d-4410-b835-ebb81a97e327';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6dfdffb5-1f9d-4410-b835-ebb81a97e327', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6dfdffb5-1f9d-4410-b835-ebb81a97e327', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6dfdffb5-1f9d-4410-b835-ebb81a97e327', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Reverse Grip Bench Press
DELETE FROM exercise_muscle_groups WHERE exercise_id = '841ccaa1-43c4-4bdd-8a65-c3b13b473bc2';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('841ccaa1-43c4-4bdd-8a65-c3b13b473bc2', 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('841ccaa1-43c4-4bdd-8a65-c3b13b473bc2', 'a1000000-0000-0000-0000-000000000008', 'secondary', 0.5);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('841ccaa1-43c4-4bdd-8a65-c3b13b473bc2', 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);

-- Smith Machine Close-grip Bench Press
DELETE FROM exercise_muscle_groups WHERE exercise_id = '354f20b5-4e73-4176-aa4b-1de5f2109587';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('354f20b5-4e73-4176-aa4b-1de5f2109587', 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('354f20b5-4e73-4176-aa4b-1de5f2109587', 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('354f20b5-4e73-4176-aa4b-1de5f2109587', 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);

-- Sumo Squats
DELETE FROM exercise_muscle_groups WHERE exercise_id = '43fd41e9-960d-4391-aec2-6deee86d594d';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('43fd41e9-960d-4391-aec2-6deee86d594d', 'a1000000-0000-0000-0000-000000000003', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('43fd41e9-960d-4391-aec2-6deee86d594d', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('43fd41e9-960d-4391-aec2-6deee86d594d', 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);

-- Stiff-legged Deadlifts
DELETE FROM exercise_muscle_groups WHERE exercise_id = '31d2824b-4979-4e67-a4d7-03b9dc8ad64c';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('31d2824b-4979-4e67-a4d7-03b9dc8ad64c', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('31d2824b-4979-4e67-a4d7-03b9dc8ad64c', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('31d2824b-4979-4e67-a4d7-03b9dc8ad64c', 'a1000000-0000-0000-0000-000000000002', 'secondary', 0.5);

-- Wide-grip Pulldown
DELETE FROM exercise_muscle_groups WHERE exercise_id = '6ce96fef-0754-41ab-b0a6-bdc64d51e303';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6ce96fef-0754-41ab-b0a6-bdc64d51e303', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('6ce96fef-0754-41ab-b0a6-bdc64d51e303', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Upright Row, on Multi Press
DELETE FROM exercise_muscle_groups WHERE exercise_id = '24ca411d-fcaa-47b3-beb3-13256429b5e6';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('24ca411d-fcaa-47b3-beb3-13256429b5e6', 'a1000000-0000-0000-0000-00000000000d', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('24ca411d-fcaa-47b3-beb3-13256429b5e6', 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);

-- Kettlebell One Legged Deadlift
DELETE FROM exercise_muscle_groups WHERE exercise_id = '64892ee7-b397-416a-b9f6-f218e2cc979d';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('64892ee7-b397-416a-b9f6-f218e2cc979d', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('64892ee7-b397-416a-b9f6-f218e2cc979d', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('64892ee7-b397-416a-b9f6-f218e2cc979d', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Dumbbell close grip bench press
DELETE FROM exercise_muscle_groups WHERE exercise_id = '25b521ab-0766-42fe-9bc0-7cfb7d927eee';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('25b521ab-0766-42fe-9bc0-7cfb7d927eee', 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('25b521ab-0766-42fe-9bc0-7cfb7d927eee', 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('25b521ab-0766-42fe-9bc0-7cfb7d927eee', 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);

-- Dumbbell upright-row
DELETE FROM exercise_muscle_groups WHERE exercise_id = '7e40f056-3ad4-4fe1-9078-65bfe37f3253';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('7e40f056-3ad4-4fe1-9078-65bfe37f3253', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('7e40f056-3ad4-4fe1-9078-65bfe37f3253', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Biceps Close Grip Pull Down
DELETE FROM exercise_muscle_groups WHERE exercise_id = '30d0e2d1-6462-47fb-acc2-44087213de86';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('30d0e2d1-6462-47fb-acc2-44087213de86', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('30d0e2d1-6462-47fb-acc2-44087213de86', 'a1000000-0000-0000-0000-000000000007', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('30d0e2d1-6462-47fb-acc2-44087213de86', 'a1000000-0000-0000-0000-00000000000c', 'secondary', 0.5);

-- Dumbbell Romanian Deadlifts
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'f40a0f10-41c0-4538-beec-88af384d0b1c';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('f40a0f10-41c0-4538-beec-88af384d0b1c', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('f40a0f10-41c0-4538-beec-88af384d0b1c', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Calf Raise using Hack Squat Machine
DELETE FROM exercise_muscle_groups WHERE exercise_id = '539d04d1-4745-4f89-a78c-f9f11756b607';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('539d04d1-4745-4f89-a78c-f9f11756b607', 'a1000000-0000-0000-0000-000000000009', 'primary', 1.0);

-- Incline Close Grip Barbell Bench Press
DELETE FROM exercise_muscle_groups WHERE exercise_id = '73b1999f-4d47-4475-bd1c-153a144841b6';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('73b1999f-4d47-4475-bd1c-153a144841b6', 'a1000000-0000-0000-0000-000000000001', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('73b1999f-4d47-4475-bd1c-153a144841b6', 'a1000000-0000-0000-0000-000000000008', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('73b1999f-4d47-4475-bd1c-153a144841b6', 'a1000000-0000-0000-0000-000000000006', 'secondary', 0.5);

-- Neutral Grip Lat Pulldown
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'b0b80217-8861-413d-b540-c722c4000859';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('b0b80217-8861-413d-b540-c722c4000859', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('b0b80217-8861-413d-b540-c722c4000859', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Pull-Ups (Wide Grip)
DELETE FROM exercise_muscle_groups WHERE exercise_id = '169ed625-a633-499a-9520-be5eba5b6587';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('169ed625-a633-499a-9520-be5eba5b6587', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('169ed625-a633-499a-9520-be5eba5b6587', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Pull-Ups (Neutral Grip)
DELETE FROM exercise_muscle_groups WHERE exercise_id = '064c97db-bccd-4d02-904b-fe3dc8bbb063';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('064c97db-bccd-4d02-904b-fe3dc8bbb063', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('064c97db-bccd-4d02-904b-fe3dc8bbb063', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

-- Reverse Fly Standing
DELETE FROM exercise_muscle_groups WHERE exercise_id = '11587c76-22fb-46fb-acb1-85b03e824b15';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('11587c76-22fb-46fb-acb1-85b03e824b15', 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('11587c76-22fb-46fb-acb1-85b03e824b15', 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);

-- Leg curl with elastic
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'ef53fe80-1440-4e66-b990-f3f88ccc85dc';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('ef53fe80-1440-4e66-b990-f3f88ccc85dc', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('ef53fe80-1440-4e66-b990-f3f88ccc85dc', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Glute Kickback (Machine)
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'd7b43beb-32f0-43b6-9a12-756bb9bf001a';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('d7b43beb-32f0-43b6-9a12-756bb9bf001a', 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('d7b43beb-32f0-43b6-9a12-756bb9bf001a', 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);

-- kettlebell sumo deadlift
DELETE FROM exercise_muscle_groups WHERE exercise_id = '4f79f048-bd84-4f1a-856f-c6febdc62165';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('4f79f048-bd84-4f1a-856f-c6febdc62165', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('4f79f048-bd84-4f1a-856f-c6febdc62165', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('4f79f048-bd84-4f1a-856f-c6febdc62165', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- rubber band glute kickback
DELETE FROM exercise_muscle_groups WHERE exercise_id = '58771633-f902-4537-9648-aaa348958b12';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('58771633-f902-4537-9648-aaa348958b12', 'a1000000-0000-0000-0000-000000000005', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('58771633-f902-4537-9648-aaa348958b12', 'a1000000-0000-0000-0000-000000000004', 'secondary', 0.5);

-- Single-Leg Deadlift with Dumbbell
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'f1ebc95e-be4a-401e-a08d-ad444fa4149f';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('f1ebc95e-be4a-401e-a08d-ad444fa4149f', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('f1ebc95e-be4a-401e-a08d-ad444fa4149f', 'a1000000-0000-0000-0000-000000000004', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('f1ebc95e-be4a-401e-a08d-ad444fa4149f', 'a1000000-0000-0000-0000-000000000005', 'secondary', 0.5);

-- Chest-Supported Rear Delt Raise
DELETE FROM exercise_muscle_groups WHERE exercise_id = '5dcdb745-7f03-4279-9724-ab9f9f310bd3';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('5dcdb745-7f03-4279-9724-ab9f9f310bd3', 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('5dcdb745-7f03-4279-9724-ab9f9f310bd3', 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);

-- Band pull-apart with external rotation
DELETE FROM exercise_muscle_groups WHERE exercise_id = 'ce38c31b-5f96-417d-a575-386f3dbb3065';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('ce38c31b-5f96-417d-a575-386f3dbb3065', 'a1000000-0000-0000-0000-00000000000e', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('ce38c31b-5f96-417d-a575-386f3dbb3065', 'a1000000-0000-0000-0000-00000000000a', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('ce38c31b-5f96-417d-a575-386f3dbb3065', 'a1000000-0000-0000-0000-00000000000b', 'secondary', 0.5);

-- Wide Grip Pull Up
DELETE FROM exercise_muscle_groups WHERE exercise_id = '871c7ead-3e07-4741-be7e-cf92359f6f1d';
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('871c7ead-3e07-4741-be7e-cf92359f6f1d', 'a1000000-0000-0000-0000-000000000002', 'primary', 1.0);
INSERT INTO exercise_muscle_groups (exercise_id, muscle_group_id, role, stimulus_magnitude) VALUES ('871c7ead-3e07-4741-be7e-cf92359f6f1d', 'a1000000-0000-0000-0000-000000000007', 'secondary', 0.5);

