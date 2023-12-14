//
//  BeerMenu.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

struct BeerMenu {
    private func printMenu() {
        print("""
              [ Beer MENU ]
              1. Magpie Brewing Co.   | W 6.8 | Pale Ale, Draft
              2. ShackMeister Ale     | W 9.8 | Bottle
              0. 뒤로가기               | 뒤로가기
              """)
    }
    
    func run() -> Beer? {
        printMenu()
        
        while true {
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요.")
                continue
            }
            
            var selectedMenu: Beer?
            
            switch input {
            case 1:
                selectedMenu = Beer(name: "Magpie Brewing Co.", description: "Pale Ale, Draft", price: 6.8)
            case 2:
                selectedMenu = Beer(name: "ShackMeister Ale", description: "Bottle", price: 9.8)
            case 0:
                return nil
            default:
                print("잘못 입력하셨습니다. 다시 입력해주세요")
                continue
            }
            
            if let selectedMenu {
                print(selectedMenu.displayInfo())
                Thread.sleep(forTimeInterval: 3)
                return selectedMenu
            }
        }
    }
}
