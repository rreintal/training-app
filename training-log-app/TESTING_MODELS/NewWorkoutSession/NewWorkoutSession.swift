//
//  NewWorkoutSession.swift
//  training-log-app
//
//  Created by Richard Reintal on 14.05.2023.
//

import Foundation

class NewWorkoutSession : AppModel{
    var Name : String
    var CreatedAt : Date
    var Exercises : [NewSessionExercise]
    
    
    init(Name: String, CreatedAt: Date, Exercises: [NewSessionExercise]) {
        self.Name = Name
        self.CreatedAt = CreatedAt
        self.Exercises = Exercises
    }
}
