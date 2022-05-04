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
}
