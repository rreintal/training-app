//
//  WorkoutResultExercise.swift
//  training-log-app
//
//  Created by Richard Reintal on 24.05.2023.
//

import Foundation


class WorkoutResultExercise : AppModel, Hashable{
    
    var ExerciseName : String
    var Sets : [WorkoutResultExerciseSet]
    
    enum CodingKeys: String, CodingKey {
        case ExerciseName = "exerciseName"
        case Sets = "sets"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ExerciseName = try container.decode(String.self, forKey: .ExerciseName)
        self.Sets = try container.decode([WorkoutResultExerciseSet].self, forKey: .Sets)
    }
    
    init() {
        ExerciseName = ""
        Sets = []
    }
    
    static func == (lhs: WorkoutResultExercise, rhs: WorkoutResultExercise) -> Bool {
           return lhs.ExerciseName == rhs.ExerciseName && lhs.Sets == rhs.Sets
       }
       
       func hash(into hasher: inout Hasher) {
           hasher.combine(ExerciseName)
           hasher.combine(Sets)
       }
}

