//
//  ItemWithName.swift
//  training-log-app
//
//  Created by Richard Reintal on 19.05.2023.
//

import Foundation


class ItemWithName : AppModel{
    var Name : String
    
    init(Name: String) {
        self.Name = Name
    }
    
    enum CodingKeys: String, CodingKey {
        case Name = "name"
    }
}
