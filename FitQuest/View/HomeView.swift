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
                        UserStatsBarView(
                            statType: "Health",
                            currentAmount: $viewModel.health,
                            maxAmount: $viewModel.maxHealth,
                            color: .red
                        )
                        
                        UserStatsBarView(
                            statType: "Exp",
                            currentAmount: $viewModel.exp,
                            maxAmount: $viewModel.expNeededToLevelUp,
                            color: .yellow
                        )
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                
                HStack() {
                    Text("Level \(viewModel.level)")
                    Spacer()
                    Text("Coins \(viewModel.coins)")
                }
                .padding(.horizontal)
                
                List {
                    ForEach(viewModel.goalsList, id: \.self) { goal in
                        GoalCellView(viewModel: goal)
                    }
                    .onDelete(perform: delete)
                }
                
                Spacer()
                
            }
            .navigationBarTitle(Text("Title"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showModal.toggle()
                    }
                    .sheet(isPresented: $showModal) {
                        NewGoalView(showSheetView: $showModal)
                    }
                }
            }
            
        }
        
        .onAppear {
            viewModel.requestAuthorization()
            viewModel.getUserStats()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                viewModel.getUserGoals()
            }
            
        }
    }
    
    
    func delete(at offsets: IndexSet) {
        print("DELETING")
        // TODO: delete the selected goal
//        viewModel.goalsList.remove(atOffsets: offsets)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
