//
//  SessionViewExerciseComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 23.05.2023.
//

import SwiftUI

struct SessionViewExerciseComponent: View {
    
    var sessionExercise : WorkoutSessionExercise
    
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
                Text(sessionExercise.ExerciseName.description).foregroundColor(.blue)
                Spacer()
                
                
                
            }
            .padding(.top, 10)
            .padding(.bottom, 15)
            HStack {
                //TextField("Add exercise notes", text: $exerciseNotes)
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
            
            ForEach(sessionExercise.Sets, id: \.self) {exerciseSet in
                SessionViewSetComponent(ExerciseSet: exerciseSet)
                
                
                //CreateWorkoutExerciseSetComponent(setSequenceNumber: ExerciseSet.SequenceNumber.description, ExerciseSet: ExerciseSet)
            }

        
            BottomLineRectangle()
                .stroke(.gray, lineWidth: 1)
                .frame(height: 10)
            
        }
        .frame(maxWidth: .infinity)
            .padding([.trailing, .leading, .bottom], 20)
    }
}

struct SessionViewExerciseComponent_Previews: PreviewProvider {
    static var previews: some View {
        SessionViewExerciseComponent(sessionExercise: WorkoutSessionExercise())
    }
}
