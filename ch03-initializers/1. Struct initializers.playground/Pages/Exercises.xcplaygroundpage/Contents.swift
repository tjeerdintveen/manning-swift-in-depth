//: [Previous](@previous)

struct Pancakes {
    
    enum SyrupType {
        case corn
        case molasses
        case maple
    }
    
    let syrupType: SyrupType
    let stackSize: Int
    
    init(syrupType: SyrupType) {
        self.stackSize = 10
        self.syrupType = syrupType
    }
    
}

//1. Will these work?
//let pancakes = Pancakes(syrupType: .corn, stackSize: 8)
//let pancakes = Pancakes(syrupType: .maple)

//2. If these initializers didn't work, can you make them work without adding another initializer?


//: [Next](@next)
