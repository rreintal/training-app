//
//  ExerciseSet+CoreDataProperties.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//
//

import Foundation
import CoreData


extension ExerciseSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseSet> {
        return NSFetchRequest<ExerciseSet>(entityName: "ExerciseSet")
    }

    @NSManaged public var weight: Double
    @NSManaged public var repetitions: Int16
    @NSManaged public var exercise: SessionExercise?

}

extension ExerciseSet : Identifiable {

}
