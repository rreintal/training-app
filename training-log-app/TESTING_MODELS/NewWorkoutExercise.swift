//
//  NewWorkoutExercise.swift
//  training-log-app
//
//  Created by Richard Reintal on 13.05.2023.
//

import Foundation

class NewWorkoutExercise: ObservableObject, Identifiable, Equatable, AppModel, Codable {
    var ExerciseId: UUID
    var Name: String
    var MuscleGroup: String
    @Published
    var SetsCount: Int = 1
    var SequenceNumber: Int
    
    init(ExerciseId: UUID, Name: String, MuscleGroup: String, SequenceNumber: Int) {
        self.ExerciseId = ExerciseId
        self.Name = Name
        self.MuscleGroup = MuscleGroup
        self.SequenceNumber = SequenceNumber
    }
    
    static func == (lhs: NewWorkoutExercise, rhs: NewWorkoutExercise) -> Bool {
        return lhs.ExerciseId == rhs.ExerciseId
            && lhs.Name == rhs.Name
            && lhs.MuscleGroup == rhs.MuscleGroup
            && lhs.SetsCount == rhs.SetsCount
            && lhs.SequenceNumber == rhs.SequenceNumber
    }
    
    enum CodingKeys: String, CodingKey {
        case ExerciseId = "exerciseId"
        case Name = "name"
        case MuscleGroup = "musclegroup"
        case SetsCount = "setsCount"
        case SequenceNumber = "sequenceNumber"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ExerciseId = try container.decode(UUID.self, forKey: .ExerciseId)
        Name = try container.decode(String.self, forKey: .Name)
        MuscleGroup = try container.decode(String.self, forKey: .MuscleGroup)
        SetsCount = try container.decode(Int.self, forKey: .SetsCount)
        SequenceNumber = try container.decode(Int.self, forKey: .SequenceNumber)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ExerciseId, forKey: .ExerciseId)
        try container.encode(Name, forKey: .Name)
        try container.encode(MuscleGroup, forKey: .MuscleGroup)
        try container.encode(SetsCount, forKey: .SetsCount)
        try container.encode(SequenceNumber, forKey: .SequenceNumber)
    }
}


