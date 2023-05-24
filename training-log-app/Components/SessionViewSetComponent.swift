//
//  SessionViewSetComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 23.05.2023.
//

import SwiftUI

struct SessionViewSetComponent: View {
    var ExerciseSet : WorkoutSessionExerciseSet
    
    
    var body: some View {
        HStack {
            VStack {
                Text(ExerciseSet.SequenceNumber.description).frame(width: 50)
            }
            Spacer()
            VStack {
                Text(ExerciseSet.Repetitions.description).frame(width: 50)
            }
            Spacer()
            VStack {
                Text(ExerciseSet.Weight.description).frame(width: 70)
            }
            Spacer()
            Spacer()
        }
    }
}

struct SessionViewSetComponent_Previews: PreviewProvider {
    static var previews: some View {
        SessionViewSetComponent(ExerciseSet: WorkoutSessionExerciseSet(Weight: 20, Repetitions: 10, SequenceNumber: 1))
    }
}
