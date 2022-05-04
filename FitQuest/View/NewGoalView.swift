//
//  NewGoalView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/4/22.
//

import SwiftUI

struct NewGoalView: View {
    @Binding var showSheetView: Bool
    @ObservedObject var viewModel = NewGoalViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Select Goal Type")
                    .font(.title3)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(viewModel.typeList, id: \.self) { type in
                            Text(type.displayName)
                                .padding()
                                .background(Color.white)
                                .onTapGesture {
                                    viewModel.selectedType = type.typeName
                                }
                        }
                    }
                }
                .padding(.vertical, 20)
                .background(Color.gray1)
                .cornerRadius(15)
                
                Text("Select Difficulty")
                    .font(.title3)
                
                HStack(alignment: .center, spacing: 20) {
                    ForEach(viewModel.difficultyList, id: \.self) { difficulty in
                        Text(difficulty)
                            .padding()
                            .background(Color.white)
                            .onTapGesture {
                                viewModel.selectedDifficulty = difficulty
                            }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.gray1)
                .cornerRadius(15)
                
                Spacer()
                
                HStack(alignment: .center) {
                    Spacer()
                    Text(viewModel.yourGoal)
                        .font(.system(size: 20, weight: .bold, design: .default))
                    Spacer()
                }
                    
                
                Spacer()
            }
            .padding()
            .navigationBarTitle(Text("New Goal"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", action: didTapCancel)
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create", action: didTapCreate)
                }
                
            }
            
        }
    }
    
    func didTapCancel() {
        showSheetView = false
    }
    
    func didTapCreate() {
        // add goal to database
        showSheetView = false
    }
}

struct NewGoalView_Previews: PreviewProvider {
    static var previews: some View {
        NewGoalView(showSheetView: .constant(true))
    }
}
