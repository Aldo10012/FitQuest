//
//  Item.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/3/22.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var price: Int = 0
    @objc dynamic var levelRequired: Int = 0
}
