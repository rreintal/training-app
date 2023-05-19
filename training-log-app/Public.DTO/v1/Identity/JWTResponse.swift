//
//  JWTResponse.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.04.2023.
//

import Foundation



// TODO

class JWTResponse : Codable {
    public var JWT : String
    public var RefreshToken : String
    public var AppUserId : String?
    
    
    enum CodingKeys: String, CodingKey {
        case JWT = "jwt"
        case RefreshToken = "refreshToken"
        case AppUserId = "appUserId"
        
    }
}
