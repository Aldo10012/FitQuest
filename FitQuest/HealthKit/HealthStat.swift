//
//  HealthStat.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import Foundation
import HealthKit

struct HealthStat {
    let id = UUID()
    let stat: HKQuantity?
    let date: Date
}
