//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

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

/* failable initializer: init?(...)
 flatmap: let notNilString = array.flatMap { $0.something?.string }
 flatmap does a map operation and simplifies the result: [Optional<String>] -- [String] or turn an array of arrays into a single array
 handle errors using the Error protocol: enum someError: Error { case }
 throw errors: func(params...) throws -> returnType {
        guard let CONDITION else {
            throw EnumError.caseError
            }
        }
 catch errors: do {
            try someClass.callThisMethod(param...) 
        }catch enumError.caseError {
        print("Handle your error here")
    }
 stopping your program on an error: fatalError()
 */

/*unowned is weak that can never be nil
 closures capture values form the enclosing scope. use self inside of a closure might create a references cycle.
 self inside a closure means a reference to the current object is captured. 
 capture list:
        counter = 0
        closure = { [counter] in print(counter) }
        counter = 1
        closure() //will print 0 because the closure copies the value of counter into a new local constant with the same name (counter is a value type, with reference types a capture list wil cause the closure to capture and store the current reference)
 */

class tutorial {
    var title: String
    var category: String
    init(title: String, category: String) {
        self.title = title
        self.category = category
    }
    
    //the closure doesn't exist after you release the tutorial object, self will never be nil, change strong reference to unowned here
    lazy var tutorialDescriotion: () -> String = {
        [unowned self] in
        return "\(self.title) \(self.category)"
    }
}

//GCD 
func log(message: String) {
    let thread = Thread.current.isMainThread ? "Main" : "Background"
    print("\(thread) thread: \(message)")
}

func addNumbers(range: Int) -> Int {
    log(message: "Adding numbers...")
    return (1...range).reduce(0, +)
}

//to run task on background, create a queue
let queue = DispatchQueue(label: "queue")

//the background closure returns a generic and mainWork closure works with that result, mark both closures @escaping because they escape the function - used asynchronously so they get called after the function returns.
func execute<T>(backgroundWork: @escaping () -> T, mainWork: @escaping (T) -> ()) {
    queue.async {
        //run backgroundwork asynchronously on the serial queue
        let result = backgroundWork()
        DispatchQueue.main.async {
            //dispatch mainwork asynchronously on the main queue using the backgroundWork's result
            mainWork(result)
        }
    }
}

//to run async code in playground, enable async mode 
PlaygroundPage.current.needsIndefiniteExecution = true

print("")

execute(backgroundWork: { addNumbers(range: 100) }, mainWork: { log(message:"The sum is \($0)")})

/*In async closures, you can't capture self as unowned because it may become nil at some point while running an async task.
 use the strong weak pattern to extend an object's lifecycle for async closures
 */
class Editor {
    var feedback: String = ""
    func editTutorial() {
        queue.async {
            [weak self] in
            
            guard let StrongSelf = self else {
                return
            }
            DispatchQueue.main.async {
                print(StrongSelf.feedback)
            }
        }
    }
}

//Tip: use the visual debugger feature in XCode 8 to explore object graph at runtime

/*immutable reference types have value semantics
    var a = UIImage(named: "smile.jpg")
    var b = a
    computeValue(b)
    doSomething(a)
    computeValue(b) //doesn't change
 */

struct Color: CustomStringConvertible {
    var red, green, blue: Double
    var description: String {
        return "r: \(red) g: \(green) b: \(blue)"
    }
}

extension Color {
    static var black = Color(red: 0, green: 0, blue: 0)
    static var white = Color(red: 1, green: 1, blue: 1)
    static var blue  = Color(red: 0, green: 0, blue: 1)
    static var green = Color(red: 0, green: 1, blue: 0)
}

class Bucket {
    var color = Color.blue
    var isRefilled = false
    
    convenience init(color: Color) {
        self.init()
        self.color = color
    }
    func refill() {
        isRefilled = true
    }
}
//value type containing mutable reference type
struct PaintingPlan {
    var accent = Color.white
    private var bucket = Bucket()
    
    var bucketColor: Color {
        get {
            return bucket.color
        }
        set {
            bucket = Bucket(color: newValue)
        }
    }
}

//use extensions on protocols to include actual implementation of the member(computed property etc), so that even you don't have concrete type that adopt the protocol, you can use members of the protocol within its extension.

protocol TeamRecord {
    var wins: Int { get }
    var losses: Int { get }
    var winningPercentage: Double { get }
}

extension TeamRecord {
    var gamesPlayed: Int {
        return wins  + losses
    }
    var winningPercentage: Double {
        return Double(wins) / Double(wins) + Double(losses)
    }
}

