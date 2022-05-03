//
//  HealthKitService.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import Foundation
import HealthKit

class HealthKitService {
    
    // MARK: - Properties
    
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    var statsForToday: [HealthStat]?
    
    // MARK: - Init
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
             self.healthStore = HKHealthStore()
        }
        self.statsForToday = nil
    }
    
    // MARK: - Request Authorization
    
    /// requests permission from user to access HealthKit data
    func requestAuthorization(_ completion: @escaping (Bool) -> ()) {
        guard let store = healthStore else {
            return
        }
        
        guard let healthStore = self.healthStore else {
            return completion(false)
        }
        
        healthStore.requestAuthorization(toShare: [], read: HealthType.allTypes) { success, error in
            completion(success)
        }
    }
    
    // MARK: Request HK stats
    
    /// request the health stats of all categories we're keeping track of
    func requestAllHealthStat() {
        var healthStats: [HealthStat] = []
        
        for category in HealthType.allHKQuantityTypeIdentifiers {
            requestHealthStat(for: category) { healthStetsResult in
                healthStats += healthStetsResult
            }
        }
        
        self.statsForToday = healthStats
    }
    
    /// requests the health stats of a given category
    func requestHealthStat(for category: HKQuantityTypeIdentifier, completion: @escaping ([HealthStat]) -> ()) {
        guard let store = healthStore else { return }
        let type = HealthType.getType(of: category)
        
        let startData = Date.yesturday
        let endDate = Date.today
        let anchorDate = Date.mondayAt12AM()
        let daily = DateComponents(day: 1)
        
        var healthStats = [HealthStat]()
        
        let predicate = HKQuery.predicateForSamples(withStart: startData, end: endDate, options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        
        
        query?.initialResultsHandler = { query, statistics, error in
            statistics?.enumerateStatistics(from: startData, to: endDate, with: { stats, _ in
                let stat = HealthStat(stat: stats.sumQuantity(), date: stats.startDate)
                healthStats.append(stat)
            })
            
            completion(healthStats)
        }
        
        guard let query = query else {
            return
        }
        
        store.execute(query)
    }
}
