//
//  Users.swift
//  training-log-app
//
//  Created by Richard Reintal on 12.05.2023.
//

import Foundation

class User : Identifiable, AppModel{
    var Id : UUID
    var Name : String
    
    init(Name: String) {
        self.Id = UUID()
        self.Name = Name
    }
}
