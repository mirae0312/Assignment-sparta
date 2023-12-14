//
//  MainMenu.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

struct MainMenu {
    enum Item: Int {
        case burgers = 1
        case drinks
        case beer
        case order
        case frozenCustard
        case cancel
    }
    
    static func run(_ shoppingBagIsEmpty: Bool) -> MainMenu.Item {
        while true {
            printMenu(shoppingBagIsEmpty)
            
            // 1~6 사이의 값을 입력하지 않으면 다시 입력
            guard let input = Util.readInput(),
                let selectedItem = Item(rawValue: input) else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            
            // 장바구니가 비어있을 때, 1~4 이외의 값을 입력하면 다시 입력
            guard !(shoppingBagIsEmpty && [.order, .cancel].contains(selectedItem)) else {
                print("잘못 입력하셨습니다. 다시 입력해주세요.\n")
                continue
            }
            
            Thread.sleep(forTimeInterval: 3)
            return selectedItem
        }
    }
    
    static func printMenu(_ shoppingBagIsEmpty: Bool) {
        var menuDescription = """
              SHAKESHACK BURGER 에 오신걸 환영합니다.
              아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.
              
              [ SHAKESHACK MENU ]
              1. Burgers         | 앵거스 비프 통살을 다져만든 버거
              2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
              3. Drinks          | 매장에서 직접 만드는 음료
              4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
              """
        
        // 장바구니에 물건이 있을 경우
        if !shoppingBagIsEmpty {
            menuDescription += """
                               \n
                               [ ORDER MENU ]
                               5. Order       | 장바구니를 확인 후 주문합니다.
                               6. Cancel      | 진행중인 주문을 취소합니다.
                               """
        }
        
        print(menuDescription)
    }
}
