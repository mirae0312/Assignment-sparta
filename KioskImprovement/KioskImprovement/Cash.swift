//
//  Cash.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

class Cash {
    private(set) var balance = Double(Int.random(in: 10...50))
    
    func consume(_ amount: Double) {
        balance -= amount
    }
}
