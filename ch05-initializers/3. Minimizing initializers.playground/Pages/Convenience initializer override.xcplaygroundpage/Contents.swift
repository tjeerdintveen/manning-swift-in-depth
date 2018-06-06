//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Convenience initializer override

//: First we prepare the data types.

import Foundation

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
 ## MutabilityLand changes
 
 Notice how MutabilityLand contains a convenience override, which points to "self.init" instead of "super.init"
*/

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

/*:
 ## Choose an initializer
 You can uncomment to see the initializers in action.
 */


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

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
