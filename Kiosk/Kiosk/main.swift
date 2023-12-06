//
//  main.swift
//  Kiosk
//
//  Created by mirae on 12/4/23.
//
//아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.
//
//[ SHAKESHACK MENU ]
//1. Burgers         | 앵거스 비프 통살을 다져만든 버거
//2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
//3. Drinks          | 매장에서 직접 만드는 음료
//4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
//0. 종료            | 프로그램 종료
//1 <-
//
//[ Burgers MENU ]
//1. ShackBurger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거
//2. SmokeShack    | W 8.9 | 베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거
//3. Shroom Burger | W 9.4 | 몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거
//3. Cheeseburger  | W 6.9 | 포테이토 번과 비프패티, 치즈가 토핑된 치즈버거
//4. Hamburger     | W 5.4 | 비프패티를 기반으로 야채가 들어간 기본버거
//0. 뒤로가기      | 뒤로가기
//0 <-
//
//프로그램을 종료합니다.

import Foundation
// main menu class
class ShackshackMenu {
    let menuNum : Int
    var menuName : String
    let menuInfo : String
   
    init(menuNum: Int, menuName: String, menuInfo: String) {
        self.menuNum = menuNum
        self.menuName = menuName
        self.menuInfo = menuInfo
    }
    
    func displayInfo() {
        if menuName.count < 17 {
            menuName = menuName.padding(toLength: 17, withPad: " ", startingAt: 0)
        }
        print("\(menuNum). \(menuName) | \(menuInfo)")
    }
    
    func displayBack() {
        print("0. 뒤로가기            | 뒤로가기")
    }
}

// 매뉴공통 부모 common
class Common {
    let num : Int
    var name : String
    let price : Double
    let info : String

    init(num: Int, name: String, price: Double, info: String) {
        self.num = num
        self.name = name
        self.price = price
        self.info = info
    }
    
    func displayInfo() {
        print("\(num). \(name) | W \(price) | \(info)")
    }
}

// menu
class Burgers : Common {
    override func displayInfo() {
        if name.count < 17 {
            name = name.padding(toLength: 17, withPad: " ", startingAt: 0)
        }
        print("\(num). \(name) | W \(price) | \(info)")
    }
}

class Beer : Common {
    override func displayInfo() {
        if name.count < 17 {
            name = name.padding(toLength: 17, withPad: " ", startingAt: 0)
        }
        print("\(num). \(name) | W \(price) | \(info)")
    }
}

class FrozenCustard : Common {
    override func displayInfo() {
        if name.count < 17 {
            name = name.padding(toLength: 17, withPad: " ", startingAt: 0)
        }
        print("\(num). \(name) | W \(price) | \(info)")
    }
}

class Drinks : Common {
    override func displayInfo() {
        if name.count < 17 {
            name = name.padding(toLength: 17, withPad: " ", startingAt: 0)
        }
        print("\(num). \(name) | W \(price) | \(info)")
    }
}

class Oder {
    
}

// main menu
let burgersMenu = ShackshackMenu(menuNum: 1, menuName: "Burgers", menuInfo: "앵거스 비프 통살을 다져만든 버거")
let frozenCustardMenu = ShackshackMenu(menuNum: 2, menuName: "Frozen Custard", menuInfo: "매장에서 신선하게 만드는 아이스크림")
let drinksMenu = ShackshackMenu(menuNum: 3, menuName: "Drinks", menuInfo: "매장에서 직접 만드는 음료")
let beerMenu = ShackshackMenu(menuNum: 4, menuName: "Beer", menuInfo: "뉴욕 브루클린 브루어리에서 양조한 맥주")
let exit = ShackshackMenu(menuNum: 0, menuName: "종료", menuInfo: "프로그램 종료")

