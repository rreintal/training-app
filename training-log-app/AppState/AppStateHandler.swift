//
//  AppStateHandler.swift
//  training-log-app
//
//  Created by Richard Reintal on 19.05.2023.
//

import Foundation


class AppStateHandler {
    
    static func UpdateJwt(changes : JWTResponse, appState : AppState) {
        appState.jwt = changes.JWT
        appState.refreshToken = changes.RefreshToken
    }
    
}
