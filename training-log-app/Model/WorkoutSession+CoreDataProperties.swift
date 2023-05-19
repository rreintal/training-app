//
//  WorkoutSession+CoreDataProperties.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//
//

import Foundation
import CoreData


extension WorkoutSession {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutSession> {
        return NSFetchRequest<WorkoutSession>(entityName: "WorkoutSession")
    }

    @NSManaged public var comment: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var finishedAt: Date?
    @NSManaged public var sessionExercises: NSSet?
    @NSManaged public var workout: Workout?

}

// MARK: Generated accessors for sessionExercises
extension WorkoutSession {

    @objc(addSessionExercisesObject:)
    @NSManaged public func addToSessionExercises(_ value: SessionExercise)

    @objc(removeSessionExercisesObject:)
    @NSManaged public func removeFromSessionExercises(_ value: SessionExercise)

    @objc(addSessionExercises:)
    @NSManaged public func addToSessionExercises(_ values: NSSet)

    @objc(removeSessionExercises:)
    @NSManaged public func removeFromSessionExercises(_ values: NSSet)

}

extension WorkoutSession : Identifiable {

}
