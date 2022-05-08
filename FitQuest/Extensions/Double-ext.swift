//
//  Double-ext.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/7/22.
//

import Foundation

extension Double {
    
    func roundToNearestTenth() -> Double {
        let result: Double = Double(Int(self * 10)) / 10
        return result
    }
}
