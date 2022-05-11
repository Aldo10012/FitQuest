//
//  StoreView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/9/22.
//

import SwiftUI

struct StoreView: View {
    
    let viewModel = StoreViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack() {
                    Text("Level \(viewModel.level)")
                    Spacer()
                    Text("Coins \(viewModel.coins)")
                }
                .padding(.horizontal)
                
                ScrollView {
                    ItemGalleryView(
                        label: "Weapons",
                        itemList: viewModel.itemStore.weaponsInventory
                    )
                    ItemGalleryView(
                        label: "Armor",
                        itemList: viewModel.itemStore.armorInventory
                    )
                    ItemGalleryView(
                        label: "Special Items",
                        itemList: viewModel.itemStore.specialItemsInventory
                    )
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
