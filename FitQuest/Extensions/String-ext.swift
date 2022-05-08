//
//  String-ext.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/7/22.
//

import Foundation

extension String {
    func removeNonNumericCharacters() -> String {
        return self.filter("0123456789.".contains)
    }
}
