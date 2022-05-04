//
//  viewModel.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import Foundation
import SwiftUI

// TODO: create a real viewModel

class HomeViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var health: Int = 0
    @Published var maxHealth: Int = 0
    @Published var exp: Int = 0
    @Published var expNeededToLevelUp: Int = 0
    @Published var level: Int = 0
    @Published var currentUser: User?
    @Published var coins: Int = 0
    
    var healthService = HealthKitService()
    var realmService = RealmService.shared
    
    var healthStats: [HealthStat] = []
    var goalsList: [GoalCellViewModel] = [] // for the TableView
    
    // MARK: Init
    
    init() {
        currentUser = RealmService.shared.getCurrentUser()
        print("Current User", currentUser)
    }
    
    // MARK: - HealthKit methods
    
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
                self?.healthStats += healthStats
                print("HS", self?.healthStats)

            case let .failure(error):
                print(error.rawValue)
            }
        }
    }
    
    // MARK: - Realm methods
    
    func getUserStats() {
        // get currentUser
        guard let user = realmService.getCurrentUser() else {
            return
        }
        
        // update properties
        health = user.hp
        maxHealth = user.maxHp
        exp = user.exp
        expNeededToLevelUp = user.expNeededToLevelUp
        level = user.level
        coins = user.coins
    }
    
    func getUserGoals() {
        // get user goals from realm service
        guard let goals = realmService.getUserGoals() else {
            return
        }
        // pair each respective goal with their HealthKit data object
        var goalCellVMList = [GoalCellViewModel]()
        for goal in goals {
            let healthStat = (self.healthStats.filter { $0.type == goal.type }).first!
            let goalCellVM = GoalCellViewModel(goal: goal, healthStat: healthStat)
            goalCellVMList.append(goalCellVM)
        }
        goalsList = goalCellVMList
        print(goalsList)
    }
}


// TODO: move to another file & create SwiftUI view to go with it
class GoalCellViewModel: ObservableObject {
    
    // MARK: - Properties
    var goal: Goal!
    var healthStat: HealthStat!

    var goalLabel: String!
    var goalStatusLabel: String!
    
    // MARK: - Init
    convenience init(goal: Goal, healthStat: HealthStat) {
        self.init()
        self.goal = goal
        self.healthStat = healthStat
        
        let foobar = GoalCreater().getGoalFor(type: goal.type, difficulty: goal.difficulty)
        
        self.goalLabel = goal.type
        self.goalStatusLabel = "\(healthStat.stat)/\(foobar)" // ex: Step Count ~ "2,000/5,000 steps"
    }
    
}
