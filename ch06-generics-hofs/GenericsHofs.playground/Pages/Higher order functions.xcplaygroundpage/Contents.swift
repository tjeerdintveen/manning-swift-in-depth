//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Higher order functions

import Foundation

//: ## Thrice

/// Thrice performs a passed closure three times
///
/// - Parameter function: A closure that accepts no parameters and returns nothing
func thrice(function: () -> Void) {
    function()
    function()
    function()
}

thrice {
    print("I miss Objective-C")
}

//: ## Checking if all elements conform

let numbers = [2, 3, 4]

//: It can be done via a filter

//let allMoreThanOne = numbers.filter { $0 > 1 }.count == numbers.count
//print(allMoreThanOne) // true

//: Or a for loop

var allMoreThanOne = true
for number in numbers {
    if number <= 1 {
        allMoreThanOne = false
        break
    }
}

//: ## All

/// All indicates if all integers inside an array conform to a predicate.
///
/// - Parameters:
///   - array: An array of integers
///   - predicate: A closure which returns true or false, if each element conforms.
/// - Returns: A boolean indicating all or nothing conform to a predicate.
func all(array: [Int], predicate: (Int) -> Bool) -> Bool {
    for element in array {
        if !predicate(element) {
            return false
        }
    }
    return true
}

let moreThanOne = all(array: numbers) { (int: Int) -> Bool in
    return int > 1
}

print(moreThanOne) // true

let areAllEven = all(array: numbers) { (int: Int) -> Bool in
    return int % 2 == 0
}

print(areAllEven) // false

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
