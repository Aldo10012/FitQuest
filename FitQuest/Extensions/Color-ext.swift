//
//  Color-ext.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/4/22.
//

import Foundation
import SwiftUI

extension Color {
    
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> Color {
        return Color.init(red: red/255, green: green/255, blue: blue/255)
    }
    
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: Double) -> Color {
        return Color.init(red: red/255, green: green/255, blue: blue/255, opacity: alpha)
    }
    
    public static var cardBGColor: Color {
        return Color.rgb(235, 235, 235)
    }
    
    public static var opaqueBackground: Color {
        return Color.rgba(0, 0, 0, 0.6)
    }
}
