//
//  StatisticsView.swift
//  training-log-app
//
//  Created by Richard Reintal on 23.05.2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    
    @State
    var workoutSessions : [WorkoutSession] = []
    
    var body: some View {
        VStack {
            ScrollView{
                Group {
                    if workoutSessions.count == 0 {
                        HStack {
                            
                            Text("You don't have workout sessions yet.").multilineTextAlignment(.center)
                            Image(systemName: "figure.strengthtraining.traditional")
                        }
                        .foregroundColor(.gray)
                    }else {
                        ForEach(workoutSessions, id: \.self) { session in
                            StatisticsViewSessionButton(name: session.Name, navigationView: SessionView(Session: session))
                        }
                    }
                }
                
                
            }.padding([.leading, .trailing])
                .padding([.top], 50)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Statistics")
            .onAppear{
                Task {
                    
                    workoutSessions = try await AppEntry.AppState.WebController.sendRequest(
                        urlString: "https://hajusapp.azurewebsites.net/api/v1.0/session/GetUserWorkoutSessions/?appUserId=\(AppEntry.AppState.appUserId!.description)",
                        method: HTTPMethod.GET,
                        payload: nil,
                        returnType: [WorkoutSession].self)
                    
                    
                }
            }.onAppear{
                AppEntry.AppState.addView(view: dismiss)
            }
            
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(workoutSessions: [])
    }
}
