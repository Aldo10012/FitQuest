//
//  Goal.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/3/22.
//

import Foundation
import RealmSwift

class Goal: Object {
    @Persisted var type: String = "" // Corrosponds to HKQuantityTypeIdentifier
    @Persisted var difficulty: String = "" // Trivial, Easy, Normal, Hard
    @Persisted var didCompleteToday: Bool = false
}
