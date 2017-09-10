struct Pancakes {
    
    enum SyrupType {
        case corn
        case molasses
        case maple
    }
    
    let syrupType: SyrupType
    let stackSize: Int
    
    init(syrupType: SyrupType) {
        self.syrupType
    }
}

// Will this compile? If not, can you make this work?
//let pancakes = Pancakes(syrupType: .corn, stackSize: 8)
//let pancakes = Pancakes(syrupType: .maple)

