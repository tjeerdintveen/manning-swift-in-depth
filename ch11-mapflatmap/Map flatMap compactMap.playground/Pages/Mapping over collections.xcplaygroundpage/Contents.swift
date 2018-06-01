//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Mapping over collections

// Iterative style
//func resolveCounts(statistics: [(String, Int)]) -> [String] {
//    var resolvedCommits = [String]()
//    for (name, count) in statistics {
//        let involvement: String
//
//        switch count {
//        case 0: involvement = "\(name) is not involved in the project"
//        case 1..<100: involvement =  "\(name) is not active on the project"
//        default: involvement =  "\(name) is active on the project"
//        }
//
//        resolvedCommits.append(involvement)
//    }
//    return resolvedCommits
//}

// Functional style

func resolveCounts(statistics: [(String, Int)]) -> [String] {
    return statistics.map { (name: String, count: Int) -> String in
        switch count {
        case 0: return "\(name) is not involved in the project"
        case 1..<100: return "\(name) is not very active on the project"
        default: return "\(name) is active on the project"
        }
    }
}

let commitStats = [
    (name: "Miranda", count: 30),
    (name: "Elly", count: 650),
    (name: "John", count: 0)
]

let readableStats = resolveCounts(statistics: commitStats)
print(readableStats) // ["Miranda is not very active on the project", "Elly is quite active", "John is not involved in the project"]


//: ## Pipeline vs for loop

func counts(statistics: [(String, Int)]) -> [Int] {
    return statistics
        .map { $0.1 }
        .filter { $0 > 0 }
        .sorted(by: >)
}

//func counts(statistics: [(String, Int)]) -> [Int] {
//    var counts = [Int]()
//    for (name, count) in statistics where count > 0 {
//        counts.append(count)
//    }
//
//    return counts.sorted(by: >)
//}

let collectedCounts = counts(statistics: commitStats)
print(collectedCounts) // [650, 30]



//let commitsDict = [
//    "Miranda": 30,
//    "Elly": 650,
//    "John": 0
//]

print(commitStats) // [(name: "Miranda", count: 30), (name: "Elly", count: 650), (name: "John", count: 0)]
let commitsDict = Dictionary(uniqueKeysWithValues: commitStats)
print(commitsDict) // ["Miranda": 30, "Elly": 650, "John": 0]

let mappedKeysAndValues = commitsDict.map { (name: String, count: Int) -> String in
    switch count {
    case 0: return "\(name) is not involved in the project"
    case 1..<100: return "\(name) is not very active on the project"
    default: return "\(name) is active on the project"
    }
}

print(mappedKeysAndValues) // ["Miranda is not very active on the project", "Elly is active on the project", "John is not involved in the project"]

let mappedValues = commitsDict.mapValues { (count: Int) -> String in
    switch count {
    case 0: return "Not involved in the project"
    case 1..<100: return "Not very active on the project"
    default: return "Is active on the project"
    }
}

//: ## Mapping over dictionaries
print(mappedValues) // ["Miranda": "Very active on the project", "Elly": "Is active on the project", "John": "Not involved in the project"]

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
