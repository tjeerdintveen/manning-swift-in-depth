//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Exercises and answers

//: 1. Which ones of the following functions will compile? Confirm this by running the code.

//func wrap<T>(value: Int, secondValue: T) -> ([Int], U) {
//    return ([value], secondValue)
//}

// This one will work.
func wrap<T>(value: Int, secondValue: T) -> ([Int], T) {
    return ([value], secondValue)
}

//func wrap(value: Int, secondValue: T) -> ([Int], T) {
//    return ([value], secondValue)
//}

//func wrap<T>(value: Int, secondValue: T) -> ([Int], Int) {
//    return ([value], secondValue)
//}

// This one will work.
func wrap<T>(value: Int, secondValue: T) -> ([Int], Int)? {
    if let secondValue = secondValue as? Int {
        return ([value], secondValue)
    } else {
        return nil
    }
}

//: 2. What's the benefit in using generics over the `Any` type? E.g. Writing a function as `func<T>(process: [T])` versus `func(process:[Any])`.

//: By using a generic, code is made polymorphic at compile time. By using Any you have to downcast at runtime.

//: 3. Write a function that given an array, returns a dictionary of the occurrences of each element inside the array

func occurrences<T: Hashable>(values: [T]) -> [T: Int] {
    var groupedValues = [T: Int]()
    
    for element in values {
        groupedValues[element, default: 0] += 1
    }
    
    return groupedValues
}

print(occurrences(values: ["A", "A", "B", "C", "A"])) // ["C": 1, "B": 1, "A": 3]
//: 3. Create a logger that prints a generic type's description and debug description when passed.

//: Hint: Besides CustomStringConvertible which makes sure types implement a description property, Swift also offers CustomDebugStringConvertible, which makes type implement a debugDescription property.

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


//: 4. Write a generic cache that allows you to store and retrieve any type of Hashable value.

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
