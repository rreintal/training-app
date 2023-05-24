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
    var workoutSession: NewWorkoutSession?
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(workoutSession?.Exercises ?? []) { e in
                    WorkoutViewExerciseComponent(
                        exerciseName: e.ExerciseName,
                        setAmount: e.Sets.count,
                        Exercise: e,
                        workoutId: workoutId.description)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            Button {
                // finish workout, send api call?
                Task {
                    // empty value tuleb tagasi!!
                    // TODO - prio 2 - responseModel või vaata koodi pealt
                    // error handling...
                    try? await AppEntry.AppState.WebController.sendRequest(
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
                // error handlinggggggggggg
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
