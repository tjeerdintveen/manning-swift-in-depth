//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation

//: # A memberwise initializer

enum Pawn {
    case dog, car, ketchupBottle, iron, shoe, hat
}

struct Player {
    let name: String
    let pawn: Pawn
}

let player = Player(name: "SuperJeff", pawn: .shoe)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
