//
//  Register.swift
//  training-log-app
//
//  Created by Richard Reintal on 18.04.2023.
//

import Foundation

class Register : Codable {
    public var Email : String
    public var Password : String
    public var FirstName : String
    public var LastName : String
    public var UserName : String
    
    
    init(Email: String, Password: String, FirstName: String, LastName: String, UserName: String) {
        self.Email = Email
        self.Password = Password
        self.FirstName = FirstName
        self.LastName = LastName
        self.UserName = UserName
    }
    
    enum CodingKeys:String ,CodingKey {
        case Email = "email"
        case Password = "password"
        case FirstName = "firstName"
        case LastName = "lastName"
        case UserName = "username"
    }
    
    required init(from : Decoder) throws{
        let c = try from.container(keyedBy: CodingKeys.self)
        Email = try c.decode(String.self, forKey: .Email)
        Password = try c.decode(String.self, forKey: .Password)
        FirstName = try c.decode(String.self, forKey: .FirstName)
        LastName = try c.decode(String.self, forKey: .LastName)
        UserName = try c.decode(String.self, forKey: .UserName)
    }
}
