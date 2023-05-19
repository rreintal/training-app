//
//  Program+CoreDataProperties.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//
//

import Foundation
import CoreData


extension Program {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Program> {
        return NSFetchRequest<Program>(entityName: "Program")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var workouts: NSSet?

}

// MARK: Generated accessors for workouts
extension Program {

    @objc(addWorkoutsObject:)
    @NSManaged public func addToWorkouts(_ value: Workout)

    @objc(removeWorkoutsObject:)
    @NSManaged public func removeFromWorkouts(_ value: Workout)

    @objc(addWorkouts:)
    @NSManaged public func addToWorkouts(_ values: NSSet)

    @objc(removeWorkouts:)
    @NSManaged public func removeFromWorkouts(_ values: NSSet)

}

extension Program : Identifiable {

}
