//
//  CreateWorkoutExerciseComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 01.05.2023.
//

import SwiftUI

struct CreateWorkoutExerciseComponent: View {
    
    @State
    var exerciseNotes = "";
    
    @State
    var isDeleteMenuPresent = false;
    
    
    @ObservedObject
    var exercise : NewWorkoutExercise
    
    // DEV
    @Binding
    var exercisesList : [NewWorkoutExercise]
    
    @State
    var setAmount = 0;
    
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle().frame(width: 50)
                            .foregroundColor(.gray)
                    Image(systemName: "dumbbell")
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                }
                Text(exercise.Name).foregroundColor(.blue)
                Spacer()
                Button {
                    // action
                    isDeleteMenuPresent.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(Angle(degrees: 90))
                }.confirmationDialog(
                    "Are you sure?", isPresented: $isDeleteMenuPresent)
                {
                    Button("Delete exercise", role: .destructive) {
                            // action - delete workout!
                            // tegelt pead archivema, kuna muidu ei näe overall statisticut!
                        
                        
                        if let index = exercisesList.firstIndex(of: exercise) {
                            print("INDEX ON  " + index.description)
                            exercisesList.remove(at: index)
                        }
                        
                        
                        
                    }
                    } message: {
                        Text("Are you sure you want to delete this exercise?")
                    }
            }
            .padding(.top, 10)
            HStack {
                TextField("Add exercise notes", text: $exerciseNotes)
            }
            
            HStack {
                VStack {
                    Text("SET").frame(width: 50)
                }
                Spacer()
                VStack {
                    Text("REP").frame(width: 50)
                }
                Spacer()
                VStack {
                    Text("KG").frame(width: 50)
                }
                Spacer()
                Spacer()
            }.foregroundColor(.gray)
                .font(.system(size: 15))
            
            ForEach((0..<exercise.SetsCount), id: \.self) {sequence in
                if(exercise.SetsCount < 1) {
                    
                }else {
                    CreateWorkoutExerciseSetComponent(setSequenceNumber: (sequence + 1).description)
                }
            }
            
            Button {
                exercise.SetsCount += 1
                print("Exercise \(exercise.Name) has \(exercise.SetsCount) sets")
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add set")
                    
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(8)
                .background(.gray.opacity(0.2))
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(.white, lineWidth: 1))
            }.padding([.top], 30)
            
        
            BottomLineRectangle()
                .stroke(.gray, lineWidth: 1)
                .frame(height: 10)
            
        }
        .frame(maxWidth: .infinity)
            .padding([.trailing, .leading, .bottom], 20)
            
    }
}

struct CreateWorkoutExerciseComponent_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkoutExerciseComponent(exerciseNotes: "Bench press", exercise: NewWorkoutExercise(ExerciseId: UUID(), Name: "aa", MuscleGroup: "aa", SequenceNumber: 0), exercisesList: .constant([]))
    }
}
