//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Generic constrained function

//: Expanded function body

/// Returns the lowest value inside an array, determined by comparable.
///
/// - Parameter array: AN array of values
/// - Returns: The lowest value
//func lowest<T: Comparable>(_ array: [T]) -> T? {
//    let sortedArray = array.sorted { (lhs, rhs) -> Bool in
//        return lhs < rhs
//    }
//    return sortedArray.first
//}

//: Short function body

func lowest<T: Comparable>(_ array: [T]) -> T? {
    return array.sorted().first
}

lowest([1,2,3])
lowest(["b","c","a"])
lowest([3.0, 3000, 2.3])

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
