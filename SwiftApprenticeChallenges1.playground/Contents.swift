//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 A temperature expressed in °C can be converted to °F by multiplying by 1.8 then incrementing by 32. In this challenge, do the reverse: convert a temperature from °F to °C. Declare a constant named fahrenheit of type Double and assign it a value. Calculate the corresponding temperature in °C and store the result in a constant named celcius.
*/

func fahrenheitToCelcius(fahrenheit: Double) -> Double {
    return (fahrenheit - 32) / 1.8
}

var test = fahrenheitToCelcius(fahrenheit: 100)

/*
 Suppose the squares on a chess board are numbered left to right, top to bo ttom, with 0 being the top-left square and 63 being the bottom-right square. Rows are numbered top to bottom, 0 to 7. Columns are numbered left to right, 0 to 7.
*/

let position = 60
let row = 60 / 8 - 1
let column = 60 % 8 - 1

/*
 Declare constants named dividend and divisor of type Double and assign both a value. Calculate the quotient and remainder of an integer division of dividend by divisor and store the results in constants named quotient and reminder. Calculate the remainder without using the operator %
 */

let dividend: Double = 32
let divisor: Double = 4.2

let quotient = dividend / divisor
let remainder = Int(dividend) - Int(divisor) * Int(quotient)

/* 
 A circle is made up of 2PI radians, corresponding with 360 degrees. Declare a constant degrees of type Double and assign it an initial value. Calculate the corresponding angle in radians and store the result in a constant named radians
 */
let degrees:Double = 45
let radians = (degrees / 180 ) * Double.pi

/*
 Declare four constants named x1, y1, x2, and y2 of type Double. These constants represent the 2-dimensional coordinates of two points. Calculate the distance between these two points and store the result in a constant named distance
 */
let x1: Double = 1
let y1: Double = 3
let x2: Double = -2
let y2: Double = -1

let dx = x1 - x2
let dy = y1 - y2
let distance = sqrt(dx * dx + dy * dy)

/*
 Notes
 code point: the number associated with each character
 String literal: ""
 Int: 64-bit
 signed types: Int8, Int16, Int32, Int64 consumes 1,2,4,8 bytes of storage
 only dealing with non-negative values: use unsigned types
 without using the extra 1-bit to represent the sign, you can store as twice as big as their signed counterparts
 1 bytes: 0-255, 2 bytes: 0-65535, 4 bytes: 4 million, 8 bytes: 2^63 -1
 Float type: 4 bytes with 6 digits precision
 Double type: 8 bytes with 16 digits precision
 
 */

let date: (month: Int, date: Int, year: Int, tempreture:Double) = (12, 13, 2016, 12.8)
let (_, day, _, averageTempreture) = date

let coordinatesChapter3 = (2, 3)
let namedCoordinateChapter3: (row: Int, column: Int) = (2, 3)

/*
 Notes
 prefix ! toggles true to false and false to true
 < and > to check alphabetical order of strings
 string's combining character: use a special character that modifies the previous character known as a grapheme cluster
 Unicode shorthand: \u followed by the code point in hexadecimal
 String comparison in Swift uses canonicalization - canonicalizes (convert to use the same special character representation) before checking equality
 scope - a way to encapsulate variables through the use of braces
 loops - executing code multiple times.
 while<CONDITION>{
   <LOOP CODE>
}
 repeat {
  <LOOP CODE>
 } while <CONDITION> //repeat loop will execute once even if the condition is false
 arc4random returns an integer between 0 and (2^32)-1 while arc4random_uniform returns an integer between 0 and the upper bound you pass it. arc4random_uniform is recommended as it avoids modulo bias while the upper bound is not a power of two.
 arc4random() % 5 is equal to arc4random_uniform(5)
 
 */

var hoursWorked = 45
var price = 0

if hoursWorked > 40 {
    let hoursWorkedOver40 = hoursWorked - 40
    price += hoursWorkedOver40 * 50
    hoursWorked -= hoursWorkedOver40
}
price += hoursWorked * 25
print(price)

let myAge = 25
let isTeenager: Bool
if myAge > 13 && myAge < 19 {
    print("You are a teenager")
    isTeenager = true
}else {
    print("You are NOT a teenager")
    isTeenager = false
}
let answerMyAge = isTeenager ? "You are a teenager" : "You are NOT a teenager"
print(answerMyAge)

var counterChapter3 = 0
var roll = 0

repeat {
    roll = Int(arc4random_uniform(6))
    print("roll is \(roll)")
    counterChapter3 += 1
} while roll != 0

//Given a number, determine if this number is a power of 2
let exampleNumber: Double = 1024
let result = log2(exampleNumber)
if result.truncatingRemainder(dividingBy: 1) == 0 {
    print("The number is power of 2")
}

