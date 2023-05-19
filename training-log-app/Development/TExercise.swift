//
//  TExercise.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import Foundation

class TExercise {
    var name : String
    var sets : [TSet]
    
    init(name: String, sets: [TSet]) {
        self.name = name
        self.sets = sets
    }
}
