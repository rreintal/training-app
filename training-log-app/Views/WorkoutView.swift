//
//  WorkoutView.swift
//  training-log-app
//
//  Created by Richard Reintal on 01.05.2023.
//

import SwiftUI

struct WorkoutView: View {
    // siin läheb vaja workoutId, kuna muidu ei saa api calli teha!
    var workoutId : UUID
    
    
    @State
    var workoutSession: NewWorkoutSession? // declare as var
    
    var body: some View {
        VStack {
            ScrollView {
                /*
                ForEach(workoutSession.Exercises, id: \.self) { e in
                    WorkoutViewExerciseComponent(exerciseName: e.Name, setAmount: e.SetsCount)
                }
                 */
                ForEach(workoutSession?.Exercises ?? []) { e in
                    WorkoutViewExerciseComponent(exerciseName: e.ExerciseName, setAmount: e.Sets.count, Exercise: e)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            Button {
                // finish workout, send api call?
            } label: {
                Text("Finish")
            }
        }
        .onAppear{
            Task {
                workoutSession = await NewSessionAPI.GetNewWorkoutSession()
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workoutId: UUID() ,workoutSession: NewWorkoutSession(Name: "Aa", CreatedAt: Date(), Exercises: []))
    }
}
