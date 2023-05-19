//
//  UsersAPI.swift
//  training-log-app
//
//  Created by Richard Reintal on 12.05.2023.
//

import Foundation


class UsersAPI {
    
    public static func GetUsers() -> [User] {
        var users : [User] =
        [
            User(Name: "Richard"),
            User(Name: "Marten"),
            User(Name: "Margus"),
            User(Name: "Marianne"),
            User(Name: "Maarja"),
            User(Name: "Melissa"),
        ]
        return users;
    }
    
    public static func GetMoreUsers() async -> [User] {
        var users : [User] =
        [
            User(Name: "AA"),
            User(Name: "BB"),
            User(Name: "CC"),
            User(Name: "DD"),
            User(Name: "GG"),
            User(Name: "LL"),
        ]
        return users;
    }
}
