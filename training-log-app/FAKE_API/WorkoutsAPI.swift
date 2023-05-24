//
//  WorkoutsAPI.swift
//  training-log-app
//
//  Created by Richard Reintal on 13.05.2023.
//

import Foundation


class WorkoutsAPI {
    
    
    public static func getWorkouts() async -> [Workout] {
            
            // SORTI KÕIK EXERCISED BASED ON SEQUENCE NUMBER!!
            var exercises1 = [
                WorkoutExercise(Id: UUID(), Name: "Lateral raises", SetsCount: Int.random(in: 1...4), SequenceNumber: 4),
                WorkoutExercise(Id: UUID(), Name: "Incline bench press", SetsCount: Int.random(in: 1...4), SequenceNumber: 2),
                WorkoutExercise(Id: UUID(), Name: "Tricep kickbacks", SetsCount: Int.random(in: 1...4), SequenceNumber: 6),
                WorkoutExercise(Id: UUID(), Name: "Tricep pushdown", SetsCount: Int.random(in: 1...4), SequenceNumber: 5),
                WorkoutExercise(Id: UUID(), Name: "Bench press", SetsCount: Int.random(in: 1...4), SequenceNumber: 1),
                WorkoutExercise(Id: UUID(), Name: "Shoulder press", SetsCount: Int.random(in: 1...4), SequenceNumber: 3)
            ]
            
            exercises1.sort { $0.SequenceNumber < $1.SequenceNumber }
            
            let workout1 = Workout(Id: UUID(), Name: "Push", Exercises: exercises1)
            
            var exercises2 = [
                WorkoutExercise(Id: UUID(), Name: "Deadlift", SetsCount: Int.random(in: 1...4), SequenceNumber: 1),
                WorkoutExercise(Id: UUID(), Name: "Lat pulldown", SetsCount: Int.random(in: 1...4), SequenceNumber: 2),
                WorkoutExercise(Id: UUID(), Name: "Seated cable row", SetsCount: Int.random(in: 1...4), SequenceNumber: 3),
                WorkoutExercise(Id: UUID(), Name: "Bicep curl", SetsCount: Int.random(in: 1...4), SequenceNumber: 4),
                WorkoutExercise(Id: UUID(), Name: "Hammer curl", SetsCount: Int.random(in: 1...4), SequenceNumber: 5)
            ]
            
            // see peaks olema tehtud juba backendis!!
            exercises2.sort { $0.SequenceNumber < $1.SequenceNumber }
            
            let workout2 = Workout(Id: UUID(), Name: "Pull", Exercises: exercises2)
            
            let result = [workout1, workout2]
            return result;
        }
}
