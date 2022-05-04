//
//  UserStatsBarView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/3/22.
//

import SwiftUI

struct UserStatsBarView: View {
    
    @State var statType: String
    @State var currentAmount: Int
    @State var maxAmount: Int
    var color: Color
    
    var body: some View {
        HStack(spacing: 25) {
            Rectangle()
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)
            
            
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 5)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                    
                    Rectangle()
                        .frame(height: 5)
                        .frame(minWidth: 0, maxWidth: .infinity/4)
                        .foregroundColor(color)
                }
                HStack {
                    Text("\(currentAmount)/\(maxAmount)")
                        .font(.custom("Ariel", size: 12))
                        .fontWeight(.light)
                    Spacer()
                    Text(statType)
                        .font(.custom("Ariel", size: 12))
                        .fontWeight(.light)
                }
            }
        }
        
    }
}

struct UserStatsBarView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsBarView(statType: "Health", currentAmount: 10, maxAmount: 10, color: .red)
    }
}