// burger menu
let shackBurger = Burgers(num: 1, name: "ShackBurger", price: 6.9, info: "토마토, 양상추, 쉑소스가 토핑된 치즈버거")
let smokeShack = Burgers(num: 2, name: "SmokeShack", price: 8.9, info: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거")
let shroomBurger = Burgers(num: 3, name: "ShroomBurger", price: 9.4, info: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거")
let cheeseburger = Burgers(num: 4, name: "Cheeseburger", price: 6.9, info: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거")
let hamburger = Burgers(num: 5, name: "Hamburger", price: 5.4, info: "비프패티를 기반으로 야채가 들어간 기본버거")

// Frozen Custard menu
let shakes = FrozenCustard(num: 1, name: "Shakes", price: 5.9, info: "바닐라, 초콜렛, 솔티드 카라멜, 블랙 & 화이트, 스트로베리, 피넛버터, 커피")
let shakeOfTheWeek = FrozenCustard(num: 2, name: "Shake of the Week", price: 6.5, info: "특별한 커스터드 플레이버")
let redBeanShake = FrozenCustard(num: 3, name: "Red Bean Shake", price: 6.5, info: "신선한 커스터드와 함께 우유와 레드빈이 블렌딩 된 시즈널 쉐이크")
let floats = FrozenCustard(num: 4, name: "Floats", price: 5.9, info: "루트 비어, 퍼플 카우, 크림시클")
let cupAndCones = FrozenCustard(num: 5, name: "Cup & Cones", price: 4.9, info: "바닐라, 초콜렛, Flavor of the Week")

// Drinks menu
let shakeMadeLemonade = Drinks(num: 1, name: "Shake-made Lemonade", price: 3.9, info: "매장에서 직접 만드는 상큼한 레몬에이드(오리지널/시즈널)")
let freshBrewedIcedTea = Drinks(num: 2, name: "Fresh Brewed Iced Tea", price: 3.4, info: "직접 유기농 홍차를 우려낸 아이스티")
let fiftyFifty = Drinks(num: 3, name: "Fifty/Fifty", price: 3.4, info: "레몬에이드와 아이스티의 만남")
let fountainSoda = Drinks(num: 4, name: "Fountain Soda", price: 3.3, info: "코카콜라, 코카콜라제로, 스프라이트, 환타 오렌지, 환타 그레이프")
let aditaRootBeer = Drinks(num: 5, name: "Adita Root Beer", price: 4.4, info: "청량감 있는 독특한 미국식 무알콜 탄산음료")

// Beer menu
let shackMeisterAie = Beer(num: 1, name: "ShackMeister Aie", price: 9.8, info: "쉐이크쉑 버거를 위해 뉴욕 브루클린 브루어리에서 특별히 양조한 에일 맥주")
let magpieBrewingCo = Beer(num: 2, name: "Magpie Brewing Co.", price: 6.8, info: "Pale Ale, Draft")
 
// 하나의 객체리스트로 모든 메뉴 관리
// var 리스트변수 : [클래스타입] = []
var menuList : [ShackshackMenu] = [burgersMenu, frozenCustardMenu, drinksMenu, beerMenu, exit]
var burgersList : [Burgers] = [shackBurger, smokeShack, shroomBurger, cheeseburger, hamburger]
var frozenCustardList : [FrozenCustard] = [shakes, shakeOfTheWeek, redBeanShake, floats, cupAndCones]
var drinksList : [Drinks] = [shakeMadeLemonade, freshBrewedIcedTea, fiftyFifty, fountainSoda, aditaRootBeer]
var beerList : [Beer] = [shackMeisterAie, magpieBrewingCo]


func orderMenu() {
    var endStep: Int = 0
    print("\n아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.\n")
    print("[ SHAKESHACK MENU ]")
    
    for menu in menuList{
        menu.displayInfo()
    }
    repeat {
        let choice = readLine()
        if endStep == 0 && choice == "0"{
            print("프로그램을 종료합니다.")
            break
        }
        
        switch choice {
        case "0":
            print("프로그램을 종료합니다.")
            endStep = 0
            break
        case "1":
            print("\n[ Burgers MENU ]")
            for bugers in burgersList{
                bugers.displayInfo()
            }
            burgersMenu.displayBack()
            endStep = 1
            orders()
        case "2":
            print("\n[ Frozen Custard MENU ]")
            for frozenCustard in frozenCustardList {
                frozenCustard.displayInfo()
            }
            frozenCustardMenu.displayBack()
            endStep = 1
        case "3":
            print("\n[ Drinks MENU ]")
            for drinks in drinksList {
                drinks.displayInfo()
            }
            drinksMenu.displayBack()
            endStep = 1
        case "4":
            print("\n[ Beer MENU ]")
            for beer in beerList {
                beer.displayInfo()
            }
            beerMenu.displayBack()
            endStep = 1
        default :
            print("error")
        }
    } while endStep == 1
        
}

func orders() {
    //print("---------orderMenu----------")
    let choice = readLine()
    
    switch choice {
    case "0" :
        orderMenu()
    case "1" :
        print("1")
    case "2" :
        print("2")
    default :
        print("error")
    }
}

orderMenu()

