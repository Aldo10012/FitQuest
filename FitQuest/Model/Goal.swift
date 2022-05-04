//
//  Goal.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/3/22.
//

import Foundation
import RealmSwift

class Goal: Object {
    @objc dynamic var type: String = "" // Corrosponds to HKQuantityTypeIdentifier
    @objc dynamic var difficulty: String = "" // Trivial, Easy, Normal, Hard
    @objc dynamic var didCompleteToday: Bool = false
}
