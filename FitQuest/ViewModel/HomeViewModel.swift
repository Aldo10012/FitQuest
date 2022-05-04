//
//  viewModel.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import Foundation

// TODO: create a real viewModel

class HomeViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var health: Int = 0
    @Published var exp: Int = 0
    @Published var level: Int = 0
    @Published var expNeededToLevelUp: Int = 0
    
    var healthService = HealthKitService()
    
    // MARK: Init
    
    init() {
        
    }
    
    func requestAuthorization() {
        healthService.requestAuthorization { [weak self] result in
            switch result {
            case let .success(_):
                self?.getAllHealthStats()
            case let .failure(error):
                print(error.rawValue)
            }
        }
    }
    
    func getAllHealthStats() {
        healthService.requestAllHealthStat() { [weak self] result in
            switch result {
            case let .success(healthStats):
                print("HS", healthStats)
            case let .failure(error):
                print(error.rawValue)
            }
        }
    }
}