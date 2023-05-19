//
//  ProfileView.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct ProfileView: View {
    
    var spaceBetweenStatsAndDashboard : CGFloat = CGFloat(50)
    
    @StateObject
    var viewModel : ProfileViewModel = ProfileViewModel(Username: "EMTPY", TotalWorkoutsCount: 1, TotalVolumeCount: 1, FriendsCount: 1)
    
    var body: some View {
        VStack {
            ProfileHeaderComponent(name: $viewModel.Username)
                .padding([.leading], 50)
                .padding([.bottom], 10)
                .padding([.top], 50)
            
            ProfileStatsComponent(
                workoutsCount: $viewModel.TotalWorkoutsCount,
                friendsCount: $viewModel.FriendsCount,
                totalVolumeCount: $viewModel.TotalVolumeCount
            )
            .padding([.bottom], spaceBetweenStatsAndDashboard)
            
            ProfileDashboardComponent()
                .padding([.bottom], 30)
            ProfileViewCalendarComponent()
                .frame(width: 340)
            Spacer()
        }.onAppear{
            Task {
                // API CALL
                viewModel.Username = "Richard Reintal"
                viewModel.TotalWorkoutsCount = 102
                viewModel.TotalVolumeCount = 2000
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(Username: "Richard", TotalWorkoutsCount: 100, TotalVolumeCount: 2000, FriendsCount: 33))
    }
}
