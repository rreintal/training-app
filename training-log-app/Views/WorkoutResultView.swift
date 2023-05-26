//
//  WorkoutResultView.swift
//  training-log-app
//
//  Created by Richard Reintal on 24.05.2023.
//

import SwiftUI

struct WorkoutResultView: View {
    
    var resultViewModel : WorkoutResult?

    // Hungover -20 < , Good Job +5...+20, Excellent +20... inf
    var messages : [String] = ["Good job! 💪", "Excellent! 🏋️", "Hungover? 🤨"]
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Text(messages[getMessage(c: resultViewModel?.totalChange ?? 0)]).font(.largeTitle).fontWeight(.light)
            Spacer()
            ScrollView {
                ForEach(resultViewModel?.Exercises ?? [], id: \.self) { ex in
                    WorkoutResultExerciseComponent(exercise: ex).padding([.leading], 10)
                }
            }
            
            
            Text("Total: \(resultViewModel!.totalChange < 0 ? "-" : "+")\(resultViewModel!.totalChange.description) kg")
            Spacer()
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
    }
    
    func getMessage(c : Double) -> Int {
        if c > 20 {
            return 1;
        }
        if c <= 20 {
            return 0
        }
        return 2;
    }
}

struct WorkoutResultView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutResultView()
    }
}
