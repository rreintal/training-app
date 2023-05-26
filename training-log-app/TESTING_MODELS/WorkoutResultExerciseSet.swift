//
//  WorkoutResultExerciseSet.swift
//  training-log-app
//
//  Created by Richard Reintal on 24.05.2023.
//

import Foundation


class WorkoutResultExerciseSet : AppModel, Hashable{
    var reps : Int
    var weight : Double
    var change : Double
    
    init() {
        self.reps = 0
        self.weight = 0
        self.change = 0
    }
    
    enum CodingKeys: String, CodingKey {
        case reps = "reps"
        case weight = "weight"
        case change = "change"
    }
    
    required init(from : Decoder) throws {
        let c = try from.container(keyedBy: CodingKeys.self)
        reps = try c.decode(Int.self, forKey:.reps)
        weight = try c.decode(Double.self, forKey: .weight)
        change = try c.decode(Double.self, forKey: .change)
    }
    static func == (lhs: WorkoutResultExerciseSet, rhs: WorkoutResultExerciseSet) -> Bool {
            return lhs.reps == rhs.reps && lhs.weight == rhs.weight && lhs.change == rhs.change
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(reps)
            hasher.combine(weight)
            hasher.combine(change)
        }
    
    
    
}

