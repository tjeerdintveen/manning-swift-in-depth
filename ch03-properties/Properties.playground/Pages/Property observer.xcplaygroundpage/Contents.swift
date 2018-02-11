//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Property observer

import Foundation

//: ## Introducing the Player struct

class Player {
    
    let id: String
    
    var name: String {
        didSet {
            name = name.trimmingCharacters(in: .whitespaces)
        }
    }
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

//: Initializing the struct doesn't clean up the whitespace of the property.

let jeff = Player(id: "1", name: "SuperJeff    ")
print(jeff.name)
print(jeff.name.count) // 13

//: Changing the name does clean up the whitespace of the property.

jeff.name = "SuperJeff    "
print(jeff.name)
print(jeff.name.count) // 9

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)




