// 프로토콜을 배우지 않아 클래스의 상속으로 처리
class AbstractOperation {
    func operate(firstNumber: Int, secondNumber: Int) -> Double {
        // 스위프트는 추상클래스가 없어서 반환값을 0이라고 설정하였지만 결론적으로 이 값은 사용하지 않을 것임
        return 0
    }
}

class AddOperation: AbstractOperation {
    override func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber + secondNumber)
    }
}

class SubtractOperation: AbstractOperation {
    override func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber - secondNumber)
    }
}

class MultiplyOperation: AbstractOperation {
    override func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber * secondNumber)
    }
}

class DivideOperation: AbstractOperation {
    override func operate(firstNumber: Int, secondNumber: Int) -> Double {
        return Double(firstNumber / secondNumber)
    }
}

class Calculator {
    private var abstractOperation: AbstractOperation
    
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

let addResult = calculator.calculate(firstNumber: 10, secondNumber: 20)

calculator.setOperation(operation: SubtractOperation())
let subtractResult = calculator.calculate(firstNumber: 30, secondNumber: 20)

calculator.setOperation(operation: MultiplyOperation())
let multiplyResult = calculator.calculate(firstNumber: 10, secondNumber: 5)

calculator.setOperation(operation: DivideOperation())
let divideResult = calculator.calculate(firstNumber: 40, secondNumber: 10)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
