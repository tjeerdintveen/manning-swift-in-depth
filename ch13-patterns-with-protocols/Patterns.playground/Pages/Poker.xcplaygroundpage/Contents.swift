//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Poker

import Foundation

protocol PokerGame: Hashable {
    func start()
}

struct StudPoker: PokerGame {
    func start() {
        print("Starting StudPoker")
    }
}
struct TexasHoldem: PokerGame {
    func start() {
        print("Starting Texas Holdem")
    }
}

//: This line below will throw an error becuase we can't use a protocol with Self requirements as a concrete type.
//let numberOfPlayers = [PokerGame: Int]()

//error: Patterns.playground:10:23: error: using 'PokerGame' as a concrete type conforming to protocol 'Hashable' is not supported

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
