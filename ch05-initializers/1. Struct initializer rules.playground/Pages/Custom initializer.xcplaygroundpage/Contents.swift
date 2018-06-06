//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import UIKit

//: # A custom initializer

enum Pawn: CaseIterable {
    case dog, car, ketchupBottle, iron, shoe, hat
}

struct Player {
    let name: String
    let pawn: Pawn
    
    init(name: String) {
        self.name = name
        self.pawn = Pawn.allCases.randomElement()!
    }
}

let player = Player(name: "SuperJeff")
print(player.pawn) // shoe

//: error: extra argument 'pawn' in call
//let secondPlayer = Player(name: "Carl", pawn: .dog)


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
