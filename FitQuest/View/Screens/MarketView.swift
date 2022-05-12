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
                VStack(spacing: 20) {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 60, height: 60)
                    
                    Text("\(viewModel.selectedItem!.name)")
                        .font(.title3)
                    
                    Text("\(viewModel.selectedItem!.desc)")
                    
                    HStack() {
                        Button {
                            viewModel.cartCardIsShown = false
                            viewModel.selectedItem = nil
                        } label: {
                            Text("Cancel")
                        }
                        .padding(10)
                        .background(Color.cardBGColor)
                        .tint(.black)
                        
                        Spacer()
                        
                        Button {
                            viewModel.buyItem()
                            viewModel.cartCardIsShown = false
                            viewModel.selectedItem = nil
                        } label: {
                            Text("Buy 🪙 \(viewModel.selectedItem!.price)")
                        }
                        .padding(10)
                        .background(Color.cardBGColor)
                        .cornerRadius(10)
                        .tint(.black)
                    }
                    .padding(.top, 30)

                }
                .frame(width: UIScreen.main.bounds.size.width-120)
                .padding(30)
                .background(Color.green)
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
