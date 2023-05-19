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
}
