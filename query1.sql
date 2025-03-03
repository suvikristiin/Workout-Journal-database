SELECT u.username AS User, tp.trainingPlan_name AS Trainingplan, w.workout_name AS Workout
FROM Users u
JOIN Training_plans tp ON u.user_id = tp.user_id
JOIN Workouts w ON tp.trainingPlan_id = w.trainingPlan_id
WHERE u.username = 'user1';