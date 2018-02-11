//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
//: # Answers

//: 1. No
//: 2.

struct Pancakes {
    
    enum SyrupType {
        case corn
        case molasses
        case maple
    }
    
    let syrupType: SyrupType
    let stackSize: Int
    
}

//: By making the custom initializer an extension you get both initializers.
extension Pancakes {

    init(syrupType: SyrupType) {
        self.stackSize = 10
        self.syrupType = syrupType
    }
    
}

let pancakes = Pancakes(syrupType: .corn, stackSize: 8)
let morePancakes = Pancakes(syrupType: .maple)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
