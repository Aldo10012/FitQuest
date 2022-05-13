//
//  InventoryViewModel.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/12/22.
//

import Foundation

class InventoryViewModel: ObservableObject {
   
    @Published var label: String = ""
    @Published var category: ItemCategory
    @Published var items: [Item] = []
    private let realmService = RealmService.shared
    
    init(label: String, category: ItemCategory) {
        self.label = label
        self.category = category
    }
    
    func getItems() {
        items = realmService.getItems(withCategory: category)
        print(items)
    }
}
