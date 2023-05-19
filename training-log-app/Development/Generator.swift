//
//  Generator.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import Foundation

class Generator {
    
    // Program 1 - Only one workout
    
    func TestProgram1() {
        //var Program = TProgram(name: "Full body", workouts: <#T##[TWorkout]#>)
    }
    
    func GetExerciseWithName(_ name : String) -> TExercise {
        // generate exercise
        var Exercise = TExercise(name: name, sets: [TSet(createdAt: Date(), weight: Double.random(in: 50..<100), repetitions: Int.random(in: 6..<10)),
                                                    TSet(createdAt: Date(), weight: Double.random(in: 50..<100), repetitions: Int.random(in: 6..<10))])
        return Exercise
    }
    
    
    func GetWorkoutWithExercises(_ exercises : [TExercise]) -> TWorkout {
        // generate workout with exercises
        return TWorkout(name: "empty", exercises: [GetExerciseWithName("Bench press")])
    }
}
