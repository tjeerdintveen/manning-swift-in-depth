//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import UIKit

//: # Pair type

struct Pair<T: Hashable, U: Hashable>: Hashable {
    let left: T
    let right: U
    
    let hashFunction: (T, U) -> Int
    
    static func defaultHashFunction(_ lhs: T, _ rhs: U) -> Int {
        return lhs.hashValue ^ rhs.hashValue &* 16777619
    }
    
    var hashValue: Int {
        return Pair<T, U>.defaultHashFunction(left, right)
    }
    
    init(_ left: T, _ right: U, hashFunction: @escaping (T, U) -> Int = defaultHashFunction) {
        self.left = left
        self.right = right
        self.hashFunction = hashFunction
    }
    
    static func ==(lhs: Pair<T, U>, rhs: Pair<T, U>) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right
    }
    
}


//: Default back to the defaultHashFunction
let defaultPair = Pair("Age", 30)

//: Use a custom function to combine hash values, such as the XOR operator
let customPair = Pair("Age", 32, hashFunction: ({ (lhs: String, rhs: Int) -> Int in
    return lhs.hashValue ^ rhs.hashValue
}))

let pairs = Set([defaultPair, customPair])
var dictionary = [Pair<String, Int>: String]()
dictionary[defaultPair] = "Pair is now a key"
dictionary[customPair] = "Another pair fits in here too!"

defaultPair.hashValue
customPair.hashValue

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
