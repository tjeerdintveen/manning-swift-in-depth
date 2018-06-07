//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Protocol overrides

import Foundation

protocol Plant {
    func grow()
}

extension Plant {
    func grow() {
        print("Growing a plant")
    }
}

protocol Tree: Plant {}

extension Tree {
    func grow() {
        print("Growing a tree")
    }
}

struct Oak: Tree {
    func grow() {
        print("The mighty oak is growing")
    }
}

struct CherryTree: Tree {}

struct KiwiPlant: Plant {}

func growPlant<P: Plant>(_ plant: P) {
    plant.grow()
}

growPlant(Oak()) // The mighty oak is growing
growPlant(CherryTree()) // Growing a tree
growPlant(KiwiPlant()) // Growing a plant

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
