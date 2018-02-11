//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import UIKit
/*:
 ## Creating a Board Game.

Our randomizer function.
 */
func random(max: UInt32) -> UInt32 {
    return arc4random_uniform(max)
}

//: The player type
struct Player {
    let name: String
    let color: UIColor
}

extension Player {
    
    init(name: String) {
        self.name = name
        
        self.color = UIColor(red:  CGFloat(random(max: 100)) / 100,
                             green: CGFloat(random(max: 100)) / 100,
                             blue:  CGFloat(random(max: 100)) / 100,
                             alpha: 1.0)
    }
}

//: The Boardgame class
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
