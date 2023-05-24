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
    
    enum CodingKeys:String ,CodingKey {
        case Id = "id"
        case Name = "name"
    }
    
    required init(from : Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)
        Id = try container.decode(UUID.self, forKey: .Id)
        Name = try container.decode(String.self, forKey: .Name)
    }
}
