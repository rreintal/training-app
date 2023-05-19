//
//  WorkoutExercise.swift
//  training-log-app
//
//  Created by Richard Reintal on 13.05.2023.
//

import Foundation

class WorkoutExercise : Hashable, AppModel{
    
    var ExerciseId : UUID
    var Name : String
    var SetsCount : Int
    var SequenceNumber : Int
    
    init(Id: UUID, Name: String, SetsCount: Int, SequenceNumber: Int) {
        self.ExerciseId = Id
        self.Name = Name
        self.SetsCount = SetsCount
        self.SequenceNumber = SequenceNumber
    }
    
    static func == (lhs: WorkoutExercise, rhs: WorkoutExercise) -> Bool {
            return lhs.ExerciseId == rhs.ExerciseId && lhs.Name == rhs.Name && lhs.SetsCount == rhs.SetsCount && lhs.SequenceNumber == rhs.SequenceNumber
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(ExerciseId)
            hasher.combine(Name)
            hasher.combine(SetsCount)
            hasher.combine(SequenceNumber)
        }
}
