//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Exercises

//: 1. Can you name two benefits of using subclassing over enums with associated types?
//: 2. Can you name two benefits of using enums with associated types over subclassing?
//: 3. What is the number of possible variations of Bagel?

enum Topping {
    case creamCheese
    case peanutButter
    case jam
}

enum BagelType {
    case cinnamonRaisin
    case glutenFree
    case oatMeal
    case blueberry
}

struct Bagel {
    let topping: Topping
    let type: BagelType
}

//: 4. Turn Bagel into an enum while keeping the same amount of possible variations.

//: 5. Given this enum representing a Puzzle game for a certain age range (baby, toddler etc) and containing a number of puzzle pieces.
//: How would could this enum be represented as a struct instead?
enum Puzzle {
    case baby(numberOfPieces: Int)
    case toddler(numberOfPieces: Int)
    case preschooler(numberOfPieces: Int)
    case gradeschooler(numberOfPieces: Int)
    case teenager(numberOfPieces: Int)
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

