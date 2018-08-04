//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Poker with type erasure

//: We can apply type erasure to get runtime benefits when using a protocol with associated types or Self requirements.

import Foundation

protocol PokerGame: Hashable {
    func start()
}

struct StudPoker: PokerGame {
    func start() { print("Starting a Stud poker game") }
}
struct TexasHoldem: PokerGame {
    func start() { print("Starting a Texas Holdem game") }
}

struct AnyPokerGame: PokerGame {
    
    private let _start: () -> Void
    private let _hashable: AnyHashable
    
    init<Game: PokerGame>(_ pokerGame: Game)  {
        _start = pokerGame.start
        _hashable = AnyHashable(pokerGame)
    }
    
    func start() {
        _start()
    }
}

extension AnyPokerGame: Hashable {
        
    func hash(into hasher: inout Hasher) {
        _hashable.hash(into: &hasher)
    }
    
    static func ==(lhs: AnyPokerGame, rhs: AnyPokerGame) -> Bool {
        return lhs._hashable == rhs._hashable
    }
}

let studPoker = StudPoker()
let holdEm = TexasHoldem()

//: Now we can mix multiple poker games inside an array.

let games: [AnyPokerGame] = [
    AnyPokerGame(studPoker),
    AnyPokerGame(holdEm)
]

games.forEach { (pokerGame: AnyPokerGame) in
    pokerGame.start()
}

//: We can even use poker games as keys!

var numberOfPlayers = [
    AnyPokerGame(studPoker): 300,
    AnyPokerGame(holdEm): 400
]

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
