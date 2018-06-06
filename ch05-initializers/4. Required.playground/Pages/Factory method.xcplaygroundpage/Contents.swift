//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation

/*:
 # Factory methods
This playground page demonstrates initializing via factory methods.

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
 ## Introducing a factory method
Notice how BoardGame gains the 'makeGame' factory method.
 
Also notice how the initializer 'makeGame' points to, is now a required initialzer because of this.
*/

class BoardGame {
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
    
    // This is a factory method.
    class func makeGame(players: [Player]) -> Self {
        return self.init(players: players, numberOfTiles: 32)
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
 ## Initializing with a factory method
Both superclasses and subclasses can now be initialized with a factory method
*/

let players = [
    Player(name: "Melissa"),
    Player(name: "SuperJeff"),
    Player(name: "Dave")
]

let boardGame = BoardGame.makeGame(players: players)
let mutabilityLand = MutabilityLand.makeGame(players: players)
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
