//
//  StoreView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/9/22.
//

import SwiftUI

struct StoreView: View {
    
    let itemStore = ItemStore()
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack() {
                    Text("Level \(1)")
                    Spacer()
                    Text("Coins \(10)")
                }
                .padding(.horizontal)
                
                ScrollView {
                    ItemGalleryView(label: "Weapons", itemList: itemStore.weaponsInventory)
                    ItemGalleryView(label: "Armor", itemList: itemStore.armorInventory)
                    ItemGalleryView(label: "Special Items", itemList: itemStore.specialItemsInventory)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarTitle(Text("Shop"), displayMode: .inline)
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
