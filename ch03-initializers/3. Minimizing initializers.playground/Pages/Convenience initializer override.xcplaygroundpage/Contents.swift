//: [Previous](@previous)

import UIKit

func random(max: UInt32) -> UInt32 {
    return arc4random_uniform(max)
}

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

class MutabilityLand: BoardGame {
    var scoreBoard = [String: Int]()
    var winner: Player?
    
    let instructions: String
    
    init(players: [Player], instructions: String, numberOfTiles: Int) {
        self.instructions = instructions
        super.init(players: players, numberOfTiles: numberOfTiles)
    }
    
    convenience override init(players: [Player], numberOfTiles: Int) {
        self.init(players: players, instructions: "Read the manual", numberOfTiles: numberOfTiles)
    }
}

let players = [
    Player(name: "Melissa"),
    Player(name: "SuperJeff"),
    Player(name: "Dave")
]

// Designated initializer
let mutabilityLand = MutabilityLand(players: players, instructions: "Just read the manual", numberOfTiles: 40)

// BoardGame initializers all work again
//let mutabilityLand = MutabilityLand(names: ["Melissa", "SuperJeff", "Dave"])

// Convenience initializer
//let mutabilityLand = MutabilityLand(players: players)

// Designated initializer
//let mutabilityLand = MutabilityLand(players: players, numberOfTiles: 32)



//: [Next](@next)
