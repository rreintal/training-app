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
}
