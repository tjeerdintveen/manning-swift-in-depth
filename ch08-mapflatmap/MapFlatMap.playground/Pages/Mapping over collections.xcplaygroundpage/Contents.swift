//: [Previous](@previous)

import Foundation
//
//let keysAndValues = ["john": 32, "mary": 28, "jeff": 36].map { tuple in
//    return (key: tuple.key.capitalized, value: tuple.value)
//}
//
//print(keysAndValues) // [(key: "John", value: 32), (key: "Mary", value: 28), (key: "Jeff", value: 36)]
//
////let dictFromTuples = Dictionary(keysAndValues, uniquingKeysWith: { (first, last) in first })
////let dictFromTuple = Dictionary(keysAndValues) { (first: (String, Int), last: (String, Int)) -> (String, Int) in
////    first
////}
////let dictFromTuple = Dictionary(keysAndValues) { (first, last) in
////    first
////}
////print(dictFromTuple)
//let firstValues = Dictionary(keysAndValues,
//                             uniquingKeysWith: { (first, _) in first })
//print(firstValues)

let range = (0..<10)
let values = range.map { $0 + 100 }
print(values) // [100, 101, 102, 103, 104, 105, 106, 107, 108, 109]

let strideSequence = stride(from: 0, through: 20, by: 5)
let strideValues = strideSequence.map {
    return [$0, $0]
}
print(strideValues) // [[0, 0], [5, 5], [10, 10], [15, 15], [20, 20]]

import UIKit
let points = zip(range, strideSequence).map { (tuple: (Int, Int)) -> CGPoint in
    return CGPoint(x: tuple.0, y: tuple.1)
}
print(points) // [(0.0, 0.0), (1.0, 5.0), (2.0, 10.0), (3.0, 15.0), (4.0, 20.0)]

//stride(from: 0, to: 20, by: 5)
//
//let mapped = zip((0..<10), stride(from: 0, to: 20, by: 5)).map { (tuple) -> CGPoint in
//    return CGPoint(x: tuple.0, y: tuple.1)
////    print("--")
////    print(tuple.0)
////    print(tuple.1)
////
////    return tuple.0 + tuple.1
//}
//print(mapped)
//zip((stride(from: 5, to: 1, by: -1), stride(from: 5, to: 1, by: -1)))
//
//for int in stride(from: 5, to: 1, by: -1) {
//    print(int)
//}

//let zipped = zip((10..>0),(0..<10)).map { (tuple) in
//    return tuple.0 + tuple.1
//}
//print(zipped)

//let results = ("A"..<"Z").map { $0 }
//let values = (0..<10).map { (index: Int) -> Int in
//    return index + index
//}

//print(values) // [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]

//: [Next](@next)
