//
//  GoalCompletinoManager.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/7/22.
//

import Foundation

class GoalCompletinoManager {
    
    // MARK: - Init
    
    init(){}
    
    // MARK: - User Did Succeed
    
    func userDidSucceedGoal(withDifficulty difficulty: String) {
        switch difficulty {
        case "Trivial":
            RealmService.shared.userDidSucceedGoal(exp: 2, coins: 2)
        case "Easy":
            RealmService.shared.userDidSucceedGoal(exp: 4, coins: 4)
        case "Normal":
            RealmService.shared.userDidSucceedGoal(exp: 6, coins: 6)
        case "Hard":
            RealmService.shared.userDidSucceedGoal(exp: 8, coins: 8)
        default:
            break
        }
    }
    
    // MARK: - User Did Fail
    
    func userDidFailGoal(withDifficulty difficulty: String) {
        switch difficulty {
        case "Trivial":
            RealmService.shared.userDidFailGoal(hpLost: 2)
        case "Easy":
            RealmService.shared.userDidFailGoal(hpLost: 4)
        case "Normal":
            RealmService.shared.userDidFailGoal(hpLost: 6)
        case "Hard":
            RealmService.shared.userDidFailGoal(hpLost: 8)
        default:
            break
        }
    }
}
