//
//  GoalCompletinoManager.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/7/22.
//

import Foundation
import RealmSwift

class GoalCompletinoManager {
    
    // MARK: - Priperties
    
    private var realm: Realm? = nil
    private var currentUser: User? = nil
    
    // MARK: - Init
    
    init() {
        self.currentUser = RealmService.shared.getCurrentUser()
        self.realm = RealmService.shared.realm
    }
    
    // MARK: - User Did Succeed
    
    func userDidSucceedGoal(withDifficulty difficulty: String) {
        guard let currentUser = currentUser else { return }
        guard let realm = realm else { return }

        try! realm.write({
            switch difficulty {
            case "Trivial":
                currentUser.coins += 2
                currentUser.exp += 2
            case "Easy":
                currentUser.coins += 4
                currentUser.exp += 4
            case "Normal":
                currentUser.coins += 6
                currentUser.exp += 6
            case "Hard":
                currentUser.coins += 8
                currentUser.exp += 8
            default:
                break
            }
            
            if currentUser.exp > currentUser.expNeededToLevelUp {
                let lm = LevelingManager(currentUser: currentUser, realm: realm)
            }
        })
        
    }
    
    // MARK: - User Did Fail
    
    func userDidFailGoal(withDifficulty difficulty: String) {
        guard let currentUser = currentUser else { return }
        guard let realm = realm else { return }
        
        try! realm.write({
            switch difficulty {
            case "Trivial":
                currentUser.hp -= 2
            case "Easy":
                currentUser.hp -= 4
            case "Normal":
                currentUser.hp -= 6
            case "Hard":
                currentUser.hp -= 8
            default:
                break
            }
        })
        
    }
}
