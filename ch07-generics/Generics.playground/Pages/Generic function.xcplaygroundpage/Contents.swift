//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

func firstLast(array: [Int]) -> (Int, Int) {
    return (array[0], array[array.count-1])
}

let (first, last) = firstLast(array: [1,2,3,4,5])
print(first) // 1
print(last) // 5

func firstLast(array: [String]) -> (String, String) {
    return (array[0], array[array.count-1])
}


//: ## Generic function

func firstLast<T>(array: [T]) -> (T, T) {
    return (array[0], array[array.count-1])
}

let (firstString, lastString) = firstLast(array: ["pineapple", "cherry", "steam locomotive"])
print(firstString) // "pineapple"
print(lastString) // "steam locomotive"

struct Waffle {
    let size: String
}

let (firstWaffle, lastWaffle) = firstLast(array: [
    Waffle(size: "large"),
    Waffle(size: "extra-large"),
    Waffle(size: "snack-size")
    ])

print(firstWaffle) // Waffle(size: "large")
print(lastWaffle) // Waffle(size: "snack-size")

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
