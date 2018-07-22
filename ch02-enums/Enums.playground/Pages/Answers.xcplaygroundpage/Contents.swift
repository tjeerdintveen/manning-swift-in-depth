//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Answers

//: 1. A superclass prevents duplication, no need to declare the same property twice. With subclassing you can also override existing functionality.
//: 2. No need to refactor anything if you add another type. Whereas with subclassing you risk refactoring a superclass and its existing subclasses. Second, you are not forced to use classes.
//: 3. What are the number possible variations of Bagel?
// Twelve. There are 3 for Topping times 4 for BagelType.

// 4. Turn Bagel into a struct

// There are two ways since Bagel contains two enums. So you can pick which enum to store the data in.

enum Topping {
    case creamCheese
    case peanutButter
    case jam
}



enum Bagel {
    case cinnamonRaisin(Topping)
    case glutenFree(Topping)
    case oatMeal(Topping)
    case blueberry(Topping)
}

//: Alternatively

//enum Bagel {
//    case creamCheese(BagelType)
//    case peanutButter(BagelType)
//    case jam(BagelType)
//}


//: 5.
enum AgeRange {
    case baby
    case toddler
    case preschooler
    case gradeschooler
    case teenager
}

struct Puzzle {
    let ageRange: AgeRange
    let numberOfPieces: Int
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
