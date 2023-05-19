//
//  WorkoutStatisticsExerciseComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 28.02.2023.
//

import SwiftUI

struct WorkoutStatisticsExerciseComponent: View {
    var totalProgress = "10"
    var exerciseName = "Bench press"
    var setsCount = 3
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(exerciseName)
                Text("(+\(totalProgress) kg)").foregroundColor(.green)
            }.font(.title3)
                .fontWeight(.medium)
            ForEach(0..<setsCount) { item in
                HStack {
                    Text("10 x 82.5 kg")
                    Text("(+\((10.0 / Double(setsCount)), specifier: "%.2f") kg)").foregroundColor(.green)
                }.fontWeight(.light)
            }
            
            
            
        }
    }
}

struct WorkoutStatisticsExerciseComponent_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutStatisticsExerciseComponent()
    }
}
