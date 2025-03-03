CREATE TABLE Users (
	user_id INT NOT NULL ,
	username VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY (user_id)
);

CREATE TABLE Training_plans (
	trainingPlan_id INT NOT NULL,
	user_id INT NOT NULL,
	trainingPlan_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (trainingPlan_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id) 
	ON DELETE CASCADE 
	ON UPDATE RESTRICT
);

CREATE TABLE Workouts (
    workout_id INT NOT NULL,
    trainingPlan_id INT NOT NULL,
    workout_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (workout_id),
    FOREIGN KEY (trainingPlan_id) REFERENCES Training_plans(trainingPlan_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

CREATE TABLE Exercises (
	exercise_id INT NOT NULL,
	exercise_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (exercise_id)
);

CREATE TABLE Exercises_in_workout (
	exercisesInWorkout_id INT NOT NULL,
	workout_id INT NOT NULL,
	exercise_id INT NOT NULL,
	PRIMARY KEY (exercisesInWorkout_id),
	FOREIGN KEY (workout_id) REFERENCES Workouts(workout_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
	FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

CREATE TABLE Notes (
	note_id INT NOT NULL,
	note_text TEXT,
	note_date DATE NOT NULL DEFAULT CURRENT_DATE,
	exercisesInWorkout_id INT NOT NULL,
	PRIMARY KEY (note_id),
	FOREIGN KEY (exercisesInWorkout_id) REFERENCES Exercises_in_workout(exercisesInWorkout_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

CREATE TABLE Results (
	result_id INT NOT NULL,
	exercisesInWorkout_id INT NOT NULL,
    weight INT DEFAULT 0,
    reps INT NOT NULL CHECK (reps >= 1),
    set_number INT NOT NULL CHECK (set_number >= 1),
    result_date DATE NOT NULL DEFAULT CURRENT_DATE,
	PRIMARY KEY(result_id),
    FOREIGN KEY (exercisesInWorkout_id) REFERENCES Exercises_in_workout(exercisesInWorkout_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

CREATE INDEX index_results_exercisesInWorkout
ON Results (exercisesInWorkout_id);

CREATE INDEX index_exercisesInWorkout
ON Exercises_in_workout (workout_id, exercise_id);



