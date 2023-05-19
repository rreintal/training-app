//
//  ExerciseType+CoreDataProperties.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//
//

import Foundation
import CoreData


extension ExerciseType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseType> {
        return NSFetchRequest<ExerciseType>(entityName: "ExerciseType")
    }

    @NSManaged public var name: String?
    @NSManaged public var value: Int16
    @NSManaged public var exercise: NSSet?

}

// MARK: Generated accessors for exercise
extension ExerciseType {

    @objc(addExerciseObject:)
    @NSManaged public func addToExercise(_ value: Exercise)

    @objc(removeExerciseObject:)
    @NSManaged public func removeFromExercise(_ value: Exercise)

    @objc(addExercise:)
    @NSManaged public func addToExercise(_ values: NSSet)

    @objc(removeExercise:)
    @NSManaged public func removeFromExercise(_ values: NSSet)

}

extension ExerciseType : Identifiable {

}
