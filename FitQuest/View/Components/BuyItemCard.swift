//
//  BuyItemCard.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/12/22.
//

import SwiftUI

struct BuyItemCard: View {
    
    var name: String
    var description: String
    var price: Int
    var onBuy: () -> ()
    var onCancel: () -> ()
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 60, height: 60)
            
            Text("\(name)")
                .font(.title3)
            
            Text("\(description)")
            
            HStack() {
                Button {
                    onCancel()
                } label: {
                    Text("Cancel")
                }
                .padding(10)
                .background(Color.cardBGColor)
                .tint(.black)
                
                Spacer()
                
                Button {
                    onBuy()
                } label: {
                    Text("Buy 🪙 \(price)")
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

struct BuyItemCard_Previews: PreviewProvider {
    static var previews: some View {
        BuyItemCard(name: "Sword", description: "This is a pointy sword", price: 20, onBuy: {}, onCancel: {})
    }
}
