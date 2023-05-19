//
//  TSet.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import Foundation

class TSet {
    var createdAt : Date
    var weight : Double
    var repetitions : Int
    
    init(createdAt: Date, weight: Double, repetitions: Int) {
        self.createdAt = createdAt
        self.weight = weight
        self.repetitions = repetitions
    }
}
