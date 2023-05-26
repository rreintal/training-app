//
//  ErrorViewModel.swift
//  training-log-app
//
//  Created by Richard Reintal on 24.05.2023.
//

import Foundation


class ErrorViewModel : AppModel{
    var error : String
    var status : Int
    
    enum CodingKeys: String, CodingKey {
        case error = "error"
        case status = "status"
    }
    
    required init(from : Decoder) throws{
        let c = try from.container(keyedBy: CodingKeys.self)
        error = try c.decode(String.self, forKey: .error)
        status = try c.decode(Int.self, forKey: .status)
    }
}
