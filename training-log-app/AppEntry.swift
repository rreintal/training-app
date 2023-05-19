//
//  AppEntry.swift
//  training-log-app
//
//  Created by Richard Reintal on 20.02.2023.
//

import Foundation
import SwiftUI

@main
struct AppEntry: App {
    let persistenceController = PersistenceController.shared
    
    public static var headingFontSize : CGFloat = CGFloat(24)
    
    public static var textFieldSizeMobilePortrait : CGFloat = CGFloat(70)
    
    public static var AppState : AppState = training_log_app.AppState()
    
    
    // tee kas eraldi View?? või tee mingi uus Objekt mis hoiab neid objekte enda sees, mby appstate??!?
    public static var PrimaryBackground = LinearGradient(
        gradient: Gradient(colors: [.blue, Color(#colorLiteral(red: 0.4274509804, green: 0.8352941176, blue: 0.9803921569, alpha: 1))]),
        startPoint: .bottom,
        endPoint: .top
    )
    
    var body: some Scene {
        WindowGroup {
            StartView()
            //NavigationBar()
        }
    }
}
