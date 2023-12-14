//
//  Util.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

class Util {
    static func readInput() -> Int? {
        guard let input = readLine() else { return nil }
        return Int(input)
    }
}
