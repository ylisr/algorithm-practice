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

/* Access Control
 private - accessible only to the defining type
 fileprivate - accessible from anywhere within the source file in which it's defined
 internal - default, accessible from anywhere within the module in which it's defined
 public - internal + other modules import this module
 open - public + can ben overridden from within another module
 */
protocol Account {
    associatedtype Currency
    
    var balance: Currency { get }
    func deposit(amount: Currency)
    func withdraw(amount: Currency)
}

typealias Dollars = Double

class BasicAccount: Account {
    private(set) var balance: Dollars = 0.0
    
    func deposit(amount: Dollars) {
        balance += amount
    }
    func withdraw(amount: Double) {
        if balance > amount {
            balance -= amount
        }else {
            balance = 0
        }
    }
}

//Singleton
class Singleton {
    static let sharedInstance = Singleton()
    init() {
        print("This is a singleton")
    }
    func log(){
        print("Log log singleton instance log method called")
    }
}
let singleton = Singleton.sharedInstance
singleton.log()

//Implement a stack
struct Stack<T> {
    private(set) var elements: [T] = []
    
    func peek() -> T? {
        return elements.last
    }
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        if elements.isEmpty {
            return nil
        }
        return elements.removeLast()
    }
    func count() -> Int {
        return elements.count
    }
}

//Custom operators
infix operator **
func **(lhs: Int, rhs: Int) -> Int {
    var result = lhs
    for _ in 2...rhs{
        result *= lhs
    }
    return result
}
let base = 2
let exponent = 3
let expo1 = base ** exponent

infix operator **=
func **=(lhs: inout Int, rhs: Int){
    lhs = lhs ** rhs
}

var number = 2
number **= exponent

infix operator ***
func ***<T: FloatingPoint>(lhs: T, rhs: Int) -> T {
    var result = lhs
    for _ in 2...rhs {
        result *= lhs
    }
    return result
}

let expo2 = Double(base) *** exponent
let expo3 = 3.45 *** exponent

infix operator ***=
func ***=<T: FloatingPoint>(lhs: inout T, rhs: Int){
    lhs = lhs *** rhs
}

var expo4: Double = 2.5
expo4 ***= 2

/*
 pattern matching - if case A = B, guard case A = B
 wildcard - if case (_, 0, 0) = coordinate { } else { }
 value binding - if case (let x, 0, 0) = coordinate { }
 bind multiple values - if case let (x, y, 0) = coordinate { }
 
 */
//pattern matching using switch statement
func estimatePopulationSize(population: Int) -> String {
    let single = 1
    let aFew = 2...4
    let several = 5...10
    let many = 10...50
    switch population {
    case single:
        return "one person"
    case aFew:
        return "a few people"
    case several:
        return "several people"
    case many:
        return "many people"
    default:
        return "oh so many people"
    }
}
print("There are \(estimatePopulationSize(population: 35))")

//use pattern matching to count occurance
let groupSizes = [1, 5, 4, 6, 2, 1, 3]
for case 1 in groupSizes {
    print("Found an individual")
}

let names: [String?] = ["Michelle", nil, "Brandon", "Christine", nil, "David"]
for name in names {
    switch name {
    case .none:
        break
    case .some(let name):
        print("switch pattern matching ound someone who's name is \(name)")
    }
}

//Another solution
for case let name? in names{
    print("optional pattern found someone who's name is \(name)")
}

//as, is
let array: [Any] = [15, "George", 2.0]

for element in array {
    switch element {
    case is String:
        print("Found a string")
    case is Int:
        print("Found an integer")
    default:
        break
    }
}

for element in array {
    switch element {
    case let text as String:
        print("Found a string: \(text)")
    default:
        print("Found something else")
    }
}

for number in 1...9 {
    switch number {
    case let x where x % 2 == 0:
        print("even")
    default:
        print("odd")
    }
}

//calculate fibonacci
func fibonacci(position: Int) -> Int{
    switch position {
    case let n where n <= 1:
        return 0
    case 2:
        return 1
    case let n:
        return fibonacci(position: n - 1) + fibonacci(position: n - 2)
    }
}
let fib15 = fibonacci(position: 15)

//print fizzbuzz
for i in 1...20{
    switch (i % 3, i % 5) {
    case (0, 0):
        print("FizzBuzz", terminator: " ")
    case (0, _):
        print("Fizz", terminator: " ")
    case (_, 0):
        print("Buzz", terminator: " ")
    case (_, _):
        print(i, terminator: " ")
    }
}

enum FormField {
    case firstName(String)
    case lastName(String)
    case emailAddress(String)
    case age(Int)
}
let minimumAge = 21
let submittedAge = FormField.age(22)

if case .age(let years) = submittedAge, years > minimumAge {
    print("Welcome!")
} else {
    print("Sorry, you are too young!")
}

enum CelestialBody {
    case star
    case planet(liquidWater: Bool)
    case comet
}

let telescopeCensus  = [CelestialBody.star, CelestialBody.planet(liquidWater: false), CelestialBody.planet(liquidWater: true), CelestialBody.planet(liquidWater: true), CelestialBody.comet]

for case .planet(let water) in telescopeCensus where water {
    print("Found a potentially habitable planet!")
}

let queenAlbums = [("A night at the opera", 1974), ("Sheer Heart Attack", 1974), ("Jazz", 1978), ("The Game", 1980)]
for case (let album, 1974) in queenAlbums {
    print("Found an 1974 album named \(album)")
}

let coordinates = (lat: 192.89432, long: -68.33294)
switch coordinates {
case (let lat, _) where lat < 0:
    print("In the Northern hemisphere!")
case (let lat, _) where lat == 0:
    print("It's on the equator!")
case (let lat, _) where lat > 0:
    print("In the Southern hemesphere!")
default:
    break
}







