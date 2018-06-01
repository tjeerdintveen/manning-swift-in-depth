//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import UIKit

//: # Pair type with conditional conformance

struct Pair<T: Hashable, U: Hashable>: Hashable {
    let left: T
    let right: U

    init(_ left: T, _ right: U) {
        self.left = left
        self.right = right
    }

}

let set: Set = [
    Pair("Laurel", "Hardy"),
    Pair("Harry", "Lloyd")
]

//: Manual Hashable implementation
//struct Pair<T: Hashable, U: Hashable>: Hashable {
//
//    let left: T
//    let right: U
//
//    init(_ left: T, _ right: U) {
//        self.left = left
//        self.right = right
//    }
//
//    var hashValue: Int {
//        return left.hashValue ^ right.hashValue &* 16777619
//    }
//
//    static func ==(lhs: Pair<T, U>, rhs: Pair<T, U>) -> Bool {
//        return lhs.left == rhs.left && lhs.right == rhs.right
//    }
//
//}


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
