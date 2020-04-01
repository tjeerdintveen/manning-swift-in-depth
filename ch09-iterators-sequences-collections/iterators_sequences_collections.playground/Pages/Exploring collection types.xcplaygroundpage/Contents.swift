//: [Previous](@previous)

//: # Useful methods for collections

import Foundation

//: # Collection

let strayanAnimals = "Kangaroo Koala"
if let middleIndex = strayanAnimals.firstIndex(of: " ") {
    strayanAnimals.prefix(upTo: middleIndex) // Kangaroo
    strayanAnimals.suffix(from: strayanAnimals.index(after: middleIndex)) // Koala
}

//: # MutableCollection

var mutableArray = [4,3,1,2]
mutableArray.sort() // [1, 2, 3, 4]

var arr = [1,2,3,4,5]
let partitioned = arr.partition { (int) -> Bool in
    return int % 2 == 0
}

print(partitioned) // 3
print(arr) // [1, 5, 3, 4, 2]

arr[..<partitioned] // [1, 5, 3]
arr[partitioned...] // [4, 2]

// With MutableCollection we can sort in place
var evens: ArraySlice<Int> = arr[partitioned...] // [4, 2]
evens.sort() // [2, 4]

//: ## RangeReplaceableCollection

var muppets = ["Kermit", "Miss Piggy", "Fozzie bear"]

muppets += ["Statler", "Waldorf"]
print(muppets) // ["Kermit", "Miss Piggy", "Fozzie bear", "Statler", "Waldorf"]

muppets.removeFirst() // "Kermit"
print(muppets) // ["Miss Piggy", "Fozzie bear", "Statler", "Waldorf"]

muppets.removeSubrange(0..<2)
print(muppets) // ["Statler", "Waldorf"]

var matrix = "The Matrix"
matrix += " Reloaded"
print(matrix) // The Matrix Reloaded

//: RangeReplaceableCollection also offers mutating func removeAll(where shouldBeRemoved: (Element) throws -> Bool) rethrows

var healthyFood = ["Donut", "Lettuce", "Kiwi", "Grapes"]
healthyFood.removeAll(where:{ $0 == "Donut" })
print(healthyFood) // ["Lettuce", "Kiwi", "Grapes"]

//: ## BidirectionalCollection

var letters = "abcd"
var lastIndex = letters.endIndex

while lastIndex > letters.startIndex {
    lastIndex = letters.index(before: lastIndex)
    print(letters[lastIndex])
}

// Output:
// d
// c
// b
// a

//: Alternatively, we can use reversed.

for value in letters.reversed() {
    print(value)
}


//: ## RandomAccessCollection

//: Distance lookups are in constant-time.

["a", "b", "c", "d"].distance(from: 1, to: 4) // 3
["a", "b", "c", "d"].index(1, offsetBy: 2, limitedBy: 0) // 3

//: A Repeated type is a RandomAccessCollection
for element in repeatElement("Broken record", count: 3) {
    print(element)
}

// Output:
// Broken record
// Broken record
// Broken record

zip(repeatElement("Mr. Sniffles", count: 3), repeatElement(100, count: 3)).forEach { name, index in
    print("Generated \(name) \(index)")
}

//: [Next](@next)
