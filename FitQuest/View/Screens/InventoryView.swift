//
//  InventoryView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/12/22.
//

import SwiftUI

struct InventoryView: View {
    
    @ObservedObject var viewModel: InventoryViewModel
    
    init(label: String, category: ItemCategory) {
        viewModel = InventoryViewModel(label: label, category: category)
        viewModel.label = label
    }
    
    var body: some View {
        ScrollView {
            ItemGalleryView(
                label: viewModel.label,
                itemList: viewModel.items,
                shown: .constant(false),
                selectedItem: .constant(nil))
        }
        .padding()
        .onAppear {
            viewModel.getItems()
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(label: "Label", category: .weapon)
    }
}
