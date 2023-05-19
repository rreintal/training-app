//
//  NewSessionExercise.swift
//  training-log-app
//
//  Created by Richard Reintal on 14.05.2023.
//

import Foundation


class NewSessionExercise: Hashable, Identifiable, AppModel, Codable {
    var ExerciseId: UUID
    var ExerciseName: String
    
    @Published
    var Sets: [NewSessionExerciseSet]
    
    init(ExerciseName: String, Sets: [NewSessionExerciseSet]) {
        self.ExerciseId = UUID()
        self.ExerciseName = ExerciseName
        self.Sets = Sets
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ExerciseId)
    }
    
    static func == (lhs: NewSessionExercise, rhs: NewSessionExercise) -> Bool {
        return lhs.ExerciseId == rhs.ExerciseId
    }
    
    enum CodingKeys: String, CodingKey {
        case ExerciseId = "exerciseId"
        case ExerciseName = "exerciseName"
        case Sets = "sets"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ExerciseId = try container.decode(UUID.self, forKey: .ExerciseId)
        ExerciseName = try container.decode(String.self, forKey: .ExerciseName)
        Sets = try container.decode([NewSessionExerciseSet].self, forKey: .Sets)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ExerciseId, forKey: .ExerciseId)
        try container.encode(ExerciseName, forKey: .ExerciseName)
        try container.encode(Sets, forKey: .Sets)
    }
}
