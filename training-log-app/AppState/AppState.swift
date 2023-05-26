//
//  AppState.swift
//  training-log-app
//
//  Created by Richard Reintal on 18.04.2023.
//

import Foundation
import SwiftUI

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
    var views : [DismissAction] = []
    
    @Published
    var loginViews : [DismissAction] = []
    
    @Published
    var registerViews : [DismissAction] = []
    
    public func cleanIdentityViews(ar : [DismissAction]) {
        for v in ar {
            v.callAsFunction()
        }
    }
    
    
    // HACK, et saaks ilusti nupuga välja logida!!!
    @Published
    var logOut = false
    
    //@Published
    //var exerciseItems : [ExerciseItem]
    
    public func LogOut() {
        username = ""
        email = ""
        isLoggedIn = false
        jwt = ""
        refreshToken = ""
        views = []
    }
    
    public var WebController : WebController
    
    public func closeAllViews() {
        for view in views {
            view.callAsFunction()
        }
    }
    
    
    public func addView(view : DismissAction) {
        views.append(view)

    }
    
    init() {
        WebController = training_log_app.WebController()
        
        // DEV!!!
        appUserId = "0d177a5c-f11a-11ed-a05b-0242ac120003"
    }
}
