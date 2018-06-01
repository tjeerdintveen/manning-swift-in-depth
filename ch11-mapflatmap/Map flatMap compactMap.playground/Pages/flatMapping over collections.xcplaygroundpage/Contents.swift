//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # flatMapping over collections

//: We can create a new array inside flatMap, which will instantly be flattened.

let repeated = [2, 3].flatMap { (value: Int) -> [Int] in
    return [value, value]
}

print(repeated) // [2, 2, 3, 3]

//: We can flatten an existed nested array with flatMap, if we don't perform any actions inside the flatMap closure.

let stringsArr = [["I", "just"], ["want", "to"], ["learn", "about"], ["protocols"]]
let flattenedArray = stringsArr.flatMap { $0 }
print(flattenedArray) // ["I", "just", "want", "to", "learn", "about", "protocols"]


//: Strings are collections, which can also be flatMapped.

extension String {
    func interspersed(_ element: Character) -> String {
        let characters = self.flatMap { return [$0, element] }.dropLast()
        return String(characters)
    }
}

let interspersedString = "Swift".interspersed("-")
print(interspersedString) // S-w-i-f-t

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
