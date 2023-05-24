//
//  ProfileView.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    var spaceBetweenStatsAndDashboard : CGFloat = CGFloat(50)
    
    
    @State
    var isPresented = false;
    
    @StateObject
    var viewModel : ProfileViewModel = ProfileViewModel(Username: "EMTPY", TotalWorkoutsCount: 1, TotalVolumeCount: 1, FriendsCount: 1)
    
    @State
    var name = "EMPTY"
    
    var body: some View {
        VStack {
            // BRUH, miks nii töötab kui see siin viewis on!?!??!?!?!?!?!?!??!???!?!?
            // kui kasutan komponenti, siis closeAllViews() mängib mäkra
            Button {
                isPresented.toggle()
                
            } label: {
                HStack {
                    ZStack {
                        Circle()
                            .fill(.blue)
                            .frame(width: 60)
                        Image(systemName: "person")
                            .foregroundColor(.white)
                            .font(.system(size: CGFloat(30)))
                    }
                    Text(viewModel.Username)
                        .font(.system(size: 20))
                        .padding([.leading], 15)
                        .foregroundColor(.black)
                        
                }.confirmationDialog("Do you want to log out?", isPresented: $isPresented) {
                    Button("Log out", role: .destructive) {
                        // SEND LOGOUT REQUEST
                        print("Logging out!!")
                        AppEntry.AppState.closeAllViews()

                        
                    }
                }message: {
                    Text("Do you want to log out?")
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }.padding([.leading], 50)
                .padding([.bottom], 10)
                .padding([.top], 50)
            /*
            ProfileHeaderComponent(name: $viewModel.Username, onLogoutAction: logoutAction)
                .padding([.leading], 50)
                .padding([.bottom], 10)
                .padding([.top], 50)
             */
            
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
                var apiResult = try await AppEntry.AppState.WebController.sendRequest(
                    urlString: "http://localhost:5187/api/v1.0/Profile/GetProfileViewModel/?appUserId=\(AppEntry.AppState.appUserId!.description)",
                    method: HTTPMethod.GET,
                    payload: nil,
                    returnType: ProfileViewModel.self)
                
                    viewModel.Username = apiResult.Username
                    viewModel.FriendsCount = apiResult.FriendsCount
                    viewModel.TotalWorkoutsCount = apiResult.TotalWorkoutsCount
                    viewModel.TotalVolumeCount = apiResult.TotalVolumeCount
            }
        }.onAppear{
            AppEntry.AppState.addView(view: dismiss)
        }
    }
    
    
    func logoutAction() {
            // Perform logout action and close all views
            AppEntry.AppState.LogOut()
            AppEntry.AppState.closeAllViews()
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(Username: "Richard", TotalWorkoutsCount: 100, TotalVolumeCount: 2000, FriendsCount: 33))
    }
}
