//
//  TProgram.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import Foundation

class TProgram {
    var name : String
    var workouts : [TWorkout]
    
    init(name: String, workouts: [TWorkout]) {
        self.name = name
        self.workouts = workouts
    }
    
}
