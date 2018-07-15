//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Mapping over sequences

let names = [
    "John",
    "Mary",
    "Elizabeth"
]
let nameCount = names.count

let generatedNames = (0..<5).map { index in
    return names[index % nameCount]
}

print(generatedNames) // ["John", "Mary", "Elizabeth", "John", "Mary"]

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
