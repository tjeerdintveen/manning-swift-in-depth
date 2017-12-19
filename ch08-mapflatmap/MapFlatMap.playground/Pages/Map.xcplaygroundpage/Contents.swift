//: [Previous](@previous)

import Foundation



//func wrap(_ string: String, tag: String) -> String {
//    return
//}
//

//let rankings = [1,2,4,2,3,1]
//let languages = ["Swift", "Go", "Python", "Rust", "Kotlin"]
//
//let rankedResults = zip(rankings,languages)
//    .filter { (tuple) -> Bool in
//        return tuple.0 > 2
//    }
//    .sorted { (lhs, rhs) -> Bool in
//        lhs.0 > rhs.0
//    }.map { (tuple) -> String in
//        return tuple.1
//}
//
//print(rankedResults)
//
//var loopCount = 0
//var filterLoopCount = 0
//var capitalizeLoopCount = 0
//let languages = "swift,go,python,rust,kotlin"
//let list =
//    languages
//        .split(separator: ",")
//        .lazy
//        .filter(filterKotlin)
//        .map(capitalize)
//        // Query database, for more information?
////        .sorted()
//
//// ["Go", "Python", "Rust", "Swift"]
//
//let arr = Array(list)
//print(arr)
//print(loopCount)
//print("filterloopcount \(filterLoopCount)")
//print("capitalizeLoopCount \(capitalizeLoopCount)")

var nrs = [1,2,3,4,5]
let parts = nrs.partition { (int: Int) -> Bool in
    return int == 2
}

print(nrs)

//func filterKotlin(_ string: String.SubSequence) -> Bool {
//    loopCount += 1
//    filterLoopCount += 1
//    return string != "kotlin"
//}
//
//func capitalize(_ string: String.SubSequence) -> String {
//    loopCount += 1
//    capitalizeLoopCount += 1
//    return string.prefix(1).uppercased() + string.dropFirst()
//}

//print(list) // ["<li> Go</li>", "<li> Kotlin</li>", "<li> Python</li>", "<li> Rust</li>", "<li>Swift</li>"]


//
//let elements = ["RESULTS:", "Swift", "Go", "Python", "Rust", "Kotlin"]
//
//let wrappedElements =
//    elements
//        .dropFirst()
//        .sorted()
//        .map { string in
//            return wrap(string, tag: "li")
//}
//
//print(wrappedElements) // ["<li>Go</li>", "<li>Kotlin</li>", "<li>Python</li>", "<li>Rust</li>", "<li>Swift</li>"]



let mappedDictionary = ["Swift": 6, "Fortran": 1, "Go": 4, "Javascript": 7].mapValues { (weight: Int) -> String in
    switch weight {
    case 0...1: return "Not popular"
    case 2...4: return "Fairly popular"
    case 5...: return "Very popular"
    default: return "Unknown"
    }
}

print(mappedDictionary)

let result = (1..<3).map { (int: Int) -> Int in
    return int + 1000
}

print(result)

//: [Next](@next)


let words = ["one", "two", "three", "four"]
let numbers = 1...4


let someSequence: Zip2Sequence = zip(words, numbers)

let array = zip(words, numbers).map { (tuple) -> String in
    let string = tuple.0
    let int = tuple.1
    
    return "String is \(string) int is \(int)"
}
