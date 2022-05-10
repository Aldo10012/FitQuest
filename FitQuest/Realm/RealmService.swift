//
//  RealmService.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import RealmSwift

class RealmService {
    
    // MARK: - Properties
    
    static let shared = RealmService()
    var realm: Realm?
    
    // MARK: - Init
    
    private init() {
        do {
            self.realm = try Realm()
        } catch {
            print("ERROR geting Realm():", error)
            realm = nil
        }
        print("FILE PATH:", Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    // MARK: - User Methods
    
    // TODO: Update this method when introducing user registration/authentication
    /// get current user
    func getCurrentUser() -> User? {
        guard let realm = realm else {
            return nil
        }
        
        // get all users ~ should be no more than 1
        let allUsers = realm.objects(User.self)
        var currentUser: User!
        
        if allUsers.count == 0 {
            // create new user
            let newUser = User()
            newUser.username = "Bob Booby"
            newUser.email = "fakeName@email.com"
            newUser.setLevel1Stats()
            
            // save to Realm database
            try! realm.write {
                realm.add(newUser)
            }
            
            // set currentUser
            currentUser = newUser
        } else {
            currentUser = allUsers[0]
        }
        
        return currentUser
    }
    
    // MARK: Goal Methods
    
    /// add new goal
    func createNewGoal(display: String, type: String, difficulty: String) {
        // create new goal
        var newGoal = Goal()
        newGoal.type = type
        newGoal.display = display
        newGoal.difficulty = difficulty
        
        // get current user
        guard let currentUser = self.getCurrentUser() else {
            print("No current user")
            return
        }
        
        // add new goal to user.goals
        try! realm?.write {
            currentUser.goals.append(newGoal)
        }
        
    }
    
    /// get list of current user's goals
    func getUserGoals() -> [Goal]? {
        guard let currentUser = self.getCurrentUser() else {
            print("No current user")
            return nil
        }
        
        let goals = currentUser.goals
        return Array(goals)
    }
    
    /// edit a given goal
    func editGoal(_ goalToEdit: Goal, display: String, type: String, difficulty: String) {
        try! realm?.write {
            goalToEdit.display = display
            goalToEdit.type = type
            goalToEdit.difficulty = difficulty
        }
    }
    
    /// deleat a given goal
    func deleteGoal(_ goal: Goal) {
        guard let currentUser = self.getCurrentUser() else {
            print("No current user")
            return
        }
        
        try! realm?.write {
            realm?.delete(goal)
        }
    }
    
    // MARK: Goal Completion Methods
    
    func userDidSucceedGoal(exp: Int, coins: Int) {
        guard let currentUser = self.getCurrentUser() else {
            print("No current user")
            return
        }
        
        try! realm?.write {
            currentUser.exp += exp
            currentUser.coins += coins
            
            if currentUser.exp > currentUser.expNeededToLevelUp {
                self.levelUp()
            }
        }
    }
    
    func userDidFailGoal(hpLost: Int) {
        guard let currentUser = self.getCurrentUser() else {
            print("No current user")
            return
        }
        
        try! realm?.write({
            currentUser.hp -= hpLost
        })
    }
    
    func levelUp() {
        guard let currentUser = self.getCurrentUser() else {
            print("No current user")
            return
        }
        let lm = LevelingManager()
        let expSurplus = currentUser.expNeededToLevelUp % currentUser.exp
        
        try! realm?.write({
            currentUser.level += 1
            currentUser.exp = expSurplus
            currentUser.expNeededToLevelUp = lm.getExpNeededToLevelUp(currentLevel: currentUser.level)
        })
    }

}
