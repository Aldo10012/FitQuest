//
//  StoreView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/9/22.
//

import SwiftUI

struct MarketView: View {
    
    @ObservedObject var viewModel = MarketViewModel()
    
    var body: some View {
        ZStack {
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
                        itemList: viewModel.itemStore.weaponsInventory,
                        shown: $viewModel.cartCardIsShown,
                        selectedItem: $viewModel.selectedItem
                    )
                    ItemGalleryView(
                        label: "Armor",
                        itemList: viewModel.itemStore.armorInventory,
                        shown: $viewModel.cartCardIsShown,
                        selectedItem: $viewModel.selectedItem
                    )
                    ItemGalleryView(
                        label: "Special Items",
                        itemList: viewModel.itemStore.specialItemsInventory,
                        shown: $viewModel.cartCardIsShown,
                        selectedItem: $viewModel.selectedItem
                    )
                }
                .padding(.horizontal)
                
                Spacer()
            }
            
            if viewModel.cartCardIsShown {
                BuyItemCard(
                    name: viewModel.selectedItem!.name,
                    description: viewModel.selectedItem!.desc,
                    price: viewModel.selectedItem!.price,
                    onBuy: {
                        viewModel.buyItem()
                        viewModel.cartCardIsShown = false
                        viewModel.selectedItem = nil
                    },
                    onCancel: {
                        viewModel.cartCardIsShown = false
                        viewModel.selectedItem = nil
                    })
            }
            
        }
        .navigationBarTitle(Text("Shop"), displayMode: .inline)
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
