//
//  model.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import Foundation
import RealmSwift

class User: Object {
    
    // Properties
    @Persisted var username: String = ""
    @Persisted var email: String = ""
    @Persisted var hp: Int = 0
    @Persisted var maxHp: Int = 0
    @Persisted var exp: Int = 0
    @Persisted var expNeededToLevelUp: Int = 0
    @Persisted var level: Int = 0
    @Persisted var coins: Int = 0
    
    // Relationships
    @Persisted var goals = List<Goal>()
    @Persisted var items = List<Item>()
}

extension User {
    func setLevel1Stats() {
        hp = 50
        maxHp = 50
        exp = 0
        expNeededToLevelUp = 25
        level = 1
        coins = 0
    }
}






