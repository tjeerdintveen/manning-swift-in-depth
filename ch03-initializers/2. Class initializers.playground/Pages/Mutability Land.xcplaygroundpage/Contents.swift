//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import UIKit
/*:
 ## Creating Mutability Land
 
 Our randomizer function.
 */
func random(max: UInt32) -> UInt32 {
    return arc4random_uniform(max)
}

//: The player type.
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

 //: We subclass BoardGame with the new MutabilityLand class

class MutabilityLand: BoardGame {
    var scoreBoard = [String: Int]()
    var winner: Player?
}

//: ## Initializing MutabilityLand.
//: Uncomment the initializer you want to use.

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
