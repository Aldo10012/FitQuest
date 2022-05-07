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
    typealias HealthStatResult = Result<[HealthStat], HealthKitError>
    
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
    func requestAuthorization(_ completion: @escaping (Result<Bool, HealthKitError>) -> ()) {
        guard let store = healthStore else {
            return
        }
        
        guard let healthStore = self.healthStore else {
            completion(Result.failure(.authorizaitonFailed))
            return
        }
        
        healthStore.requestAuthorization(toShare: [], read: HealthType.allTypes) { success, error in
            switch success {
            case true:
                completion(Result.success(true))
            case false:
                completion(Result.failure(.authorizaitonFailed))
            }
        }
    }
    
    // MARK: Request HK stats
    
    /// request the health stats of all categories we're keeping track of
    func requestAllHealthStat(_ completion: @escaping (HealthStatResult) -> ()) {
        let dg = DispatchGroup()
        var results = [HealthStat]()
        
        for category in HealthType.allHKQuantityTypeIdentifiers {
            dg.enter()
            requestHealthStat(for: category) { result in
                switch result {
                case let .success(healthStatsResult):
                    results += healthStatsResult
                    //completion(Result.success(healthStatsResult))
                case let .failure(error):
                    print(error.rawValue)
                    //completion(Result.failure(error))
                }
                dg.leave()
            }
        }
        
        dg.notify(queue: .main) {
            completion(.success(results))
        }
    }
    
    /// requests the health stats of a given category
    func requestHealthStat(for category: HKQuantityTypeIdentifier, completion: @escaping (HealthStatResult) -> ()) {
        guard let store = healthStore else { return }
        let type = HealthType.getType(of: category)
        
        let startData = Date().midnight
        let endDate = Date.today
        let anchorDate = Date.mondayAt12AM()
        let daily = DateComponents(day: 1)
        
        var healthStats = [HealthStat]()
        let predicate = HKQuery.predicateForSamples(withStart: startData, end: endDate, options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        
        query?.initialResultsHandler = { query, statistics, error in
            statistics?.enumerateStatistics(from: startData, to: endDate, with: { stats, _ in
                let type = HealthTypeAdapter.HKQuantityTypeIdentifierToString(category)
                let stat = HealthStat(type: type, stat: stats.sumQuantity(), date: stats.startDate)
                healthStats.append(stat)
            })
            
            completion(Result.success(healthStats))
        }
        
        guard let query = query else {
            completion(Result.failure(HealthKitError.queryIsNil))
            return
        }
        
        store.execute(query)
    }
}
