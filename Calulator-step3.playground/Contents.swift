import UIKit

class AddOperation {
    func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber + secondNumber)
    }
}

class SubtractOperation {
    func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber - secondNumber)
    }
}

class MultiplyOperation {
    func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber * secondNumber)
    }
}

class DivideOperation {
    func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber / secondNumber)
    }
}

class Calculator {
    private let addOperation: AddOperation
    private let subtractOperation: SubtractOperation
    private let multiplyOperation: MultiplyOperation
    private let divideOperation: DivideOperation
    
    init(addOperation: AddOperation, subtractOperation: SubtractOperation, multiplyOperation: MultiplyOperation, divideOperation: DivideOperation) {
        self.addOperation = addOperation
        self.subtractOperation = subtractOperation
        self.multiplyOperation = multiplyOperation
        self.divideOperation = divideOperation
    }
    
    func calculate(simbol: String, firstNumber: Int, secondNumber: Int) -> Double {
        switch simbol {
        case "+" :
            return addOperation.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "-" :
            return subtractOperation.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "*" :
            return multiplyOperation.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "/" :
            return divideOperation.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        default :
            return 0
        }
    }
    

}

let calculator = Calculator(
    addOperation: AddOperation(),
    subtractOperation: SubtractOperation(),
    multiplyOperation: MultiplyOperation(),
    divideOperation: DivideOperation()
)
let addResult = calculator.calculate(simbol: "+", firstNumber: 1, secondNumber: 290)
let subtractResult = calculator.calculate(simbol: "-", firstNumber: 43, secondNumber: 25)
let multiplyResult = calculator.calculate(simbol: "*", firstNumber: 523, secondNumber: 5)
let divideResult = calculator.calculate(simbol: "/", firstNumber: 98, secondNumber: 3)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
