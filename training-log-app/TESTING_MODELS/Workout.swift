//
//  Workout.swift
//  training-log-app
//
//  Created by Richard Reintal on 13.05.2023.
//

import Foundation

class Workout : Identifiable, AppModel{
    
    var Id : UUID
    var Name : String
    var Exercises : [WorkoutExercise]
    
    init(Id: UUID, Name: String, Exercises: [WorkoutExercise]) {
        self.Id = Id
        self.Name = Name
        self.Exercises = Exercises
    }
    
    public func getExercisesStringList() -> [String] {
        var result : [String] = []
        Exercises.forEach { exercise in
            result.append(exercise.Name)
        }
        return result;
    }
}
