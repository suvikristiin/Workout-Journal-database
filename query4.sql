SELECT u.username AS Username, e.exercise_name AS Exercise, r.result_date AS ResultDate, r.weight AS Weight, r.reps AS Reps, r.set_number AS SetNumber
FROM Results r
JOIN Exercises_in_Workout eiw ON r.exercisesInWorkout_id = eiw.exercisesInWorkout_id
JOIN Exercises e ON eiw.exercise_id = e.exercise_id
JOIN Workouts w ON eiw.workout_id = w.workout_id
JOIN Training_plans tp ON w.trainingPlan_id = tp.trainingPlan_id
JOIN Users u ON tp.user_id = u.user_id
WHERE e.exercise_name = 'Front Squat' 
AND u.username = 'user1'
ORDER BY r.result_date;