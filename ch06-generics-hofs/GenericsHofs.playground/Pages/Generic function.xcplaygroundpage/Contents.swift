//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Generic function

/// All indicates if all elements inside an array conform to a predicate.
///
/// - Parameters:
///   - array: An array of values
///   - predicate: A closure which returns true or false, if each element conforms.
/// - Returns: A boolean indicating all or nothing conform to a predicate.
func all<T>(array: [T], predicate: (T) -> Bool) -> Bool {
    for element in array {
        if !predicate(element) {
            return false
        }
    }
    
    return true
}

let numbers = [5,6,7,8,9]
let allMoreThanFour = all(array: numbers) { (int: Int) -> Bool in
    return int > 4
}
print(allMoreThanFour) // true

let strings = ["Jay", "Jeff", "John"]
let allStartWithJ = all(array: strings) { (string: String) -> Bool in
    guard let char = string.first else { return false }
    return char == "j" || char == "J"
}
print(allStartWithJ) // true

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
