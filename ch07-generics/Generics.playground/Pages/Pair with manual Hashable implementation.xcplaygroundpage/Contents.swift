//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Pair with manual Hashable implementation

struct Pair<T: Hashable, U: Hashable>: Hashable {
    
    let left: T
    let right: U
    
    init(_ left: T, _ right: U) {
        self.left = left
        self.right = right
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(left)
        hasher.combine(right)
    }
    
    static func ==(lhs: Pair<T, U>, rhs: Pair<T, U>) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right
    }
    
}

let pair = Pair("Madonna", "Cher")

var hasher = Hasher()
hasher.combine(pair)
// alternatively: pair.hash(into: &hasher)
let hash = hasher.finalize()
print(hash) // 4922525492756211419

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

