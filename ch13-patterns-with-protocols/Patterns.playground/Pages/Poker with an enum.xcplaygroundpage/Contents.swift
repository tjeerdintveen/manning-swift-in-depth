//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Poker with an enum

//: We can opt to make PokerGame an enum instead of a protocol. Then we're working with a concrete type again, and satisfy the compiler.

import Foundation

enum PokerGame: Hashable { 
    case studPoker(StudPoker)
    case texasHoldem(TexasHoldem)
}

struct StudPoker: Hashable {
    // ... Implementation omitted
}
struct TexasHoldem: Hashable {
    // ... Implementation omitted
}

var numberOfPlayers = [PokerGame: Int]()

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
