//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation

/*:
 ## Omitting the required keyword
 This playground page demonstrates how we don't need the required keyword when we make a class final.
 
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
 ## BoardGame changes
 Notice how BoardGame adheres to the BoardGameType protocol, but also notice how Boardgame has a factory method called 'makeGame'.
 
 But BoardGame doesn't need required initializers anymore, because it can't be subclassed.
 
 The reason BoardGame can't be subclasses is because BoardGame is now a final class, indicated by the 'final' keyword.

 */

protocol BoardGameType {
    init(players: [Player], numberOfTiles: Int)
}

final class BoardGame: BoardGameType {
    let players: [Player]
    let numberOfTiles: Int
    
    class func makeGame(players: [Player]) -> Self {
        return self.init(players: players, numberOfTiles: 32)
    }
    
    // No need to make this required
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
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
