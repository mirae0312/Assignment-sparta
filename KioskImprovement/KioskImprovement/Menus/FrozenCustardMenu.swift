//
//  FrozenCustardMenu.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

struct FrozenCustardMenu {
    func printMenu() {
        print("""
              [ Frozen Custard MENU ]
              1. Shakes                 | W 5.9 | 바닐라, 초콜릿, 솔티드 카라멜, 블랙& 화이트
              2. Shake of the Week      | W 6.5 | 특별한 커스터드 플레이버
              3. Red Bean Shake         | W 6.5 | 신선한 커스티드와 함께 우유와 레드빈이 블렌딩 된 시즈널 쉐이크
              4. Floats                 | W 5.9 | 루트 비어, 퍼플 카우. 크림시글
              5. A Cups &e Cones        | W 4.9 | 바닐라, 초콜렛. Flavor of the Week
              6. A Concretes            | W 5.9 | 쉐이크쉐의 쫀특한 커스터드와 다양한 믹스-인의 조합
              0. 뒤로가기                 | 뒤로가기
              """)
    }
    
    func run() -> FrozenCustard? {
        printMenu()
        
        while true {
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            
            var selectedMenu: FrozenCustard?
            
            switch input {
            case 1:
                selectedMenu = FrozenCustard(name: "Shakes", description: "바닐라, 초콜릿, 솔티드 카라멜, 블랙& 화이트", price: 5.9)
            case 2:
                selectedMenu = FrozenCustard(name: "Shake of the Week", description: "특별한 커스터드 플레이버", price: 6.5)
            case 3:
                selectedMenu = FrozenCustard(name: "Red Bean Shake", description: "신선한 커스티드와 함께 우유와 레드빈이 블렌딩 된 시즈널 쉐이크", price: 6.5)
            case 4:
                selectedMenu = FrozenCustard(name: "Floats", description: "루트 비어, 퍼플 카우. 크림시글", price: 5.9)
            case 5:
                selectedMenu = FrozenCustard(name: "A Cups &e Cones", description: "바닐라, 초콜렛. Flavor of the Week", price: 4.9)
            case 6:
                selectedMenu = FrozenCustard(name: "A Concretes", description: "쉐이크쉐의 쫀특한 커스터드와 다양한 믹스-인의 조합트", price: 5.9)
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
