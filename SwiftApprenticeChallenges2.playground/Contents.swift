//: Playground - noun: a place where people can play

import UIKit

/*
 To keep the file from being too lengthy, this is the second part from chapter 15 - 25 of the Swift Apprentice book
 */
//enums with raw values
enum Month: Int {
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
}
//accessing raw value
let rawValueSep = Month.september.rawValue

func monthsUntilWinterBreak(from month: Month) -> Int {
    return Month.december.rawValue - month.rawValue
}
monthsUntilWinterBreak(from: Month.january)

//enum can hold string raw values!
enum Icon: String {
    case music
    case sports
    case weather
    
    var fileName: String {
        return "\(rawValue.capitalized).png"
    }
}
let icon = Icon.weather //a string
let iconName = icon.fileName

//assign associated values to enum cases
enum withdrawResult {
    case success(newBalance: Int)
    case error(message: String)
}
var balance = 100
func withdraw(amount: Int) -> withdrawResult {
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    } else {
         return .error(message: "Not enough money")
    }
}

let result = withdraw(amount: 99)
switch result {
case .success(let balance):
    print("Your account has $\(balance) left")
case .error(let message):
    print("Withdraw failed because \(message)")
}

//Handle network requests with enums
enum HTTPMethod {
    case get
    case post(body: String)
}
let request = HTTPMethod.post(body: "Send HTTP Post with this message")
//TODO: not exactly understainding guard case
guard case .post(let body) = request else {
    fatalError("No message was posted")
}
print(body)

//Optionals .none == nil
var age: Int?
switch age {
case .none:
    print("No value")
case .some(let age):
    print("age is \(age)")
}

enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}
let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]
func totalCoinValue(coinPurse: [Coin]) -> Int {
    return coinPurse.reduce(0){ $0 + $1.rawValue }
}

let coins = totalCoinValue(coinPurse: coinPurse)

/*
 */








