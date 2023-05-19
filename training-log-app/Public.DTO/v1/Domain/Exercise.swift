//
//  Exercise.swift
//  training-log-app
//
//  Created by Richard Reintal on 01.05.2023.
//

import Foundation

class Exercise2 : Codable{
    var id : String
    var name : String
    var setCount : Int
    
    enum CodingKeys:String, CodingKey {
        case id = "id"
        case name = "name"
        case setCount = "setCount"
    }
    
}
