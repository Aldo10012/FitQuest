//
//  ContentView.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import SwiftUI

struct ContentView: View {
    
    private var healthService = HealthKitService()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                healthService.requestAuthorization { didPass in
                    if didPass {
                        print("auth passed")
                        
                        // testing to see if requestHealthStat() works
                        healthService.requestHealthStat(for: .stepCount) { stepCountStats in
                            print("Your step count", stepCountStats)
                        }
                    } else {
                        print("auth failed")
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
