//
//  ShackshackMenu.swift
//  Kiosk
//
//  Created by mirae on 12/7/23.
//

import Foundation
// main menu class
class ShackshackMenu {
    let menuNum : Int
    var menuName : String
    let menuInfo : String
   
    init(menuNum: Int, menuName: String, menuInfo: String) {
        self.menuNum = menuNum
        self.menuName = menuName
        self.menuInfo = menuInfo
    }
    
    func displayInfo() {
        if menuName.count < 17 {
            menuName = menuName.padding(toLength: 17, withPad: " ", startingAt: 0)
        }
        print("\(menuNum). \(menuName) | \(menuInfo)")
    }
    
    func displayBack() {
        print("0. 뒤로가기            | 뒤로가기")
    }
}
