//
//  CreateWorkoutView.swift
//  training-log-app
//
//  Created by Richard Reintal on 27.02.2023.
//

import SwiftUI

struct CreateWorkoutView: View {
    
    @Environment(\.dismiss) var dismiss

    @State
    var workoutTitle = ""
    
    @ObservedObject
    var workout : NewWorkout = NewWorkout(AppUserId: UUID(uuidString: AppEntry.AppState.appUserId!)!, Name: "")
    
    // VEIDER
    @State
    var exercises : [NewWorkoutExercise] = []
     
    
    @State
    var showAlert = false
    
    @State
    var errorMessage = ""
    
    
    var body: some View {
        VStack {
            VStack {
                TextField("Workout title", text: $workoutTitle)
                BottomLineRectangle()
                    .stroke(.gray, lineWidth: 1)
                    .offset(y: -7)
            }.frame(height: 35)
            
            if workout.Exercises.count == 0 {
                VStack {
                    Image(systemName: "dumbbell")
                        .padding(5)
                        .foregroundColor(.blue)
                    Text("Get started by adding exercises to your workout!")
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                        .fontWeight(.thin)
                }.padding([.top], 15)
            }
            
            // siin displayn olemasolevad exercised
            ScrollView{
                ForEach(workout.Exercises) { WorkoutExercise in
                    CreateWorkoutExerciseComponent(exercise: WorkoutExercise, exercisesList: $workout.Exercises)
                }
            }
            
            
            
            // add exercise button
            
            NavigationLink {
                AddExerciseView(newWorkout: workout)
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add exercise")
                    
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(8)
                .background(.blue)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(.blue, lineWidth: 2))
            }.padding([.bottom], 30)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding([.leading, .trailing], 10)
        .padding([.top], 30)
        .toolbar {
            Button {
                // save workout
                // KUI NIMI POLE SALVESTATUD, SIIS ÄRA LASE SALVESTADA
                
                // SAADA SEE BACKENDI, JA BACKEND ISE TAGASTAB UUE WORKOUTI EELMISES VIEWIS!!!
                // TODO
                
                if(workoutTitle == "") {
                    self.errorMessage = "Workout must have a title!"
                    showAlert = true
                }else if(workout.Exercises.count == 0) {
                    self.errorMessage = "Workout must have atleast one exercise!"
                    showAlert = true
                }
                else {
                    print("Salvestan ja saadan db!")
                    dismiss()
                }
                
            } label: {
                Text("Save")
            }.alert(errorMessage, isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }

        }
    }
}

struct CreateWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkoutView(workout: NewWorkout(AppUserId: UUID(), Name: "New workout name"))
    }
}
