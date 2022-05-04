//
//  NewGoalView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/4/22.
//

import SwiftUI

struct NewGoalView: View {
    @Binding var showSheetView: Bool
    
    var body: some View {
        NavigationView {
            Text("Hello, World!")
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
