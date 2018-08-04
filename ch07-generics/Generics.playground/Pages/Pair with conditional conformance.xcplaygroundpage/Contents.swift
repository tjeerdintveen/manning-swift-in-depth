//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Pair type with conditional conformance

struct Pair<T: Hashable, U: Hashable>: Hashable {
    let left: T
    let right: U

    init(_ left: T, _ right: U) {
        self.left = left
        self.right = right
    }

}

let pair = Pair<Int, Int>(10, 20)
print(pair.hashValue) //5280472796840031924

let set: Set = [
    Pair("Laurel", "Hardy"),
    Pair("Harry", "Lloyd")
]



//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
