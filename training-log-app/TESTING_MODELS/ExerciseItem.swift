//
//  ExerciseItem.swift
//  training-log-app
//
//  Created by Richard Reintal on 13.05.2023.
//

import Foundation


class ExerciseItem : Identifiable, AppModel{
    var Id : UUID
    var Name : String
    var MuscleGroup : String

    
    init(Name: String, MuscleGroup: String) {
        self.Id = UUID()
        self.Name = Name
        self.MuscleGroup = MuscleGroup
    }
    
    enum CodingKeys: String ,CodingKey {
        case Id = "exerciseId"
        case Name = "name"
        case MuscleGroup = "muscleGroupName"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        Id = try container.decode(UUID.self, forKey: .Id)
        Name = try container.decode(String.self, forKey: .Name)
        MuscleGroup = try container.decode(String.self, forKey: .MuscleGroup)
    }
    
}
