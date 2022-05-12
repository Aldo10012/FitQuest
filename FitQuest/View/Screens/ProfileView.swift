//
//  ProfileView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/11/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Weapons")
                    Text("Armor")
                    Text("Special Items")
                } header: {
                    Text("Inventory")
                }
                
                Section {
                    NavigationLink(destination: MarketView()) {
                        Text("Market")
                    }
                } header: {
                    Text("Shops")
                }
            }
            .navigationBarTitle(Text("Profile"), displayMode: .inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
