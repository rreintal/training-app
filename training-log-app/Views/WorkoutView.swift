//
//  WorkoutView.swift
//  training-log-app
//
//  Created by Richard Reintal on 01.05.2023.
//

import SwiftUI

struct WorkoutView: View {
    @Environment(\.dismiss) var dismiss
    // siin läheb vaja workoutId, kuna muidu ei saa api calli teha!
    var workoutId : UUID
    
    
    @State
    var workoutSession: NewWorkoutSession? // declare as var
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(workoutSession?.Exercises ?? []) { e in
                    WorkoutViewExerciseComponent(exerciseName: e.ExerciseName, setAmount: e.Sets.count, Exercise: e)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            Button {
                // finish workout, send api call?
                Task {
                    //try await AppEntry.AppState.WebController.saveNewWorkoutSession(session: workoutSession!)
                    
                    // empty value tuleb tagasi!!
                    try await AppEntry.AppState.WebController.sendRequest(
                        urlString: "http://localhost:5187/api/v1.0/session/SaveNewWorkoutSession/",
                        method: HTTPMethod.POST,
                        payload: workoutSession!,
                        returnType: ErrorViewModel.self)
                    
                    dismiss.callAsFunction()
                    
                }
            } label: {
                Text("Finish")
            }
        }
        .onAppear{
            Task {
                // TODO!
                //workoutSession = try await AppEntry.AppState.WebController.getNewWorkoutSession(workoutId: workoutId.description)
                workoutSession = try await AppEntry.AppState.WebController.sendRequest(
                    urlString: "http://localhost:5187/api/v1.0/session/GetNewWorkoutSession/?workoutId=\(workoutId.description)",
                    method: HTTPMethod.GET,
                    payload: nil,
                    returnType: NewWorkoutSession.self)
            }
        }.onAppear{
            AppEntry.AppState.addView(view: dismiss)
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workoutId: UUID() ,workoutSession: NewWorkoutSession(workoutId: "a" ,Name: "Aa", Exercises: []))
    }
}
