//
//  Item.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/3/22.
//

import Foundation
import RealmSwift

class Item: Object {
    
    // MARK: - Properties
    
    @Persisted var name: String = ""
    @Persisted var price: Int = 0
    @Persisted var levelRequired: Int = 0
    @Persisted var category: String = ""
    @Persisted var desc: String
    @Persisted private var imgString: String
    
    // MARK: - Computed Properties
    
    var image: Images {
        get{
            guard let image = Images(rawValue: imgString) else {
                assertionFailure("Invalid difficultyValue of \(imgString)")
                return .empty
            }
            return image
        }
        set{
            imgString = newValue.rawValue
        }
    }
    
    var itemCategory: ItemCategory {
        get{
            guard let image = ItemCategory(rawValue: category) else {
                assertionFailure("Invalid difficultyValue of \(category)")
                return .none
            }
            return image
        }
        set{
            category = newValue.rawValue
        }
    }
    
    convenience init(name: String, price: Int, levelRequired: Int, description: String, image: Images = .empty, itemCategory: ItemCategory = .none) {
        self.init()
        
        self.name = name
        self.price = price
        self.levelRequired = levelRequired
        self.desc = description
        self.image = image
        self.itemCategory = itemCategory
    }
}


enum ItemCategory: String {
    case none
    case weapon, armor, specialItem
}
