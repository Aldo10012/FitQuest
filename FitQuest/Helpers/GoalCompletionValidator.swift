//
//  GoalCompletionValidator.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/6/22.
//

import Foundation
import RealmSwift

class GoalCompletionValidator {
    
    private let healthService = HealthKitService()
    private let realmService = RealmService.shared
    
    // TODO: create a method that checks each of the current user's goals and determines if it is completed or not
    func checkGoalCompletin() {
        let queue = OperationQueue()
        var healthStatsList = [HealthStat]()
        var listOfGoals = [Goal]()
        
//        @ThreadSafe var healthStatsList_ref = healthStatsList
//        @ThreadSafe var listOfGoals_ref = listOfGoals
        
        // STEP 1: Get Health Stats
        let getHealthStats = BlockOperation{
            print("Execute Operation 1")
            self.healthService.requestAllHealthStat() { result in
                switch result {
                case let .success(healthStats):
                    healthStatsList = healthStats
                case let .failure(error):
                    print(error.rawValue)
                }
            }
        }
        
        // STEP 2: Get User Goals
        let getUserGoals = BlockOperation{
            print("Execute Operation 2")
            let currentUser = self.realmService.getCurrentUser()
            listOfGoals = Array(currentUser!.goals)
        }
        
        // STEP 3: Calculate if goal was completed or not
        let checkForCompletion = BlockOperation {
            print("Execute Operation 3")
            if listOfGoals.isEmpty { return }
            
            for goal in listOfGoals {
                let healthStat: HealthStat = (healthStatsList.filter { $0.type == goal.type }).first!
                let foo = GoalCreater().getGoalFor(type: goal.type, difficulty: goal.difficulty)
                
                print(healthStat.stat?.doubleValue(for: .count()))
                print(foo)
                
                // TODO: determine if user met goal and update current user stats
                
            }
        }
        
        // configure operations
        getHealthStats.qualityOfService = .utility
        
        getUserGoals.qualityOfService = .utility
        getUserGoals.addDependency(getHealthStats)
        
        checkForCompletion.qualityOfService = .utility
        checkForCompletion.addDependency(getUserGoals)
        
        queue.addOperations([getHealthStats, getUserGoals, checkForCompletion], waitUntilFinished: true)
    }
}
