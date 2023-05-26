//
//  WorkoutSession.swift
//  training-log-app
//
//  Created by Richard Reintal on 23.05.2023.
//

import Foundation

class WorkoutSession : AppModel, Hashable {
    var Id : String
    var Name : String // name + date - DATE!
    var Exercises : [WorkoutSessionExercise]
    
    
    init(Name: String) {
        self.Id = "22"
        self.Name = Name
        self.Exercises = [WorkoutSessionExercise()]
    }
    
    enum CodingKeys: String, CodingKey {
        case Id = "id"
        case Name = "name"
        case Exercises = "sessionExercises"
    }
    
    required init(from : Decoder) throws {
        let cont = try from.container(keyedBy: CodingKeys.self)
        Id = try cont.decode(String.self, forKey: .Id)
        Name = try cont.decode(String.self, forKey: .Name)
        Exercises = try cont.decode([WorkoutSessionExercise].self, forKey: .Exercises)
    }
    
    static func == (lhs: WorkoutSession, rhs: WorkoutSession) -> Bool {
            return lhs.Id == rhs.Id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(Id)
        }
}
