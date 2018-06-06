//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Creating a BoardGame

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

//: ## The Boardgame class
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

//: ## Initializing BoardGame.
//: Uncomment the initializer you want to use.

// Convenience initializer
//let boardGame = BoardGame(names: ["Melissa", "SuperJeff", "Dave"])


let players = [
    Player(name: "Melissa"),
    Player(name: "SuperJeff"),
    Player(name: "Dave")
]
// Convenience initializer
//let boardGame = BoardGame(players: players)

// Designated initializer
let boardGame = BoardGame(players: players, numberOfTiles: 32)
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
