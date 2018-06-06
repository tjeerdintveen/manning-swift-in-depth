//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation

//: # Creating Mutability land

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

//: BoardGame is a superclass now.

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

//: ## We subclass BoardGame with the new MutabilityLand class

class MutabilityLand: BoardGame {
    var scoreBoard = [String: Int]()
    var winner: Player?
}

//: ## Initializing MutabilityLand.
//: Uncomment the initializer that you want to use.

// Convenience initializer
let mutabilityLand = MutabilityLand(names: ["Melissa", "SuperJeff", "Dave"])


let players = [
    Player(name: "Melissa"),
    Player(name: "SuperJeff"),
    Player(name: "Dave")
]
// Convenience initializer
//let mutabilityLand = MutabilityLand(players: players)

// Designated initializer
//let mutabilityLand = MutabilityLand(players: players, numberOfTiles: 32)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
