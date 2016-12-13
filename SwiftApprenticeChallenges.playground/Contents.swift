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















