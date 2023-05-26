//
//  WorkoutResultExerciseComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 24.05.2023.
//

import SwiftUI

struct WorkoutResultExerciseComponent: View {
    
    var exercise : WorkoutResultExercise
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(exercise.ExerciseName)
            ForEach(exercise.Sets, id: \.self) { item in
                WorkoutResultExerciseSetComponent(set: item)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct WorkoutResultExerciseComponent_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutResultExerciseComponent(exercise: WorkoutResultExercise.init())
    }
}
