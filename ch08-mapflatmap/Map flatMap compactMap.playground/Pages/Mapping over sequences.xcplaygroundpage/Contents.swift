//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Mapping over sequences

let names = [
    0: "John",
    1: "Mary",
    2: "Elizabeth"
]
let nameCount = names.count

let generatedNames = (0..<5).map { index in
    return names[index % nameCount]
}

print(generatedNames) // [Optional("John"), Optional("Mary"), Optional("Elizabeth"), Optional("John"), Optional("Mary")]

let strideSequence = stride(from: 0, through: 20, by: 5)
let strideValues = strideSequence.map {
    return [$0, $0]
}
print(strideValues) // [[0, 0], [5, 5], [10, 10], [15, 15], [20, 20]]

import UIKit

let range = (0..<10)
let strideSequence = stride(from: 0, through: 20, by: 5)
let points = zip(range, strideSequence).map { (tuple: (Int, Int)) -> CGPoint in
    return CGPoint(x: tuple.0, y: tuple.1)
}

print(points) // [(0.0, 0.0), (1.0, 5.0), (2.0, 10.0), (3.0, 15.0), (4.0, 20.0)] <5>


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
