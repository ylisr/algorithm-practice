//: Playground - noun: a place where people can play

import UIKit

extension Int {
    mutating func plusOne() {
        self += 1
    }
}

extension Int {
    func squared() -> Int {
        return self * self
    }
}

//Note: self - my current value, Self - my current data type
extension Integer {
    func squared() -> Self {
        return self * self
    }
}

extension String {
    mutating func trimmed() {
        self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

var myInt = 0
myInt.plusOne()
let i: Int = 8
print(i.squared())

