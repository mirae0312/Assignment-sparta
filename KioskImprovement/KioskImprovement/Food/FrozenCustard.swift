//
//  FrozenCustard.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

class FrozenCustard: Eatable {
    var name: String
    var description: String
    var price: Double
    
    init(name: String, description: String, price: Double) {
        self.name = name
        self.description = description
        self.price = price
    }
}
