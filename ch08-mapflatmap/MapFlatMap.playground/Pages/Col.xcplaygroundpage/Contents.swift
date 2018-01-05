//: [Previous](@previous)

import Foundation

//
let keysAndValues = ["john": 32, "mary": 28, "jeff": 36].map { tuple in
    return (tuple.key.capitalized, tuple.value)
}

print(keysAndValues) // [("John", 32), ("Mary", 28), ("Jeff", 36)]


//
//print(keysAndValues) // [(key: "John", value: 32), (key: "Mary", value: 28), (key: "Jeff", value: 36)]

//let dictFromTuples = Dictionary(keysAndValues, uniquingKeysWith: { (first, last) in first })
//let dictFromTuple = Dictionary(keysAndValues) { (first: (String, Int), last: (String, Int)) -> (String, Int) in
//    first
//}
//let dictFromTuple = Dictionary(keysAndValues) { (first, last) in
//    first
//}
//print(dictFromTuple)

//let keysAndValues = [(key: "John", value: 32), (key: "Mary", value: 28), (key: "Jeff", value: 36)]
let dict = Dictionary(uniqueKeysWithValues: keysAndValues)
print(dict) // ["Jeff": 36, "Mary": 28, "John": 32]

//: [Next](@next)
