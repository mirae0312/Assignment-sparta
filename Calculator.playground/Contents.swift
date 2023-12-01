//
//### 필수 구현 기능
//
//- Lv1 : 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들고, 클래스를 이용하여 연산을 진행하고 출력하기
//
//- Lv2 : Lv1에서 만든 Calculator 클래스에 추가 연산이 가능하도록 코드를 추가하고, 연산 진행 후 출력하기
//
//- Lv3 : AddOperation(더하기), SubstractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기) 연산 클래스를을 만든 후 클래스간의 관계를 고려하여 Calculator 클래스와 관계를 맺기
//    - 관계를 맺은 후 필요하다면 Calculator 클래스의 내부코드를 변경하기
//        - 나머지 연산자(%) 기능은 제외합니다.
//    - Lv2 와 비교하여 어떠한 점이 개선 되었는지 스스로 생각해 봅니다.
//        - hint. 클래스의 책임(단일책임원칙)
//    
//
//### 선택 구현 기능
//
//- Lv4 : AddOperation(더하기), SubtractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기) 연산 클래스들을 AbstractOperation라는 클래스명으로 만들어 사용하여 추상화하고 Calculator 클래스의 내부 코드를 변경합니다.
//- Lv3 와 비교해서 어떠한 점이 개선 되었는지 스스로 생각해 봅니다.
//    - hint. 클래스간의 결합도, 의존성(의존성역전원칙)

class Calculator {
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
        case "%" :
            return remainderResult()
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
    
    func remainderResult() -> Double {
        Double(Int(firstNumber) % Int(secondNumber))
    }
}

let calculator = Calculator(firstNumber: 1, secondNumber: 3.5)
let addResult = calculator.calculate(simbol: "+")
let subtractResult = calculator.calculate(simbol: "-")
let multiplyResult = calculator.calculate(simbol: "*")
let divideResult = calculator.calculate(simbol: "/")
let remainderResult =  calculator.calculate(simbol: "%")

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")

