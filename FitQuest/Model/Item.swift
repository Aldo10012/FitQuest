//
//  Item.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/3/22.
//

import Foundation
import RealmSwift

class Item: Object {
    @Persisted var name: String = ""
    @Persisted var price: Int = 0
    @Persisted var levelRequired: Int = 0
    @Persisted var desc: String
    
    convenience init(name: String, price: Int, levelRequired: Int, description: String) {
        self.init()
        
        self.name = name
        self.price = price
        self.levelRequired = levelRequired
        self.desc = description
    }
}
