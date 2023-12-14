//
//  BurgerMenu.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

struct BurgerMenu {
    func printMenu() {
        print("""
              [ Burgers MENU ]
              1. ShackBurger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거
              2. SmokeShack    | W 8.9 | 베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거
              3. Shroom Burger | W 9.4 | 몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거
              4. Cheeseburger  | W 6.9 | 포테이토 번과 비프패티, 치즈가 토핑된 치즈버거
              5. Hamburger     | W 5.4 | 비프패티를 기반으로 야채가 들어간 기본버거
              0. 뒤로가기        | 뒤로가기
              """)
    }
    
    func run() -> Burger? {
        printMenu()
        
        while true {
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            
            var selectedMenu: Burger?
            
            switch input {
            case 1:
                selectedMenu = Burger(name: "ShackBurger",
                                    description: "토마토, 양상추, 쉑소스가 토핑된 치즈버거",
                                    price: 6.9)
            case 2:
                selectedMenu = Burger(name: "SmokeShack",
                                    description: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거",
                                    price: 8.9)
            case 3:
                selectedMenu = Burger(name: "Shroom Burger",
                                    description: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거",
                                    price: 9.4)
            case 4:
                selectedMenu = Burger(name: "Cheeseburger",
                                    description: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거",
                                    price: 6.9)
            case 5:
                selectedMenu = Burger(name: "Hamburger",
                                    description: "비프패티를 기반으로 야채가 들어간 기본버거",
                                    price: 5.4)
            case 0:
                return nil
            default:
                print("잘못 입력하셨습니다. 다시 입력해주세요.\n")
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
