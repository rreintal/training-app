//
//  NewSessionExerciseSet.swift
//  training-log-app
//
//  Created by Richard Reintal on 14.05.2023.
//

import Foundation

class NewSessionExerciseSet : Identifiable, AppModel{
    
    var Wegiht : Double
    var Repetitions : Int
    var SequenceNumber : Int
    
    init(Wegiht: Double, Repetitions: Int, SequenceNumber: Int) {
        self.Wegiht = Wegiht
        self.Repetitions = Repetitions
        self.SequenceNumber = SequenceNumber
    }
}
