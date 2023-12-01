import UIKit
class AbstractOperation {
    func operate(firstNumber: Int, secondNumber: Int) -> Double{
        return 0
    }
}

class AddOperation : AbstractOperation {
    override func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber + secondNumber)
    }
}

class SubtractOperation : AbstractOperation {
    override func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber - secondNumber)
    }
}

class MultiplyOperation : AbstractOperation {
    override func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber * secondNumber)
    }
}

class DivideOperation : AbstractOperation {
    override func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber / secondNumber)
    }
}

class Calculator {
    private var abstractOperation : AbstractOperation
    
    init(operation: AbstractOperation) {
        self.abstractOperation = operation
    }
    
    func setOperation(operation: AbstractOperation) {
        self.abstractOperation = operation
    }
    
    func calculate(firstNumber: Int, secondNumber: Int) -> Double {
        abstractOperation.operate(firstNumber: firstNumber, secondNumber: secondNumber)
    }
}

let calculator = Calculator(operation: AddOperation())
let addResult = calculator.calculate(firstNumber: 1, secondNumber: 290)
calculator.setOperation(operation: SubtractOperation())
let subtractResult = calculator.calculate(firstNumber: 43, secondNumber: 25)
calculator.setOperation(operation: MultiplyOperation())
let multiplyResult = calculator.calculate(firstNumber: 523, secondNumber: 5)
calculator.setOperation(operation: DivideOperation())
let divideResult = calculator.calculate(firstNumber: 98, secondNumber: 3)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
