//
//  StoreViewModel.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/11/22.
//

import Foundation
import SwiftUI

class StoreViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var level: Int = 0
    @Published var coins: Int = 0
    
    private var realmService = RealmService.shared
    let itemStore = ItemStore()
    
    let columns = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    
    // MARK: - Init
    
    init() {
        self.getUserData()
    }
    
    // MARK: - Methods
    
    private func getUserData() {
        guard let currentUser = realmService.getCurrentUser() else {
            return
        }
        level = currentUser.level
        coins = currentUser.coins
    }
}
