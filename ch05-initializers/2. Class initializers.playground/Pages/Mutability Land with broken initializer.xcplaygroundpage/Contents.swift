//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation
//: ## Mutability Land with broken initializer

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
    
    init(players: [Player], numberOfTiles: Int = 32) {
        self.players = players
        self.numberOfTiles = numberOfTiles
    }
    
//    convenience init(players: [Player]) {
//        self.init(players: players, numberOfTiles: 32)
//    }
    
    convenience init(names: [String]) {
        var players = [Player]()
        for name in names {
            players.append(Player(name: name))
        }
        self.init(players: players, numberOfTiles: 32)
    }
}

class MutabilityLand: BoardGame {
    var scoreBoard = [String: Int]()
    var winner: Player?
    
    let instructions: String
    
    init(players: [Player], instructions: String, numberOfTiles: Int) {
        self.instructions = instructions
        super.init(players: players, numberOfTiles: numberOfTiles)
    }
    
}

/*:
 ## Initializer problem
 
We can't initialize MutabilityLand here with the initializer from Boardgame.
 
This is because BoardGame can't populate the 'instructions' property on MutabilityLand.
 */

// Doesn't work
let mutabilityLand = MutabilityLand(names: ["Melissa", "SuperJeff", "Dave"])

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
