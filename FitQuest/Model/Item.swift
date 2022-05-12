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
    @Persisted private var imgString: String
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
    
    convenience init(name: String, price: Int, levelRequired: Int, description: String, image: Images = .empty) {
        self.init()
        
        self.name = name
        self.price = price
        self.levelRequired = levelRequired
        self.desc = description
        self.image = image
    }
}
