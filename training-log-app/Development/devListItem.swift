//
//  devListItem.swift
//  training-log-app
//
//  Created by Richard Reintal on 20.02.2023.
//

import Foundation

class DevListItem : Identifiable, Hashable {
    
    
    var name : String
    
    init(_ name : String) {
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
        
        static func == (lhs: DevListItem, rhs: DevListItem) -> Bool {
            return lhs.name == rhs.name
        }
}
