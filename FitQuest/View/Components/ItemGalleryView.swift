//
//  ItemGalleryView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/11/22.
//

import SwiftUI

struct ItemGalleryView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var label: String
    var itemList: [Item]
    @Binding var shown: Bool
    @Binding var selectedItem: Item?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(itemList, id: \.self) { item in
                    VStack() {
                        Rectangle()
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.top, 15)
                            .frame(height: 75)
                        Spacer()
                        Text("🪙 \(item.price)")
                            .padding(.bottom, 15)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 110)
                    .background(Color.cardBGColor)
                    .onTapGesture {
                        shown = true
                        selectedItem = item
                    }
                    
                }
            }
        }
        .padding(.bottom, 50)
    }
}

struct ItemGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ItemGalleryView(label: "Weapons", itemList: ItemStore().weaponsInventory, shown: .constant(false), selectedItem: .constant(nil))
    }
}
