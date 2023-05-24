//
//  NewWorkout.swift
//  training-log-app
//
//  Created by Richard Reintal on 13.05.2023.
//

import Foundation


class NewWorkout : ObservableObject, AppModel{
    var AppUserId : UUID
    var Name : String
    
    @Published
    var Exercises : [NewWorkoutExercise] = []
    
    init(AppUserId: UUID, Name: String) {
        self.AppUserId = AppUserId
        self.Name = Name
    }
    
    enum CodingKeys: String, CodingKey {
            case AppUserId = "appUserId"
            case Name = "name"
            case Exercises = "newWorkoutExercises"
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            AppUserId = try container.decode(UUID.self, forKey: .AppUserId)
            Name = try container.decode(String.self, forKey: .Name)
            Exercises = try container.decode([NewWorkoutExercise].self, forKey: .Exercises)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(AppUserId, forKey: .AppUserId)
            try container.encode(Name, forKey: .Name)
            try container.encode(Exercises, forKey: .Exercises)
        }
}
