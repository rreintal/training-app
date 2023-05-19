//
//  AppState.swift
//  training-log-app
//
//  Created by Richard Reintal on 18.04.2023.
//

import Foundation

class AppState : ObservableObject{
    
    // mby tee AppUser siia??
    
    @Published
    var username : String = "";
    
    @Published
    var email : String = "";
    
    @Published
    var isLoggedIn : Bool = false;
    
    @Published
    var jwt : String?
    
    @Published
    var refreshToken : String?
    
    @Published
    var appUserId : String?
    
    @Published
    var exerciseItems : [ExerciseItem]
    
    public var WebController : WebController
    
    init() {
        WebController = training_log_app.WebController()
        
        // fetchi EXERCISED
        exerciseItems = ExerciseItemsAPI.GetExerciseItems()
        
        // DEV!!!
        appUserId = "0d177a5c-f11a-11ed-a05b-0242ac120003"
    }
}
