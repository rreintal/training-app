//
//  SessionExercise+CoreDataProperties.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//
//

import Foundation
import CoreData


extension SessionExercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SessionExercise> {
        return NSFetchRequest<SessionExercise>(entityName: "SessionExercise")
    }

    @NSManaged public var comment: String?
    @NSManaged public var exercise: NSSet?
    @NSManaged public var exerciseSet: NSSet?
    @NSManaged public var workoutSession: WorkoutSession?

}

// MARK: Generated accessors for exercise
extension SessionExercise {

    @objc(addExerciseObject:)
    @NSManaged public func addToExercise(_ value: Exercise)

    @objc(removeExerciseObject:)
    @NSManaged public func removeFromExercise(_ value: Exercise)

    @objc(addExercise:)
    @NSManaged public func addToExercise(_ values: NSSet)

    @objc(removeExercise:)
    @NSManaged public func removeFromExercise(_ values: NSSet)

}

// MARK: Generated accessors for exerciseSet
extension SessionExercise {

    @objc(addExerciseSetObject:)
    @NSManaged public func addToExerciseSet(_ value: ExerciseSet)

    @objc(removeExerciseSetObject:)
    @NSManaged public func removeFromExerciseSet(_ value: ExerciseSet)

    @objc(addExerciseSet:)
    @NSManaged public func addToExerciseSet(_ values: NSSet)

    @objc(removeExerciseSet:)
    @NSManaged public func removeFromExerciseSet(_ values: NSSet)

}

extension SessionExercise : Identifiable {

}
