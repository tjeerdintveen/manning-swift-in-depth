//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Bonus: Testing hash collissions
//: Uncomment code below to see algorithm in action. Try it against the original XOR algorithm!

import Foundation

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

struct Hasher {
    
    static func calculateHash<T: Hashable, U: Hashable>(lhs: T, rhs: U) -> Int {
        var result = 17
        result = 37 &* result &+ lhs.hashValue
        result = 37 &* result &+ rhs.hashValue
        return result
    }
    
}

//: ## Uncomment me
//: Here you can test hash collissions with custom algorithms
/*
let (width, height) = (1000, 1000)
let total = width * height
var hashes = Set<Int>()
for x in 0..<width {
    for y in 0..<height {
        //: Try using XOR here instead.
        hashes.insert(Pair(x, y).hashValue)
    }
}

 print("\(hashes.count) unique hashes out of a total of \(total).")
// The general purpose algorithm generates 37963 unique hashes out of a total of 1000000 with x y number values.
*/
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
