//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import UIKit
//: ## Overriding a deisgnated initializer

enum Pawn: CaseIterable {
    case dog, car, ketchupBottle, iron, shoe, hat
}

struct Player {
    let name: String
    let pawn: Pawn
}

extension Player {
    init(name: String) {
        self.name = name
        self.pawn = Pawn.allCases.randomElement()!
    }
}

class BoardGame {
    let players: [Player]
    let numberOfTiles: Int
    
    init(players: [Player], numberOfTiles: Int) {
        self.players = players
        self.numberOfTiles = numberOfTiles
    }
    
    convenience init(players: [Player]) {
        self.init(players: players, numberOfTiles: 32)
    }
    
    convenience init(names: [String]) {
        var players = [Player]()
        for name in names {
            players.append(Player(name: name))
        }
        self.init(players: players, numberOfTiles: 32)
    }
}
/*:
 ## MutabilityLand override
 
 MutabilityLand now overrides the designated initializer from BoardGame.
 */

class MutabilityLand: BoardGame {
    var scoreBoard = [String: Int]()
    var winner: Player?
    
    let instructions: String
    
    init(players: [Player], instructions: String, numberOfTiles: Int) {
        self.instructions = instructions
        super.init(players: players, numberOfTiles: numberOfTiles)
    }
    
    override init(players: [Player], numberOfTiles: Int) {
        self.instructions = "Read the manual"
        super.init(players: players, numberOfTiles: numberOfTiles)
    }
}

let players = [
    Player(name: "Melissa"),
    Player(name: "SuperJeff"),
    Player(name: "Dave")
]

/*:
## Initializing MutabilityLand.
 
MutabilityLand has access to many initializers now.
 
Uncomment the initializer you want to use.
 */


// Designated initializer
let mutabilityLand = MutabilityLand(players: players, instructions: "Just read the manual", numberOfTiles: 40)

// BoardGame initializers all work again
//let mutabilityLand = MutabilityLand(names: ["Melissa", "SuperJeff", "Dave"])

// Convenience initializer
//let mutabilityLand = MutabilityLand(players: players)

// Designated initializer
//let mutabilityLand = MutabilityLand(players: players, numberOfTiles: 32)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
