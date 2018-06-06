//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation

/*:
 ## Initializers required by a protocol
 This playground page demonstrates how initializers are required because of protocols.
 
 First we prepare our data types.
 */

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

/*:
 ## Introducing a protocol
 
 The BoardGameType protocol has an initializer.
 
 Notice how the designated initializer in BoardGame is now made required.
 
 This is needed to satisfy the BoardGameType protocol (otherwise subclasses wouldn't adhere to the protocol)
 */

protocol BoardGameType {
    init(players: [Player], numberOfTiles: Int)
}

class BoardGame: BoardGameType {
    let players: [Player]
    let numberOfTiles: Int
    
    required init(players: [Player], numberOfTiles: Int) {
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
    
    convenience required init(players: [Player], numberOfTiles: Int) {
        self.init(players: players, instructions: "Read the manual", numberOfTiles: numberOfTiles)
    }
}

/*:
 ## Initializing
 Now we can initialize MutabilityLand and BoardGame as usual.
 */

let players = [
    Player(name: "Melissa"),
    Player(name: "SuperJeff"),
    Player(name: "Dave")
]

let boardGame = BoardGame(players: players, numberOfTiles: 32)
let mutabilityLand = MutabilityLand(players: players)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
