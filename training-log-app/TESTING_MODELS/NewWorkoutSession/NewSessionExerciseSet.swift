//
//  NewSessionExerciseSet.swift
//  training-log-app
//
//  Created by Richard Reintal on 14.05.2023.
//

import Foundation

class NewSessionExerciseSet : Identifiable, AppModel{
    
    var Weight : Double
    var SequenceNumber : Int
    var Repetitions : Int
    
    init(Wegiht: Double, SequenceNumber: Int, Repetitons : Int) {
        self.Weight = Wegiht
        self.SequenceNumber = SequenceNumber
        self.Repetitions = Repetitons
    }
    
    enum CodingKeys: String, CodingKey {
        case Weight = "weight"
        case SequenceNumber = "sequenceNumber"
        case Repetitions = "repetitions"
    }
    
    required init(from : Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)
        Weight = try container.decode(Double.self, forKey: .Weight)
        SequenceNumber = try container.decode(Int.self, forKey: .SequenceNumber)
        Repetitions = try container.decode(Int.self, forKey: .Repetitions)
    }
}
