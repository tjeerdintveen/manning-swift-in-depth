//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Property observer initializer

import Foundation

class Player {
    
    let id: String
    
    var name: String {
        didSet {
            print("My previous name was \(oldValue)")
            name = name.trimmingCharacters(in: .whitespaces)
        }
    }
    
    init(id: String, name: String) {
        defer { self.name = name }
        self.id = id
        self.name = name
    }
}

//: Now the initializer also cleans up the whitespace.
let jeff = Player(id: "1", name: "SuperJeff    ")
print(jeff.name)
print(jeff.name.count) // 9

//: Changing the name cleans up the whitespace of the property.

jeff.name = "SuperJeff    "
print(jeff.name)
print(jeff.name.count) // 9

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)




