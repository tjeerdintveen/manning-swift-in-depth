//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import UIKit

//: # Pair type

struct Pair<T: Hashable, U: Hashable>: Hashable {
    let left: T
    let right: U
    
    let hashFunction: (T, U) -> Int
    
    var hashValue: Int {
        return hashFunction(left, right)
    }
    
    init(_ left: T, _ right: U, hashFunction: @escaping (T, U) -> Int = Hasher.calculateHash) {
        self.left = left
        self.right = right
        self.hashFunction = hashFunction
    }
    
    static func ==(lhs: Pair<T, U>, rhs: Pair<T, U>) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right
    }
    
}
//: ## Hasher
//: A hashing algorithm

struct Hasher {
    
    static func calculateHash<T: Hashable, U: Hashable>(lhs: T, rhs: U) -> Int {
        var result = 17
        result = 37 &* result &+ lhs.hashValue
        result = 37 &* result &+ rhs.hashValue
        return result
    }
    
}

//: Default back to the calculateHash function
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
