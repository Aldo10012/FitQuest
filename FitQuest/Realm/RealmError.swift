//
//  RealmError.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/12/22.
//

import Foundation

enum RealmError: String, Error {
    case noCurrentUser = "No Current User"
    case notEnoughCoins = "Not Enough Coins to buy this item"
}
