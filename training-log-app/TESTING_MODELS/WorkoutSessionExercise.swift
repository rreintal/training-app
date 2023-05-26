//
//  WorkoutSessionExercise.swift
//  training-log-app
//
//  Created by Richard Reintal on 23.05.2023.
//

import Foundation


class WorkoutSessionExercise : AppModel, Hashable {
    var id : String
    var ExerciseName : String
    var Sets : [WorkoutSessionExerciseSet]
    //var SequenceNumber : Int
    
    
    init() {
        self.id = "1"
        //self.SequenceNumber = 1
        self.ExerciseName = "Bench press"
        self.Sets = [WorkoutSessionExerciseSet(Weight: 200, Repetitions: 8, SequenceNumber: 1)]
    }
    
    static func == (lhs: WorkoutSessionExercise, rhs: WorkoutSessionExercise) -> Bool {
        return lhs.id == rhs.id;
      }
      
      func hash(into hasher: inout Hasher) {
          hasher.combine(id)
      }
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case ExerciseName = "exerciseName"
        case Sets = "sets"
        //case SequenceNumber
    }
    
    required init(from : Decoder) throws {
        var cont = try from.container(keyedBy: CodingKeys.self)
        id = try cont.decode(String.self, forKey: .id)
        ExerciseName = try cont.decode(String.self, forKey: .ExerciseName)
        Sets = try cont.decode([WorkoutSessionExerciseSet].self, forKey: .Sets)
        //SequenceNumber = cont.decode(Int.self, forKey: .)
    }
    
    
}
