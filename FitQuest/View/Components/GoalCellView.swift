//
//  GoalCellView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/4/22.
//

import SwiftUI

struct GoalCellView: View {
    
    @State var viewModel: GoalCellViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            Rectangle()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray1)
            Text("\(viewModel.goalLabel)")
            Spacer()
            Text("\(viewModel.goalStatusLabel)")
        }
    }
    
    
}

//struct GoalCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalCellView()
//    }
//}
