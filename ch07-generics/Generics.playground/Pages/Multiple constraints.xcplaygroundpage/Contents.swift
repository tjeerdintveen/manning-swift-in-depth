//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Multiple constraints
//: We can try the multiple constraints on two ways

//func lowestOccurrences<T: Comparable & Hashable>(values: [T]) -> [T: Int] {
//    // ... snip
//}

//: But, a where clause is just the same.
func lowestOccurrences<T>(values: [T]) -> [T: Int]
    where T: Comparable & Hashable {
        // ... snip
        return [:]
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)




