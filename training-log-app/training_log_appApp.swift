//
//  training_log_appApp.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//

import SwiftUI

@main
struct training_log_appApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
