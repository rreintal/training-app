//
//  ExerciseItemsAPI.swift
//  training-log-app
//
//  Created by Richard Reintal on 13.05.2023.
//

import Foundation

class ExerciseItemsAPI {
    
    
    public static func GetExerciseItems() -> [ExerciseItem] {
        let exercises = [
            ExerciseItem(Name: "Barbell bench press", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Incline barbell bench press", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Decline barbell bench press", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Dumbbell bench press", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Incline dumbbell bench press", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Decline dumbbell bench press", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Cable chest press", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Chest fly with dumbbells", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Chest fly with cables", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Chest press machine", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Smith machine bench press", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Close-grip bench press", MuscleGroup: "Triceps"),
            ExerciseItem(Name: "Wide-grip bench press", MuscleGroup: "Chest"),
            ExerciseItem(Name: "Plyometric push-ups", MuscleGroup: "Chest")
        ]
        return exercises
    }
}
