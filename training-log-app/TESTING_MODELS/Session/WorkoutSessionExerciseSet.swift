//
//  WorkoutSessionExerciseSet.swift
//  training-log-app
//
//  Created by Richard Reintal on 23.05.2023.
//

import Foundation

class WorkoutSessionExerciseSet : AppModel, Hashable {
    var id : String
    var Weight : Double
    var Repetitions : Int
    var SequenceNumber : Int
    
    static func == (lhs: WorkoutSessionExerciseSet, rhs: WorkoutSessionExerciseSet) -> Bool {
           return lhs.id == rhs.id
       }
       
       func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }
    
    init(Weight: Double, Repetitions: Int, SequenceNumber: Int) {
        self.id = "dev"
        self.Weight = Weight
        self.Repetitions = Repetitions
        self.SequenceNumber = SequenceNumber
    }
    
    enum CodingKeys:String, CodingKey {
        case id = "id"
        case Weight = "weight"
        case Repetitions = "repetitions"
        case SequenceNumber = "sequenceNumber"
    }
    
    required init(from : Decoder) throws {
        var cont = try from.container(keyedBy: CodingKeys.self)
        id = try cont.decode(String.self, forKey: .id)
        Weight = try cont.decode(Double.self, forKey: .Weight)
        Repetitions = try cont.decode(Int.self, forKey: .Repetitions)
        SequenceNumber = try cont.decode(Int.self, forKey: .SequenceNumber)
        
    }
    
    
   }

