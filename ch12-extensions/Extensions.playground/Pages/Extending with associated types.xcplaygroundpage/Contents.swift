//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Extending with associated types

import Foundation


//: ## Extending Array

extension Array where Element: Equatable {
     func unique() -> [Element] {
        var uniqueValues = [Element]()
        for element in self {
            if !uniqueValues.contains(element) {
                 uniqueValues.append(element)
            }
        }
        return uniqueValues
    }
}

//: ## Extending Collection

//: This time we're extending Collection instead of Array

extension Collection where Element: Equatable {
    func unique() -> [Element] {
        var uniqueValues = [Element]()
        for element in self {
            if !uniqueValues.contains(element) {
                uniqueValues.append(element)
            }
        }
        return uniqueValues
    }
}

//: Trying out our extensions

// Array still has unique()
[3, 2, 1, 1, 2, 3].unique() // [3, 2, 1]

// Strings can be unique() now, too
"aaaaaaabcdef".unique() // ["a", "b", "c", "d", "e", "f"]

// Or a Dictionary's values
let uniqueValues = [1: "Waffle",
 2: "Banana",
 3: "Pancake",
 4: "Pancake",
 5: "Pancake"
].values.unique()

print(uniqueValues) // ["Banana", "Pancake", "Waffle"]

//: ## Extending with Hashable types

// This extension is an addition, it is NOT replacing the other extension.
extension Collection where Element: Hashable {
     func unique() -> [Element] {
        var set = Set<Element>()
        var uniqueValues = [Element]()
        for element in self {
            if !set.contains(element) {
                uniqueValues.append(element)
                set.insert(element)
            }
        }
        return uniqueValues
    }
}

//: ## Extending Set

extension Set {
    func unique() -> [Element] {
        return Array(self)
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
