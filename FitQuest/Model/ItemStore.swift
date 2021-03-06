//
//  ItemStore.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/4/22.
//

import Foundation
import RealmSwift

class ItemStore {
    
    // MARK: - Weapons
    
    // TODO: Add unique inventory for each class - unlock at level 5
    // Warrior - Ranger - Mage - Healer - Rogue
    
    let weaponsInventory: [Item] = [
        Item(name: "Sword",           price: 20, levelRequired: 5, description: "", itemCategory: .weapon),
        Item(name: "Shield",          price: 35, levelRequired: 5, description: "", itemCategory: .weapon),
        Item(name: "Bow",             price: 25, levelRequired: 5, description: "", itemCategory: .weapon),
        Item(name: "Magic Staff",     price: 30, levelRequired: 5, description: "", itemCategory: .weapon),
        Item(name: "Healing Scepter", price: 35, levelRequired: 5, description: "", itemCategory: .weapon),
        Item(name: "Dagger",          price: 15, levelRequired: 5, description: "", itemCategory: .weapon),
        Item(name: "Tomahawk",        price: 15, levelRequired: 5, description: "", itemCategory: .weapon),
        Item(name: "Brass Knuckles",  price: 10, levelRequired: 5, description: "", itemCategory: .weapon),
    ]
    
    
    // MARK: - Armor
        
    let armorInventory: [Item] = [
        Item(name: "Leater Armor",    price: 30, levelRequired: 5, description: "", itemCategory: .armor),
        Item(name: "Chainmail Armor", price: 30, levelRequired: 5, description: "", itemCategory: .armor),
        Item(name: "Iron Armor",      price: 30, levelRequired: 5, description: "", itemCategory: .armor),
        Item(name: "Royal Armor",     price: 30, levelRequired: 5, description: "", itemCategory: .armor),
    ]
    
    
    // MARK: - Special Items
    let specialItemsInventory: [Item] = [
        Item(name: "Minor Health Potion", price: 20, levelRequired: 3, description: "Restores 5 hp", itemCategory: .specialItem),
        Item(name: "Health Potion", price: 35, levelRequired: 5, description: "Restores 10 hp", itemCategory: .specialItem),
        Item(name: "Greater Health Potion", price: 90, levelRequired: 10, description: "Restores 30 hp", itemCategory: .specialItem)
    ]
    
}
