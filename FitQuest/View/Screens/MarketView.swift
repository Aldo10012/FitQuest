//
//  StoreView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/9/22.
//

import SwiftUI

struct MarketView: View {
    
    let viewModel = MarketViewModel()
    
    var body: some View {
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

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
