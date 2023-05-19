//
//  NavigationBar.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//

import SwiftUI
import UIKit

struct NavigationBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
         
            TrainingMainView(workouts: [])
                .tabItem {
                    Image(systemName: "figure.strengthtraining.traditional")
                    Text("Training")
                }
         
            Text("TODO: Leaderboards or sth")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "crown")
                    Text("Group")
                }
         
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }.navigationBarHidden(true)
    }
}



struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
