//
//  ContentView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    Rectangle()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    VStack(spacing: 15) {
                        UserStatsBarView(statType: "Health", currentAmount: 10, maxAmount: 10, color: .red)
                        UserStatsBarView(statType: "Exp", currentAmount: 10, maxAmount: 10, color: .yellow)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                HStack() {
                    Text("Level \(1)")
                    Spacer()
                    Text("Coins \(100)")
                }
                
                Spacer()
                
            }
            .padding()
            .navigationBarTitle(Text("Title"), displayMode: .inline)
            
            
        }
//        .onAppear {
//            viewModel.requestAuthorization()
//    }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

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