//print a table of first 10 powers of 2
var counterForPowerOfTwo = 0
while counterForPowerOfTwo < 10 {
    var result = 2 * counterForPowerOfTwo
    print(result)
    counterForPowerOfTwo += 1
}
var exponent = 0
var power = 1
while exponent <= 10 {
    print("\(exponent)\t\(power)")
    exponent += 1
    power *= 2
}

//How many days feburary has
let thisYear = 2016
if thisYear % 4 == 0 && thisYear % 100 != 0 {
    "Feburary has 29 days"
}else if thisYear % 400 == 0 {
    "Feburary has 29 days"
}else{
    "Feburary has 28 days"
}

//Determine if the number is log2
let sampleNumber = 1024.0
let log = log2(sampleNumber)
if log == Double(Int(log)) {
    print("\(sampleNumber) is a power of 2")
}else {
    print("\(sampleNumber) is not a power of 2")
}

//calculate the nth fibonacci number
let goal = 10
var current = 1
var previous = 1
var done = 2
while done < goal {
    let next = current + previous
    previous = current
    current = next
    done += 1
}
print("Fibonacci number \(goal) is \(current)")

//factorial
let n = 5
var accumulator = 1
done = 1
while done < n {
    accumulator *= done
    done += 1
}
print("\(n)! is \(accumulator)")

//the chance of rolling a specific number using two-sided dice.
let targetValue = 5

var combinationsFound = 0
var valueOnFirstDice = 1
while valueOnFirstDice < 7 {
    var valueOnSecondDice = 1
    while valueOnSecondDice < 7{
        if valueOnFirstDice + valueOnSecondDice == targetValue {
            combinationsFound += 1
        }
        valueOnSecondDice += 1
    }
    valueOnFirstDice += 1
}
let chanceOfRolling = Int(Double(combinationsFound) / 36 * 100)
print("The odds of rolling a \(targetValue) are \(combinationsFound) in 36 or \(chanceOfRolling)%")

/*
 let closedRange = 0...5 (0, 1, 2, 3, 4, 5)
 let halfOpenRange = 0..<5 (0, 1, 2, 3, 4)
 for <CONSTANT> in <RANGE> {
   <LOOP CODE>
 }
 Function parameters get copied before passing into the function (pass-by-value)
 if you want a function to change its parameter value, mark it as inout (copy-in copy-out, call by value), add an ampersand(&) before the argument
 func incrementAndPrint(_ value: inout Int){
  value += 1
  print(value)
 }
 var value = 5
 incrementAndPrint(&value)
 print(value)
 
 Function overloading: different number of params, different param types, different external param names, different return type
 use overloading for related functions that behave similarly
 
 
 */
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var variableFunc = add
variableFunc(4, 2)

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}
variableFunc = subtract
subtract(4, 2)

func funcPrintResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}
funcPrintResult(add, 4, 2)
funcPrintResult(subtract, 4, 2)

//Use stride to loop more flexiably
for index in stride(from: 10, to: 22, by: 4) {
    print(index)
} // or change to to through to include the end

func isNumberDiviaible(_ number: Int, by divisor: Int) -> Bool {
    if number % divisor == 0 {
        return true
    }
    return false
}

func isPrime(_ number: Int) -> Bool {
    //always consider the anomallies and base case
    if number < 0 {
        return false
    }
    if number <= 3{
        return true
    }
    let root = Int(sqrt(Double(number)))
    for divisor in 2...root {
        if isNumberDiviaible(number, by: divisor) {
            return false
        }
    }
    return true
}

isPrime(13)

func fibonacci(_ number: Int) -> Int {
    if number < 0 {
        return 0
    }
    if number == 1 || number == 2 {
        return 1
    }
    return fibonacci(number - 1) + fibonacci(number - 2)
}

print(fibonacci(10))

/*
 sentinel value: absense of value
 An optional type is allowed to reference wither a value or nil
 optional binding:
    if let unwrappedAuthorName = authorName {
        print("Author is \(unwrappedAuthorName"))
    } else {
        print("No author")
    }
 use guard statement to return early:
    guard <CONDITION> (boolean or optional binding) else {
        return
    }
 nil coalescing:
    var mustHaveResult = optionalInt ?? 0 // will equal to either value inside optionalInt or 0 if prev is nil
 
 
 */

//assign a closure to a variable
var multiplyClosure = { (a: Int, b: Int) -> Int in
 return a * b
}
/*
 no need to write return if you have single return statement
 use type reference to shorten syntax by not writing param type
 omit param list by using &0, &1
 closure with no return type: -> Void
 filter: takes a single param (a closure or function takes an element) and returns a Bool
 map: takes a closure, execute it on each item in he array and return a new array containing each result with order maintained
 reduce:takes a starting value and a closure(with the current value and an element from the array)
    let sum = prices.reduce(0) {
        return $0 + $1
        }
 
 */

