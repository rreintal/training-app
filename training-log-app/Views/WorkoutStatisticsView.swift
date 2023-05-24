//
//  WorkoutStatisticsView.swift
//  training-log-app
//
//  Created by Richard Reintal on 28.02.2023.
//

import SwiftUI

struct WorkoutStatisticsView: View {
    
    @Environment(\.dismiss) private var dismiss
    var exerciseNames = ["Bench press",
                         "Shoulder press",
                         "Incline dumbbell press",
                         //"Dumbbell lateral raises",
                         //"Hammer bicep curl",
                         //"Bicep curl",
                         "Skull crushers",
                         "Tricep extension"]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Workout review")
                .font(.title)
                .fontWeight(.bold)
                .padding([.bottom], 10)
            
            
            ForEach(exerciseNames, id: \.self) { name in
                WorkoutStatisticsExerciseComponent(exerciseName: name, setsCount: Int.random(in: 2..<4))
            }.padding([.bottom], 10)
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding([.leading], 10)
            .padding()
            .onAppear{
                AppEntry.AppState.addView(view: dismiss)
            }
            
            
    }
}

struct WorkoutStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutStatisticsView()
    }
}
