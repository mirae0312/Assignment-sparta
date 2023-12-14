//
//  ShoppingBag.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

enum ConfirmItem: Int {
    case confirm = 1
    case cancel
}

class ShoppingBag {
    // MARK: - private
    private var selectedFood: [Eatable] = []
    
    private func printConfirm() {
        print("""
              위 메뉴를 장바구니에 추가하시겠습니까?
              1. 확인        2. 취소
              """)
    }
    
    private func confirmMenu(with selectedMenu: Eatable) {
        printConfirm()
        
        while true {
            guard let input = Util.readInput(),
                let item = ConfirmItem(rawValue: input) else {
                print("잘못 입력하셨습니다. 다시 입력해주세요.\n")
                continue
            }
            
            switch item {
            case .confirm:
                print("\(selectedMenu.name)가 장바구니에 추가되었습니다.\n")
                selectedFood.append(selectedMenu)
            case .cancel:
                print("취소하셨습니다.\n")
            }
            Thread.sleep(forTimeInterval: 3)
            return
        }
    }
    
    // MARK: - Public
    public var isEmpty: Bool {
        selectedFood.isEmpty
    }
    
    public var totalCount: Int {
        selectedFood.count
    }
    
    public func removeAll() {
        selectedFood.removeAll()
    }
    
    public func add(_ item: Eatable) {
        confirmMenu(with: item)
    }
    
    public var totalPrice: Double {
        selectedFood.map(\.price).reduce(0, +)
    }
    
    public func displayInfo() {
        selectedFood.forEach {
            $0.displayInfo()
        }
    }
}
