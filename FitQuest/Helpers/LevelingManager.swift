//
//  LevelingManager.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/7/22.
//

import Foundation

class LevelingManager {
    
    // MARK: - Init
    
    init() {}
    
    // MARK: - Level up user
    
    func getExpNeededToLevelUp(currentLevel: Int) -> Int {
        switch currentLevel {
        case 1: return 25
        case 2: return 50
        case 3: return 75
        case 4: return 100
        case 5: return 125
        case 6: return 150
        case 7: return 175
        case 8: return 200
        case 9: return 225
        case 10: return 250
        case 11: return 275
        case 12: return 300
        case 13: return 325
        case 14: return 350
        case 15: return 375
        case 16: return 400
        case 17: return 425
        case 18: return 450
        case 19: return 475
        case 20: return 500
        default: return 500
        }
    }
}
