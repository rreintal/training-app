//
//  Workout+CoreDataProperties.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var name: String?
    @NSManaged public var workoutSessions: NSSet?
    @NSManaged public var workoutExercises: NSSet?
    @NSManaged public var workoutProgram: Program?

}

// MARK: Generated accessors for workoutSessions
extension Workout {

    @objc(addWorkoutSessionsObject:)
    @NSManaged public func addToWorkoutSessions(_ value: WorkoutSession)

    @objc(removeWorkoutSessionsObject:)
    @NSManaged public func removeFromWorkoutSessions(_ value: WorkoutSession)

    @objc(addWorkoutSessions:)
    @NSManaged public func addToWorkoutSessions(_ values: NSSet)

    @objc(removeWorkoutSessions:)
    @NSManaged public func removeFromWorkoutSessions(_ values: NSSet)

}

// MARK: Generated accessors for workoutExercises
extension Workout {

    @objc(addWorkoutExercisesObject:)
    @NSManaged public func addToWorkoutExercises(_ value: Exercise)

    @objc(removeWorkoutExercisesObject:)
    @NSManaged public func removeFromWorkoutExercises(_ value: Exercise)

    @objc(addWorkoutExercises:)
    @NSManaged public func addToWorkoutExercises(_ values: NSSet)

    @objc(removeWorkoutExercises:)
    @NSManaged public func removeFromWorkoutExercises(_ values: NSSet)

}

extension Workout : Identifiable {

}
