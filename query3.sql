SELECT w.workout_name AS Workout, e.exercise_name AS Exercise, n.note_text AS Note, n.note_date AS noteDate
FROM Notes n
JOIN Exercises_in_Workout eiw ON n.exercisesInWorkout_id = eiw.exercisesInWorkout_id
JOIN Workouts w ON eiw.workout_id = w.workout_id
JOIN Exercises e ON eiw.exercise_id = e.exercise_id
WHERE w.workout_name = 'Leg Day'
ORDER BY n.note_date DESC;