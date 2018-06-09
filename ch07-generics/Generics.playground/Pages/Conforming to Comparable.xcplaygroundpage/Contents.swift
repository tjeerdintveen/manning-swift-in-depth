//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Conforming to Comparable

enum RoyalRank: Comparable {
    case emperor
    case king
    case duke
    
    static func <(lhs: RoyalRank, rhs: RoyalRank) -> Bool {
        switch (lhs, rhs) {
        case (king, emperor): return true
        case (duke, emperor): return true
        case (duke, king): return true
        default: return false
        }
    }
    
    //: Not needed, but we can manually implement the == method.
//    static func ==(lhs: RoyalRank, rhs: RoyalRank) -> Bool {
//        switch (lhs, rhs) {
//        case (emperor, emperor): return true
//        case (king, king): return true
//        case (duke, duke): return true
//        default: return false
//        }
//    }
}

func lowest<T: Comparable>(_ array: [T]) -> T? {
    return array.sorted().first
}

let king = RoyalRank.king
let duke = RoyalRank.duke

duke < king // true
duke > king // false
duke == king // false

let ranks: [RoyalRank] = [.emperor, .king, .duke]
lowest(ranks) // .duke


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
