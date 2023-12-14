//
//  Order.swift
//  KioskImprovement
//
//  Created by mirae on 12/13/23.
//

import Foundation

struct Order {
    var startBlockTime = Calendar.current.date(bySettingHour: 23, minute: 10, second: 0, of: Date())!
    var endBlockTime = Calendar.current.date(bySettingHour: 23, minute: 20, second: 0, of: Date())!
    
    func run(_ cash: Double, price: Double) -> Bool {
        while true {
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            
            switch input {
            case 1:
                guard Date() < startBlockTime || Date() > endBlockTime else {
                    print("현재 시각은 \(convertFormat(Date()))입니다.")
                    print("은행 점검 시간은 \(convertFormat(startBlockTime)) ~ \(convertFormat(endBlockTime))이므로 결제할 수 없습니다.")
                    return false
                }
                
                let remain = cash - price
                if remain > 0 {
                    print("주문이 완료되었습니다. 잔액은 W \(cash) 입니다.")
                    return true
                } else {
                    print("현재 잔액은 W \(cash) 으로 W \(-remain)이 부족해서 주문할 수 없습니다.")
                    return false
                }
            case 2:
                return false
            default:
                print("잘못 입력하셨습니다. 다시 입력해주세요")
                continue
            }
        }
    }
    
    func convertFormat(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "a h시 m분"
        return formatter.string(from: date)
    }
}
