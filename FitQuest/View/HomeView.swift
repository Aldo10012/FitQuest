//
//  ContentView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    @State var showModal: Bool = false
    
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showModal.toggle()
                    }
                    .sheet(isPresented: $showModal) {
                        Text("Add new Goal")
                    }
                }
            }
            
        }
        
//        .onAppear {
//            viewModel.requestAuthorization()
//        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
