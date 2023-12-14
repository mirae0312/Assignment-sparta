//
//  Eatable.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

protocol Eatable {
    var name: String { get set }
    var description: String { get set }
    var price: Double { get set }
    
    func displayInfo()
}

extension Eatable {
    func displayInfo() {
        print("\(name)   | W \(price) | \(description)")
    }
}
