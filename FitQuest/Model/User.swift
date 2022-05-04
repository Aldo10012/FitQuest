//
//  model.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var username: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var hp: Int = 0
    @objc dynamic var exp: Int = 0
    @objc dynamic var level: Int = 0
    @objc dynamic var coins: Int = 0
    @objc dynamic var goals: [Goal] = []
    @objc dynamic var items: [Item] = []
}






