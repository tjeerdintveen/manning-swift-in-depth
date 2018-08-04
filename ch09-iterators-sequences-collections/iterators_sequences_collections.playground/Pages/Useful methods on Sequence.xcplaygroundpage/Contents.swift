//: [Previous](@previous)

import Foundation

//: # Useful methods on Sequence

//: ## forEach

["file_one.txt", "file_two.txt"].forEach { path in
    deleteFile(path: path)
}

["file_one.txt", "file_two.txt"].forEach(deleteFile)

func deleteFile(path: String) {
    // deleting file ....
}

//: ## enumerated

["First line", "Second line", "Third line"]
    .enumerated()
    .forEach { (index: Int, element: String) in
        print("\(index+1): \(element)")
}

//: ## Lazy

let bigRange = 0..<Int.max

let filtered = bigRange.lazy.filter { (int) -> Bool in
    return int % 2 == 0
}

// We want the last three elements. But still, nothing happens yet
let lastThree = filtered.suffix(3)

// Now the lazy code is evaluated
for value in lastThree {
    print(value) // values are consumed
}

//: ## Reduce

let text = "It's hard to come up with fresh exercises.\nOver and over again.'\nAnd again."
let startValue = 0
let numberOfLineBreaks = text.reduce(startValue) { (accumulation: Int, char: Character) in
    if char == "\n" {
        return accumulation + 1
    } else {
        return accumulation
    }
}

print(numberOfLineBreaks) // 2

//: ## Reduce into

let grades = [3.2, 4.2, 2.6, 4.1]
let slowResults = grades.reduce([:]) { (results: [Character: Int], grade: Double) in
    var copy = results
    switch grade {
    case 1..<2: copy["D", default: 0] += 1
    case 2..<3: copy["C", default: 0] += 1
    case 3..<4: copy["B", default: 0] += 1
    case 4...: copy["A", default: 0] += 1
    default: break
    }
    
    return copy
}

print(slowResults) // ["C": 1, "B": 1, "A": 2]

let results = grades.reduce(into: [:]) { (results: inout [Character: Int], grade: Double) in
    switch grade {
    case 1..<2: results["D", default: 0] += 1
    case 2..<3: results["C", default: 0] += 1
    case 3..<4: results["B", default: 0] += 1
    case 4...: results["A", default: 0] += 1
    default: break
    }
}

print(results) // ["C": 1, "B": 1, "A": 2]

//: ## zip
for (integer, string) in zip(0..<10, ["a", "b", "c"]) {
    print("\(integer): \(string)")
}
// Output:
// 0: a
// 1: b
// 2: c


//: [Next](@next)