let nameArray = ["Alice", "Bobby", "Celia", "Duke", "Elena", "John"]
let allNames = nameArray.reduce("") {
    $0 + $1
}
let fourCharNames = nameArray.filter() {
    return $0.characters.count > 4
    }.reduce(""){
        $0 + $1
}

let nameAndAges = ["Alice": 14, "Bobby": 19, "Celia": 25, "Duke": 32, "Elena": 21, "John": 9].filter() {
    return $0.value >= 18
    }.map(){
        return $0.key
}

//Run the task closure, times number of times
func repeatTask(times: Int, task: () -> Void) {
    var counter = 0
    while counter < times {
        task()
        counter += 1
    }
}

repeatTask(times: 3, task: { print("Print this line")})

//write a reuseable function to calculate sums
func mathSum(length: Int, series: (Int) -> Int ) -> Int {
    return (1...length).map(){
        series($0)
    }.reduce(0, +)
}
mathSum(length: 10){
    $0 * $0
}

//use forEach to iterate through, use reduce to calculate the average ratings
let appRatings = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]

var averageRatings: [String: Double] = [:]
appRatings.forEach(){ dict in
    let ratings = dict.value
    //Average rating should be a Double!!
    averageRatings[dict.key] = Double(ratings.reduce(0, +)) / Double(ratings.count)
}
print(averageRatings)

let highlyRatedApps = averageRatings.filter(){
    return $0.value >= 3
    }.map() {
        return $0.key
}
print(highlyRatedApps)

/*
 named types: struct, properties, methods, classes, enum, protocol, generics
 allows you to encapsulate related properties and behaviors
 Double, String, Bool, Array and Dict are defiend as structs
 type property declared using static var - on the struct itself rather than on the instances, the same value can be retrieved from anywhere
 computed property - calculated every time it's accessed, expected to change
 property observers - willSet(newValue), didSet(oldValue), not called during initialization
 lazy stored property - calculation postponed until the first time its' accessed, must be declared a var even though value only changes once
 
 
 */

struct IceCream {
    let name: String = "ice cream"
    lazy var ingredients: [String] = {
        return ["Ingredient1, Ingredient2, Ingredient3"]
    }()
}

struct FuelTank {
    var lowFuel: Bool
    var level: Double {
        didSet {
            if level < 0 {
                level = 0
            }
            if level > 1 {
                level = 1
            }
            if level < 0.1{
                lowFuel = true
            }else{
                lowFuel = false
            }
        }
    }
}

struct Car {
    let make: String
    let color: String
    var tank: FuelTank
}

var car = Car(make: "Toyota", color:"Black", tank:FuelTank(lowFuel:false, level: 1))
car.tank.level = -1
print(car.tank.lowFuel)
car.tank.level = 1
print(car.tank.lowFuel)

/*
 properties holds values, methods perform work
 keyword mutating marks a method that changes a structure's value, this method must not be called on constants
 prefix static to create type methods rather than instance methods
 add init() as an extension to a struct to keep compiler generated memberwise initializer
 
 */

struct Math {
    static func factorial(of number: Int) -> Int {
        return (1...number).reduce(1, *)
    }
    static func triangle(of number: Int) -> Int {
        return (1...number).reduce(0, +)
    }
}
let factorial = Math.factorial(of: 6) //720
let triangleNumber = Math.triangle(of: 6) // 21

//When you want to add functionality but cannot access source code, use extension. It's not possible to add stored properties to existing structures becasue that would change the size and memory layout of the structure and break existing code.
extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        var remainingValue = value
        var testFactor = 2
        var primes: [Int] = []
        
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
    static func isEven(number: Int) -> Bool{
        return number % 2 == 0
    }
    static func isOdd(number: Int) -> Bool{
        //return number % 2 != 0
        return (number + 1) % 2 == 0
    }
}

let primeFactor = Math.primeFactors(of: 75)
let isEven = Math.isEven(number: 3)
let isOdd = Math.isOdd(number: 3)


struct Circle {
    var radius = 0.0
    var area: Double {
        get {
            return .pi * radius * radius
        }
        set {
            radius = sqrt(newValue / .pi)
        }
    }
    init(radius: Double){
        self.radius = radius
    }
    func grow(byfactor number: Double) -> Double{
        return self.area * number
    }
}
let circle = Circle(radius: 5)
let area = circle.area
let areaOnSteroids = circle.grow(byfactor: 5)

/*
 == checks if two values are equal, === compares the memory address of two references
 when overriding methods, call super.yourMethods() first. That way, the super class won't experience any side effects introduced by its subclass, and subclass won't need to know implementation details of its super class.
 preventing inheritance - mark class as final
 Initializers requires calling super.init() after you initialize properties
 Two-phase initialization - 1) initialize all of the stored properties in the class instance, 2) use properties and methods as well as initializations requires using self.
 */