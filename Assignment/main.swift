//
//  main.swift
//  Assignment
//
//  Created by mirae on 11/30/23.
//

import Foundation

//Lv1 : 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들고, 클래스를 이용하여 연산을 진행하고 출력하기
class Calculator1 {
    var firstNumber : Double
    var secondNumber : Double
    
    init(firstNumber: Double, secondNumber: Double) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
    
    func calculate(simbol: String) -> Double {
        switch simbol {
        case "+" :
            return addResult()
        case "-" :
            return subtractResult()
        case "*" :
            return multiplyResult()
        case "/" :
            return divideResult()
        default :
            return 0
        }
    }
    
    func addResult() -> Double {
        firstNumber + secondNumber
    }
    
    func subtractResult() -> Double {
        firstNumber - secondNumber
    }
    
    func multiplyResult() -> Double {
        firstNumber * secondNumber
    }
    
    func divideResult() -> Double {
        firstNumber / secondNumber
    }
}

let calculator = Calculator1(firstNumber: 1, secondNumber: 3.5)
let result = calculator.calculate(simbol: "/")
print("Result1 : \(result)")

let input = readLine()! // 1(띄어쓰기)2 입력
let arr = input.split(separator: " ") // 스페이스바를 기준으로 띄어쓰기
let A = Int(arr[0])! // split을 이용하여 나눈 수들을 arr 배열에 넣기
let B = Int(arr[1])! // arr에 들어있는 각각의 글자를 Int로 치환도 해줌
print(A + B) // 3 출력됨 

class Calculator2 {
    var firstNumber : Double
    var secondNumber : Double
    
    init (_ firstNumber: Double,_ secondNumber: Double){
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber}
    
    //더하기
    func add() -> Double {
        return firstNumber + secondNumber
    }
    
    //빼기
    func subtract() -> Double {
        return firstNumber - secondNumber
    }
 
    //곱하기
    func multiply() -> Double {
        return firstNumber * secondNumber
    }
 
    
    func divide() -> Double? {
            if secondNumber != 0 {
                return Double(Int((firstNumber / secondNumber) * 100)) / 100
            } else {
                print("Error: Cannot divide by zero.")
                return nil
            }
    }
    
    func remainder() -> Double? {
        if secondNumber != 0 {
            return firstNumber.truncatingRemainder(dividingBy: secondNumber)
        } else {
            print("Error: Cannot remainder by zero.")
            return nil
        }
    }
    
    func calculate(_ operation: String) -> Double? {
            switch operation {
            case "+":
                return add()
            case "-":
                return subtract()
            case "*":
                return multiply()
            case "/":
                return divide()
            case "%":
                return remainder()
            default:
                return 0
            }
        
    }
    
}


//let calculator = Calculator2(3.3,1.5)
//let result = calculator.calculate("%")
//
//print("Result2 : \(result)")
