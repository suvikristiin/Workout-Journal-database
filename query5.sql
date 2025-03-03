SELECT e.exercise_name AS exercise, 
       r.weight AS max_weight, 
       r.reps AS max_reps, 
       r.result_date AS ResultDate
FROM Results r
JOIN Exercises_in_Workout eiw ON r.exercisesInWorkout_id = eiw.exercisesInWorkout_id
JOIN Exercises e ON eiw.exercise_id = e.exercise_id
JOIN Workouts w ON eiw.workout_id = w.workout_id
JOIN Training_plans tp ON w.trainingPlan_id = tp.trainingPlan_id
JOIN Users u ON tp.user_id = u.user_id
WHERE u.username = 'user1'
AND (r.weight, r.reps) IN (
    SELECT MAX(r2.weight), MAX(r2.reps)
    FROM Results r2
    JOIN Exercises_in_Workout eiw2 ON r2.exercisesInWorkout_id = eiw2.exercisesInWorkout_id
    WHERE eiw2.exercise_id = e.exercise_id
)
ORDER BY e.exercise_name;
