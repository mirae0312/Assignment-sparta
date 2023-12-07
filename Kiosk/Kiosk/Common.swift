//
//  Common.swift
//  Kiosk
//
//  Created by mirae on 12/7/23.
//

import Foundation

// 매뉴공통 부모 common
class Common {
    let num : Int
    var name : String
    let price : Double
    let info : String

    init(num: Int, name: String, price: Double, info: String) {
        self.num = num
        self.name = name
        self.price = price
        self.info = info
    }
    
    func displayInfo() {
        if name.count < 17 {
            name = name.padding(toLength: 17, withPad: " ", startingAt: 0)
        }
        print("\(num). \(name) | W \(price) | \(info)")
    }
}
