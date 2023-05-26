//
//  WorkoutResultExerciseSetComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 24.05.2023.
//

import SwiftUI

struct WorkoutResultExerciseSetComponent: View {
    
    var set : WorkoutResultExerciseSet
    
    var body: some View {
        HStack {
            Text(set.reps.description)
            Text("x")
            Text("\(set.weight.description) kg")
            Text("[\(set.change < 0 ? "" : "+") \(set.change.description) kg]")
        }.foregroundColor(isChangePositive(v: set.change))
            .fontDesign(.monospaced)
    }
    
    func isChangePositive(v : Double) -> Color {
        if v < 0 {
            return Color.red
        }
        if v > 0 {
            return Color.green
        }
        return Color.gray
    }
}

struct WorkoutResultExerciseSetComponent_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutResultExerciseSetComponent(set: WorkoutResultExerciseSet.init())
    }
}
