//
//  StoreView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/9/22.
//

import SwiftUI

struct StoreView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .navigationBarTitle(Text("Shop"), displayMode: .inline)
        }
        
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
