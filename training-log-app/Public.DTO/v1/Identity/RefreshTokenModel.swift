//
//  RefreshToken.swift
//  training-log-app
//
//  Created by Richard Reintal on 19.05.2023.
//

import Foundation

class RefreshTokenModel : Codable {
    var JWT : String
    var refreshToken : String
    var appUserId : String?
    
    enum CodingKeys: String, CodingKey {
        case JWT = "jwt"
        case refreshToken = "refreshToken"
        case appUserId = "appUserId"
    }
    
    init(JWT: String, refreshToken: String) {
        self.JWT = JWT
        self.refreshToken = refreshToken
    }
}
