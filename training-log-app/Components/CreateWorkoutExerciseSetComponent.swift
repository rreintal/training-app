//
//  CreateWorkoutExerciseSetComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 01.05.2023.
//

import SwiftUI

struct CreateWorkoutExerciseSetComponent: View {
    // var exercise??
    // var set
    
    @State
    var reps = ""
    
    @State
    var weight = ""
    
    @State
    var setSequenceNumber : String
    
    @State
    var showWeightText = true
    
    @State
    var showRepsText = true
    
    var ExerciseSet : NewSessionExerciseSet
    
    // If this isnt added then there is no way to close the keyboard!!
    @FocusState private var focusReps: Bool
    @FocusState private var focusWeight: Bool
    
    
    var body: some View {
        HStack {
            VStack {
                Text(setSequenceNumber).frame(width: 50)
            }
            Spacer()
            VStack {
                TextField("-", text: $reps).frame(width: 50)
                    .onChange(of: reps, perform: { newValue in
                        ExerciseSet.Repetitions = Int(reps) ?? 0
                    })
                    .multilineTextAlignment(TextAlignment.center)
                    .keyboardType(.numberPad)
                    .focused($focusReps)
                    .onTapGesture {
                        focusReps = false
                    }
            }
            Spacer()
            VStack {
                TextField("-", text: $weight).frame(width: 50)
                    .onChange(of: weight, perform: { newValue in
                        ExerciseSet.Weight = Double(weight) ?? 0.0
                    })
                    .multilineTextAlignment(TextAlignment.center)
                    .keyboardType(.numberPad)
                    .focused($focusWeight)
                    .onTapGesture {
                        focusWeight = false
                    }
            }
            Spacer()
            Spacer()
        }
    }
}


struct CreateWorkoutExerciseSetComponent_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkoutExerciseSetComponent(setSequenceNumber: "1", ExerciseSet: NewSessionExerciseSet(Wegiht: 10, SequenceNumber: 1, Repetitons: 15))
    }
}
