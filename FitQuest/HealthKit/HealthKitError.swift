//
//  HealthKitError.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/3/22.
//

import Foundation

enum HealthKitError: String, Error {
    case queryIsNil = "Query was nill"
    case authorizaitonFailed = "Not Authorized"
}
