//
//  WorkoutViewExerciseComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 01.05.2023.
//

import SwiftUI

struct WorkoutViewExerciseComponent: View {
    
    // var exercise
    
    @State
    var exerciseName = "Bench press"

    
    @State
    var exerciseNotes = ""
    
    // dev
    
    var setAmount : Int
    
    @State
    var setSaved = false
    
    var Exercise : NewSessionExercise
    
    var workoutId : String?
    
    
    // dev
    var lastSessionSets = ["10 x 20kg", "8 x 30kg"]
    
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
                Text(exerciseName).foregroundColor(.blue)
                Spacer()
                Button {
                    // TODO - prio 2
                    // api call
                    // workoutId järgi session, mis on latest ja siis selle sessioni exercise, millel on see
                    // exercise id ja siis viimased setid, sorted by sequenceNumber
                } label: {
                    Image(systemName: "info.circle")
                }
                .contextMenu{
                    ForEach(lastSessionSets, id: \.self) {oldSet in
                        Text(oldSet)
                    }
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
            
            ForEach(Exercise.Sets) {ExerciseSet in
                CreateWorkoutExerciseSetComponent(setSequenceNumber: ExerciseSet.SequenceNumber.description, ExerciseSet: ExerciseSet)
            }

        
            BottomLineRectangle()
                .stroke(.gray, lineWidth: 1)
                .frame(height: 10)
            
        }
        .frame(maxWidth: .infinity)
            .padding([.trailing, .leading, .bottom], 20)
    }
}

struct WorkoutViewExerciseComponent_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutViewExerciseComponent(setAmount: 2, Exercise: NewSessionExercise(ExerciseName: "name", Sets: []))
    }
}
