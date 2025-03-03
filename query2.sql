SELECT u.username AS User, 
       tp.trainingPlan_name AS Trainingplan, 
       w.workout_name AS Workout, 
       e.exercise_name AS Exercise
FROM Users u
JOIN Training_plans tp ON u.user_id = tp.user_id
JOIN Workouts w ON tp.trainingPlan_id = w.trainingPlan_id
JOIN Exercises_in_workout eiw ON w.workout_id = eiw.workout_id
JOIN Exercises e ON eiw.exercise_id = e.exercise_id
WHERE u.username = 'user1';