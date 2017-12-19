//: [Previous](@previous)

import Foundation

let string = "44"
let int = Int(string)
print(int) // Optional(44)

let notANumber = "Turtles"
let notAProperInt = Int(notANumber)
print(notAProperInt) // nil



let integers = ["1", "2", "OMG SHOES", "4", "5"].map(Int.init)
print(integers) // [Optional(1), Optional(2), nil, Optional(4), Optional(5)]




let filteredIntegers = ["1", "2", "OMG SHOES", "4", "5"].flatMap(Int.init)
print(filteredIntegers) // [1, 2, 4, 5]


let optionalArray = [Optional(1), nil, Optional(2)]
for case let int? in optionalArray {
    print("The integer is \(int)")
}


//: [Next](@next)
