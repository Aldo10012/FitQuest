//
//  HealthType.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import Foundation
import HealthKit

final class HealthType {
    
    static func getType(of type: HKQuantityTypeIdentifier) -> HKQuantityType {
        return HKQuantityType.quantityType(forIdentifier: type)!
    }
    
    static let allHKQuantityTypeIdentifiers: Set<HKQuantityTypeIdentifier> = Set([
        .appleExerciseTime, .stepCount, .distanceWalkingRunning, .distanceCycling, .flightsClimbed
    ])
    
    static let allTypes = Set([
        HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
        HKObjectType.quantityType(forIdentifier: .stepCount)!,
        HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
        HKObjectType.quantityType(forIdentifier: .distanceCycling)!,
        HKObjectType.quantityType(forIdentifier: .flightsClimbed)!
    ])
}
