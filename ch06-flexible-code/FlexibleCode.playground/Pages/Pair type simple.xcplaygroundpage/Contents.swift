//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import UIKit

//: # Pair type simple

struct Pair<T: Hashable, U: Hashable> {
    let left: T
    let right: U
    
    init(_ left: T, _ right: U) {
        self.left = left
        self.right = right
    }
}

let somePair = Pair("Age", 36)
let anotherPair = Pair("Age", 13)

let set = Set([somePair, anotherPair])
print(set)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
