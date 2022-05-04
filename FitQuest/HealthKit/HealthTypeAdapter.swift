//
//  HealthTypeAdapter.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/3/22.
//

import Foundation
import HealthKit

final class HealthTypeAdapter {
    static func HKQuantityTypeIdentifierToString(_ category: HKQuantityTypeIdentifier) -> String {
        switch category {
        case .appleExerciseTime:
            return "appleExerciseTime"
        case .stepCount:
            return "stepCount"
        case .distanceWalkingRunning:
            return "distanceWalkingRunning"
        case .distanceCycling:
            return "distanceCycling"
        case .flightsClimbed:
            return "flightsClimbed"
        default:
            return ""
        }
    }
}
