//
//  Person.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import Foundation
import SwiftUI

class Person : Identifiable, Hashable {
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.imageName == rhs.imageName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    var name : String
    var imageName : String
    
    init(name : String, imageName : String){
        self.name = name
        self.imageName = imageName
    }
}
