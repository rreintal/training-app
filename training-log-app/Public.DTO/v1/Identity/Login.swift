//
//  Login.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.04.2023.
//

import Foundation

class Login : Codable{
    
    public var Email : String?
    public var Password : String?
    
    init(Email: String, Password: String) {
        self.Email = Email
        self.Password = Password
    }
    init() {
        
    }
}
