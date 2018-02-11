//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
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

let player = Player(name: "SuperJeff")
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
