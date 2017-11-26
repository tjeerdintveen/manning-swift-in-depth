//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Exercises and answers

//: 1. Write a function called "call", which will accept an integer x and will call a passed function x times.
import Foundation

func call(times: Int, function: () -> Void) {
    for _ in 0..<times {
        function()
    }
}

//: 2. Expand the call function so that it collects all the results from a passed function into an array, returning the array.

func callCollect(times: Int, function: () -> Int) -> [Int] {
    var result = [Int]()
    
    for _ in 0..<times {
        result.append(function())
    }
    
    return result
}

let result = callCollect(times: 4) { () -> Int in
    return 100
}

print(result)

//: 3. Create a function that generates an integer an X number of times, then passes these results to a second function which turns these integers into a String. When done, the function will return all strings. E.g.:

func callCombined(times: Int, lhs: () -> Int, rhs: (Int) -> String) -> [String] {
    var result = [String]()
    
    for _ in 0..<times {
        let value = lhs()
        result.append(rhs(value))
    }
    
    return result
}

let combinedResult = callCombined(times: 3, lhs: { () -> Int in
    return 3
}) { (value: Int) -> String in
    return "I received \(value)"
}

print(combinedResult) // ["I received 3", "I received 3", "I received 3"]

//: 4. Call a function that passes the result of a first function into a completion block.
func callCompletion<T>(call: () -> T, completion: (T) -> Void) {
    completion(call())
}

callCompletion(call: {
    "I am returning a String"
}) { (value) in
    print("I received: \(value)")
}

callCompletion(call: {
    return 100
}) { (value) in
    print("I received: \(value)")
}

//: 5. Write a higher-order function that accepts two same-type arrays and combines their values 1 by 1 via a passed function. When done, the function will return an array with all results from the passed function.

func zipWith<T>(lhs: [T], rhs: [T], combine: (T, T) -> T) -> [T] {
    var results = [T]()
    for (lhsValue, rhsValue) in zip(lhs, rhs) {
        let result = combine(lhsValue, rhsValue)
        results.append(result)
    }
    return results
}

let zipWithResult = zipWith(lhs: [1,2,3], rhs: [100,200,300]) { (lhs: Int, rhs: Int) -> Int in
    return lhs + rhs
}

print(zipWithResult) // [101, 202, 303]

let boolResults = zipWith(lhs: [true, true, false], rhs: [false, true, false]) { (lhs: Bool, rhs: Bool) -> Bool in
    return lhs && rhs
}

print(boolResults) // [false, true, false]

//: 6 Which ones of the following functions will compile? Confirm this by running the code.

//func wrap<T>(value: Int, secondValue: T) -> ([Int], U) {
//    return ([value], secondValue)
//}

// This one will work.
//func wrap<T>(value: Int, secondValue: T) -> ([Int], T) {
//    return ([value], secondValue)
//}

//func wrap(value: Int, secondValue: T) -> ([Int], T) {
//    return ([value], secondValue)
//}

//func wrap<T>(value: Int, secondValue: T) -> ([Int], Int) {
//    return ([value], secondValue)
//}

// This one will work.
//func wrap<T>(value: Int, secondValue: T) -> ([Int], Int)? {
//    if let secondValue = secondValue as? Int {
//        return ([value], secondValue)
//    } else {
//        return nil
//    }
//}

//: 7. Write a function that given an array, returns a dictionary of the occurrences of each element inside the array

func occurrences<T: Hashable>(values: [T]) -> [T: Int] {
    var groupedValues = [T: Int]()
    
    for element in values {
        groupedValues[element, default: 0] += 1
    }
    
    return groupedValues
}

print(occurrences(values: ["A", "A", "B", "C", "A"])) // ["C": 1, "B": 1, "A": 3]

//: 8. Write a generic function that filters out all duplicate values from an array.

func unique<T: Hashable>(values: [T]) -> [T] {
    var set = Set<T>()
    
    var results = [T]()
    
    for element in values {
        if !set.contains(element) {
            results.append(element)
            set.insert(element)
        }
    }
    
    return results
}

print(unique(values: ["A", "A", "B", "C", "A"])) // ["A", "B", "C"]

//: 9. Besides CustomStringConvertible which makes sure types implement a description property, Swift also offers CustomDebugStringConvertible, which makes type implement a debugDescription property. Create a logger that will print a generic type's description and debugscription when passed.

struct CustomType: CustomDebugStringConvertible, CustomStringConvertible {
    var description: String {
        return  "This is my description"
    }
    
    var debugDescription: String {
        return "This is my debugDescription"
    }
}

struct Logger {
    func log<T>(type: T)
        where T: CustomStringConvertible & CustomDebugStringConvertible {
            print(type.debugDescription)
            print(type.description)
    }
}

let logger = Logger()
logger.log(type: CustomType())

//: 10. Write a validator that accepts a validating closure, allowing it to validate a value that's passed to it. E.g.:

struct Validator<T> {
    let validation: ((T) -> Bool)
    
    func isValid(_ value: T) -> Bool {
        return validation(value)
    }
}

let isNotEmptyValidator = Validator { (value: String) -> Bool in
    return !value.isEmpty
}

isNotEmptyValidator.isValid("Abcdef") // true
isNotEmptyValidator.isValid("") // false

let ageValidator = Validator { $0 > 18 } // Validate if age is older than 18
ageValidator.isValid(19) // true
ageValidator.isValid(17) // false

//: 11. Write a generic cache that allows you to store and retrieve any type of value.

class MiniCache<T: Hashable, U> {
    
    var cache = [T: U]()

    init() {}
    
    func insert(key: T, value: U) {
        cache[key] = value
    }
    
    func read(key: T) -> U? {
        return cache[key]
    }
    
}

let cache = MiniCache<Int, String>()
cache.insert(key: 100, value: "Jeff")
cache.insert(key: 200, value: "Miriam")
cache.read(key: 200) // Optional("Miriam")
cache.read(key: 99) // Optional("Miriam")

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
