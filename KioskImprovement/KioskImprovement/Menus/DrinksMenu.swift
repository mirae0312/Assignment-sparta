//
//  DrinksMenu.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

struct DrinkMenu {
    func printMenu() {
        print("""
              [ Drinks MENU ]
              1. Shack-made Lemonade    | W 3.9 | 매장에서 직접 만드는 상큼한 레몬에이드
              2. Fresh Brewed Iced Tea  | W 3.4 | 직접 유기농 홍차를 우려낸 아이스티
              3. Fifty/Fifty            | W 3.5 | 레몬에이드와 아이스티의 만남
              4. Fountain Soda          | W 2.7 | 코카끌라, 코카골라 제로, 스프라이트 한타 오렌지.
              5. Abita Root Beer        | W 4.4 | 청랑감 있는 독특한 미국식 무안품 탄산음료
              0. 뒤로가기                 | 뒤로가기
              """)
    }
    
    func run() -> Drink? {
        printMenu()
        
        while true {
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요")
                continue
            }
            
            var selectedMenu: Drink?
            
            switch input {
            case 1:
                selectedMenu = Drink(name: "Shack-made Lemonade",
                                     description: "매장에서 직접 만드는 상큼한 레몬에이드",
                                     price: 3.9)
            case 2:
                selectedMenu = Drink(name: "Fresh Brewed Iced Tea",
                                     description: "직접 유기농 홍차를 우려낸 아이스티",
                                     price: 3.4)
            case 3:
                selectedMenu = Drink(name: "Fifty/Fifty",
                                     description: "레몬에이드와 아이스티의 만남",
                                     price: 3.5)
            case 4:
                selectedMenu = Drink(name: "Fountain Soda",
                                     description: "코카끌라, 코카골라 제로, 스프라이트 한타 오렌지.",
                                     price: 2.7)
            case 5:
                selectedMenu = Drink(name: "Abita Root Beer",
                                     description: "청랑감 있는 독특한 미국식 무안품 탄산음료",
                                     price: 4.4)
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
