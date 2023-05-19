//
//  TWorkout.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import Foundation

class TWorkout {
    var name : String // push, pull, legs, upper ...
    var exercises : [TExercise]
    
    init(name: String, exercises: [TExercise]) {
        self.name = name
        self.exercises = exercises
    }
}
