//
//  IdentityValidation.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.04.2023.
//

import Foundation

class IdentityValidation {
    
    // TODO
    // Uuri välja kuidas backendist valideerimised küsida!
    
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        // Password must be at least 8 characters long
        guard password.count >= 8 else { return false }
        
        // Password must contain at least one uppercase letter
        let uppercaseLetterRegEx  = ".*[A-Z]+.*"
        let uppercaseLetterTest = NSPredicate(format:"SELF MATCHES %@", uppercaseLetterRegEx)
        guard uppercaseLetterTest.evaluate(with: password) else { return false }
        
        // Password must contain at least one lowercase letter
        let lowercaseLetterRegEx  = ".*[a-z]+.*"
        let lowercaseLetterTest = NSPredicate(format:"SELF MATCHES %@", lowercaseLetterRegEx)
        guard lowercaseLetterTest.evaluate(with: password) else { return false }
        
        // Password must contain at least one digit
        let digitRegEx  = ".*\\d+.*"
        let digitTest = NSPredicate(format:"SELF MATCHES %@", digitRegEx)
        guard digitTest.evaluate(with: password) else { return false }
        
        // Password must contain at least one non-alphanumeric character
        let specialCharRegEx  = ".*\\W+.*"
        let specialCharTest = NSPredicate(format:"SELF MATCHES %@", specialCharRegEx)
        guard specialCharTest.evaluate(with: password) else { return false }
        
        // All requirements are met
        return true
    }
    
    static func isValidFirstName(_ firstName: String) -> Bool {
            // First name must not be empty
            guard !firstName.isEmpty else { return false }
            
            // First name must not contain any digits or special characters
            let nameRegEx  = "^[a-zA-Z]*$"
            let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
            return nameTest.evaluate(with: firstName)
    }
    
    static func isValidUsername(_ username: String) -> Bool {
            // Username must not be empty
            guard !username.isEmpty else { return false }
            
            // Username must be between 3 and 50 characters long
            guard username.count >= 3 && username.count <= 64 else { return false }
            
            // Username must contain only letters, numbers, underscores, or hyphens
            let usernameRegEx  = "^[a-zA-Z0-9_-]*$"
            let usernameTest = NSPredicate(format:"SELF MATCHES %@", usernameRegEx)
            return usernameTest.evaluate(with: username)
        }

}
