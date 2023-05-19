//
//  AddExerciseComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 01.05.2023.
//

import SwiftUI

struct AddExerciseComponent: View {
    
    
    var presentationMode : DismissAction?
    
    var exerciseItem : ExerciseItem
    
    
    // var anna siia sisse see Workout, siis lisa see exercise sinna workouti!
    //@Binding
    //var workoutExercises : [String]
    
    @ObservedObject
    var workout : NewWorkout
    
    var body: some View {
        Button {
            // siin tee mapping!
            // TEE MAPPER
            let newWorkoutExercise = NewWorkoutExercise(
                ExerciseId: exerciseItem.Id,
                Name: exerciseItem.Name,
                MuscleGroup: exerciseItem.MuscleGroup,
                SequenceNumber: workout.Exercises.count + 1)
            
            // lisa workoutile
            workout.Exercises.append(newWorkoutExercise)
            
            presentationMode!.callAsFunction()
        } label: {
            HStack {
                ZStack {
                    Circle().frame(width: 50)
                            .foregroundColor(.gray)
                    Image(systemName: "dumbbell")
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                }
                VStack(alignment: .leading) {
                    Text(exerciseItem.Name)
                        .font(.system(size: 21))
                    Text(exerciseItem.MuscleGroup)
                        .font(.system(size: 15))
                }
                Spacer()
            }
            .frame(height: 80)
            .overlay(BottomLineRectangle()
                .stroke(.gray, lineWidth: 1)
                .offset(y: -7))
        }
        .buttonStyle(.plain)
    }
}

struct AddExerciseComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseComponent(exerciseItem: ExerciseItem(Name: "Bench press", MuscleGroup: "Chest"), workout: NewWorkout(AppUserId: UUID(), Name: "aa"))
    }
}
