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
        let semaphore = DispatchSemaphore(value: 0)
        let bgQueue = DispatchQueue.global(qos: .background)
        
        var healthStatsList = [HealthStat]()
        var listOfGoals = [Goal]()
        
        
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
                semaphore.signal()
            }
        }
        
        // STEP 2: Get User Goals
        let getUserGoals = BlockOperation{
            print("Execute Operation 2")
            DispatchQueue.main.async {
                let currentUser = self.realmService.getCurrentUser()
                listOfGoals = Array(currentUser!.goals)
                semaphore.signal()
            }
            
        }
        
        // STEP 3: Calculate if goal was completed or not
        let checkForCompletion = BlockOperation {
            print("Execute Operation 3")
            DispatchQueue.main.async {
                if listOfGoals.isEmpty { return }
                
                for goal in listOfGoals {
                    let healthStat: HealthStat = (healthStatsList.filter { $0.type == goal.type }).first!
                    let foo = GoalCreater().getGoalFor(type: goal.type, difficulty: goal.difficulty)
                    
                    print("TESTING")
                    print(healthStat.stat?.doubleValue(for: .count()))
                    print(foo)
                    
                    // TODO: determine if user met goal and update current user stats
                    
                }
                semaphore.signal()
            }
            
        }
        
        bgQueue.async {
            getHealthStats.start()
            semaphore.wait()
            
            getUserGoals.start()
            semaphore.wait()
            
            checkForCompletion.start()
            semaphore.wait()
        }
    }
}