struct BaseballRecord: TeamRecord {
    var wins: Int
    var losses: Int
    let seasonLength = 82
}

let newYork = BaseballRecord(wins: 10, losses: 5)
let gamesPlayed = newYork.gamesPlayed //useful to define 'free' behavior on a protocol

let miami = BaseballRecord(wins:60, losses: 22)
let percentage = miami.winningPercentage

struct HockeyRecord: TeamRecord {
    var wins: Int
    var losses: Int
    var ties: Int
    
    var winningPercentage: Double {
        return Double(wins) / Double(wins) + Double(losses) + Double(ties)
    }
}

let boston = HockeyRecord(wins: 15, losses: 4, ties: 2)
let hockeyPercentage = boston.winningPercentage

extension CustomStringConvertible {
    var description: String {
        return ("Remember to implement CustomStringConvertable!")
    }
}
struct MyStruct: CustomStringConvertible { }
print(MyStruct())

protocol WinLoss {
    var wins: Int { get }
    var losses: Int { get }
}

extension WinLoss {
    var winningPercentage: Double {
        return Double(wins) / (Double(wins) + Double(losses))
    }
}

struct CricketRecord: WinLoss {
    var wins: Int
    var losses: Int
    var draws: Int
    
    var winningPercentage: Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(draws))
    }
}

let miamiTuples = CricketRecord(wins: 8, losses: 7, draws: 1)
let winLoss: WinLoss = miamiTuples

miamiTuples.winningPercentage
winLoss.winningPercentage
//results are different because static dispatching chooses an implementation based on the type of the constants

//use type constraint on protocol extensions
protocol PostSeasonEligible {
    var minimumWinsForPlayOffs: Int { get }
}


//in the extension of TeamRecord which has a type constraint of  Self: PostSeasonEligible that will apply the extension to all adopters of TeamRecord that also adopt PostSesonEligible.
extension TeamRecord where Self: PostSeasonEligible {
    var isPlayoffEligible: Bool {
        return wins > minimumWinsForPlayOffs
    }
}

//use type cpnstraints to create default implementations on specific type combinations.
protocol Tieable {
    var ties: Int { get }
}

extension TeamRecord where Self: Tieable {
    var winningPercentage: Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
    }
}

struct RugyRecord: TeamRecord, Tieable {
    var wins: Int
    var losses: Int
    var ties: Int
}

let rugyRecord = RugyRecord(wins: 8, losses: 7, ties: 1)
rugyRecord.winningPercentage

//Exercises page 381
protocol Item: CustomStringConvertible {
    var name: String { get }
    var clearance: Bool { get }
    var msrp: Double { get }
    var totalPrice: Double { get }
}

protocol Taxable: Item {
    var taxPercentage: Double { get }
}

protocol Discountable: Item {
    var adjustedMsrp: Double { get }
}

extension Item {
    var description: String {
        return name
    }
    var totalPrice: Double {
        return msrp
    }
}

extension Item where Self: Taxable {
    var totalPrice: Double {
        return msrp * (1 + taxPercentage)
    }
}

extension Item where Self: Discountable {
    var totalPrice: Double {
        return adjustedMsrp
    }
}

extension Item where Self: Taxable & Discountable {
    var totalPrice: Double {
        return adjustedMsrp * (1 + taxPercentage)
    }
}

struct Food: Taxable {
    let name: String
    var msrp: Double
    var clearance: Bool
    let expirationDate:(month: Int, year: Int)
    
    let taxPercentage = 0.075
    
    var adjustedMsrp: Double {
        return msrp * (clearance ? 0.5 : 1.0)
    }
    
    var description: String {
        return "\(name) - expires \(expirationDate.month)/\(expirationDate.year)"
    }
}

struct Clothing: Discountable {
    var name: String
    var clearance: Bool
    var msrp: Double
    
    var adjustedMsrp: Double {
        return msrp * (clearance ? 0.95 : 1.0)
    }
}

struct Electronics: Taxable, Discountable {
    var name: String
    var clearance: Bool
    var msrp: Double
    
    let taxPercentage = 0.075
    
    var adjustedMsrp: Double {
        return msrp * (clearance ? 0.95 : 1.0)
    }
}

extension Sequence {
    func randomized() -> [Iterator.Element] {
        return self.sorted { _ in
            arc4random_uniform(2) == 0
        }
    }
}

let ordered = [1, 2, 3, 4, 5, 6, 7, 8, 9]
ordered.randomized()
