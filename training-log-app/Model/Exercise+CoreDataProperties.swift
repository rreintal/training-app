//
//  Exercise+CoreDataProperties.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var name: String?
    @NSManaged public var workout: Workout?
    @NSManaged public var exerciseType: ExerciseType?
    @NSManaged public var session: SessionExercise?

}

extension Exercise : Identifiable {

}
