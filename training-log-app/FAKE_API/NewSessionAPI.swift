//
//  NewSessionAPI.swift
//  training-log-app
//
//  Created by Richard Reintal on 14.05.2023.
//

import Foundation


class NewSessionAPI {
    
    public static func GetNewWorkoutSession() async -> NewWorkoutSession {
        let benchPressSets = [
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 10, SequenceNumber: 1),
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 8, SequenceNumber: 2),
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 6, SequenceNumber: 3)
        ]

        let inclineBenchPressSets = [
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 12, SequenceNumber: 1),
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 10, SequenceNumber: 2),
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 8, SequenceNumber: 3)
        ]

        let shoulderPressSets = [
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 12, SequenceNumber: 1),
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 10, SequenceNumber: 2),
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 8, SequenceNumber: 3)
        ]

        let bicepCurlSets = [
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 12, SequenceNumber: 1),
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 10, SequenceNumber: 2),
            NewSessionExerciseSet(Wegiht: 0.0, Repetitions: 8, SequenceNumber: 3)
        ]

        let exercises = [
            NewSessionExercise(ExerciseName: "Bench press", Sets: benchPressSets),
            NewSessionExercise(ExerciseName: "Incline bench press", Sets: inclineBenchPressSets),
            NewSessionExercise(ExerciseName: "Shoulder press", Sets: shoulderPressSets),
            NewSessionExercise(ExerciseName: "Bicep curl", Sets: bicepCurlSets)
        ]

        let workoutSession = NewWorkoutSession(Name: "Push", CreatedAt: Date(), Exercises: exercises)
        return workoutSession
    }
}
