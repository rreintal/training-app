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
    
    enum CodingKeys : String, CodingKey {
        case Id = "id"
        case Name = "name"
        case Exercises = "workoutExercises"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        Id = try container.decode(UUID.self, forKey: .Id)
        Name = try container.decode(String.self, forKey: .Name)
        Exercises = try container.decode([WorkoutExercise].self, forKey: .Exercises)
    }
    
}
