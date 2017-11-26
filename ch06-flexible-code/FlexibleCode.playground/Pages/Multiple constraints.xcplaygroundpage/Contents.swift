//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Multiple constraints

func occurrences<T: Hashable>(values: [T]) -> [T: Int] {
        var groupedValues = [T: Int]()
        
        for element in values {
            groupedValues[element, default: 0] += 1
        }
        
        return groupedValues
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)




