//
//  NewWorkoutSession.swift
//  training-log-app
//
//  Created by Richard Reintal on 14.05.2023.
//

import Foundation

class NewWorkoutSession : AppModel{
    var WorkoutId : String
    var Name : String
    //var CreatedAt : Date
    var Exercises : [NewSessionExercise]
    
    
    init(workoutId : String, Name: String, Exercises: [NewSessionExercise]) {
        self.Name = Name
        self.WorkoutId = workoutId
        //self.CreatedAt = CreatedAt
        self.Exercises = Exercises
    }
    
    enum CodingKeys: String, CodingKey {
        case WorkoutId = "workoutId"
        case Name = "name"
        //case CreatedAt
        case Exercises = "newSessionExercises"
    }
    
    required init(from : Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)
        Name = try container.decode(String.self, forKey: .Name)
        Exercises = try container.decode([NewSessionExercise].self, forKey: .Exercises)
        WorkoutId = try container.decode(String.self, forKey: .WorkoutId)
    }
}
