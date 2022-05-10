//
//  RootView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/9/22.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            StoreView()
                .tabItem {
                    Label("Store", systemImage: "dollarsign.circle")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
