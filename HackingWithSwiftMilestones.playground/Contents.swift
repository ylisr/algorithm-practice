//: Playground - noun: a place where people can play

import UIKit

//Milestone 1
func fizzBuzz(num: Int) -> String {
    if num % 3 == 0 && num % 5 == 0 {
        return "FizzBuzz"
    }else if num % 3 == 0 {
        return "Fizz"
    }else if num % 5 == 0 {
        return "Buzz"
    }
    return "\(num)"
}

fizzBuzz(num: 3)
fizzBuzz(num: 5)
fizzBuzz(num: 15)
fizzBuzz(num: 16)

func continuousFizzBuzz(num: Int){
    for i in 1...num{
        switch (i % 3, i % 5) {
        case (0, 0):
            print("FizzBuzz",terminator: " ")
        case (0, _):
            print("Fizz",terminator: " ")
        case (_, 0):
            print("Buzz",terminator: " ")
        default:
            print("\(i)", terminator: " ")
        }
    }
}
continuousFizzBuzz(num: 16)
