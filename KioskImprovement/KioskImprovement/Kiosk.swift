//
//  Kiosk.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

class Kiosk {
    let cash = Cash()
    let timer = KioskTimer()
    let shoppingBag = ShoppingBag()
    let order = Order()
    var currentOrderCount = 0
    
    func run() {
        timer.run { [weak self] in
            print("\n현재 주문 대기수: \(self?.currentOrderCount ?? 0)\n")
        }
        
        while true {
            let selectedMainMenu = MainMenu.run(shoppingBag.isEmpty)
            nextStep(by: selectedMainMenu)
        }
    }
    
    private func nextStep(by selectedMainMenu: MainMenu.Item) {
        
        var selectedDetailMenu: Eatable?
        
        switch selectedMainMenu {
        case .burgers:
            selectedDetailMenu = BurgerMenu().run()
        case .frozenCustard:
            selectedDetailMenu = FrozenCustardMenu().run()
        case .drinks:
            selectedDetailMenu = DrinkMenu().run()
        case .beer:
            selectedDetailMenu = BeerMenu().run()
        case .order:
            orderMenu()
        case .cancel:
            exit(-1)
        }
        
        if let selectedDetailMenu {
            shoppingBag.add(selectedDetailMenu)
        }
    }
    
    private func orderMenu() {
        print("아래와 같이 주문하시겠습니까?\n[ Orders ]")
        shoppingBag.displayInfo()
        print("\n[ Total ]\nW \(shoppingBag.totalPrice)\n")
        
        print("1. 주문      2. 메뉴판")
        
        let isSuccess = order.run(cash.balance, price: shoppingBag.totalPrice)
        if isSuccess {
            cash.consume(shoppingBag.totalPrice)
            shoppingBag.removeAll()
            currentOrderCount += 1
        }
    }
}

