//
//  UsersAPI.swift
//  training-log-app
//
//  Created by Richard Reintal on 12.05.2023.
//

import Foundation


class UsersAPI {
    
    
    public static func GetMoreUsers() async -> [User] {
        var users : [User] =
        [
            User(Name: "NOT"),
            User(Name: "IMPLEMENTED"),
            User(Name: "YET"),
            User(Name: ":("),
            User(Name: "COMING"),
            User(Name: "SOON!"),
        ]
        return users;
    }
}
