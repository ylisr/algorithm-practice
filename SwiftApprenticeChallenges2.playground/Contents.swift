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
 protocols expresses valye or reference semantics that match the type it was defined as. 
 you can do: protocol Named: class {
                var name: String { get set }
                }
 to indicate only classes should adopt this protocol
 CustomDebugStringConvertible behaves exactly like CustomDebugStringConvertable except it also defines a debugDescription that can be used along with debugPrint() to print the output only in debug configurations
 */
protocol Area {
    var area: Double { get }
}

struct Square: Area {
    var width: Double
    
    var area: Double {
        return width * width
    }
    
}

struct Triangle: Area {
    var base: Double
    var height: Double
    var area: Double {
        return base * height / 2
    }
}

struct Circle: Area {
    var radius: Double
    var area: Double {
        return Double.pi * radius * radius
    }
}

//use protocol as a variable type - [Area]
let shapes: [Area] = [Square(width: 3), Triangle(base: 3, height: 2), Circle(radius: 2)]
print(shapes.map { $0.area })

//use associated type to state there's a type used in the protocol without specifying what type it should be (Generics) . The protocol can't be used as a simple variable type in such case
protocol WeightCalculatable {
    associatedtype WeightType
    func calculateWeight() -> WeightType
}

class HeavyThing: WeightCalculatable {
    typealias WeightType = Int
    func calculateWeight() -> Int {
        return 100
    }
}

class LightThing: WeightCalculatable {
    typealias WeightType = Double
    func calculateWeight() -> Double {
        return 0.00025
    }
}

/* Generics - a receipe for creating concret types, a way to systematically define sets of types
 'T' is often used as a placeholder for some actual type that will be supplied later
 generics are evaluated at compile time and result in new types (concreate) that are specializations of the generic type
 */
class Keeper<Animal: Pet> { //specify the requirement whatever type is offered to be Animal must be a subclass of Pet ot implementing the Pet protocol
    var name: String
    var lookedAfterAnimals: [Animal] = []
    
    init(name: String) {
        self.name = name
    }
    
    func lookAfter(for animal: Animal) {
        lookedAfterAnimals.append(animal)
    }
}
protocol Pet {
    var name: String { get }
}

class Cat: Pet {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Dog: Pet {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let cats = ["Etta", "Fiona"].map { Cat(name: $0) }
let dogs = ["Nelly", "Ian"].map { Dog(name: $0) }
let pets: [Pet] = [Cat(name:"Mitten"), Dog(name: "Melody")]

func gather(_ pets: [Pet]) {
    pets.forEach{
        print("Come \($0.name)")
    }
}
gather(pets)

let christine = Keeper<Cat>(name: "Christine")
christine.lookAfter(for: Cat(name: "Pizza"))
christine.lookAfter(for: Cat(name: "iPhone"))
christine.lookedAfterAnimals

//Element is the associated type of an array
extension Array where Element: Cat { //add extension to an array of cats
    func meow(){
        forEach {
            print("\($0.name), say meow!")
        }
    }
}

//generic param list <T, U>, and function param list (_ x: T, _ y: U)
func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
    return (y, x)
}








