//
//  WorkoutResultModel.swift
//  training-log-app
//
//  Created by Richard Reintal on 24.05.2023.
//

import Foundation

 
class WorkoutResult : AppModel, Hashable{
    var totalChange : Double
    var Exercises : [WorkoutResultExercise]
    
    enum CodingKeys: String, CodingKey {
        case totalChange = "totalChange"
        case Exercises = "exercises"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalChange = try container.decode(Double.self, forKey: .totalChange)
        self.Exercises = try container.decode([WorkoutResultExercise].self, forKey: .Exercises)
    }
    
    static func == (lhs: WorkoutResult, rhs: WorkoutResult) -> Bool {
            return lhs.totalChange == rhs.totalChange && lhs.Exercises == rhs.Exercises
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(totalChange)
            hasher.combine(Exercises)
        }

}

 
 
