//
//  GoalCompletionValidator.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/6/22.
//

import Foundation

class GoalCompletionValidator {
    
    private let healthService = HealthKitService()
    private let realmService = RealmService.shared
    private let goalCompletionManager = GoalCompletinoManager()
    
    // TODO: create a method that checks each of the current user's goals and determines if it is completed or not
    func checkGoalCompletin() {
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
                
                print("Health Stat List:\n", healthStatsList)
                
                for goal in listOfGoals {
                    let healthStat: HealthStat = (healthStatsList.filter { $0.type == goal.type }).first!
                   
                    // TODO: refactor this
                    let healthStatAsString: String
                    if healthStat.type == "distanceWalkingRunning" || healthStat.type == "distanceCycling" {
                        healthStatAsString = (healthStat.stat != nil) ? "\( Double(healthStat.stat!.doubleValue(for: .mile())).roundToNearestTenth() )" : "0"
                    } else {
                        healthStatAsString = (healthStat.stat != nil) ? "\( Int(healthStat.stat!.doubleValue(for: .count())) )" : "0"
                    }

                    let aimedGoal = GoalCreater()
                        .getGoalFor(type: goal.type, difficulty: goal.difficulty)
                        .removeNonNumericCharacters()

                    print("TESTING")
                    print(healthStat.type)
                    print("User accomplished:" , healthStatAsString)
                    print("User aimed goal:  ", aimedGoal)
                    
                    if Double(healthStatAsString)! >= Double(aimedGoal)! {
                        print("USER DID PASS")
                        self.goalCompletionManager.userDidSucceedGoal(withDifficulty: goal.difficulty)
                    } else {
                        print("USER DID FAIL")
                        self.goalCompletionManager.userDidFailGoal(withDifficulty: goal.difficulty)
                    }
                    
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
