//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Optional boolean nil coalescing

//: ## Falling back to false

let preferences = ["autoLogin": true, "faceIdEnabled": true]
print(preferences["faceIdEnabled"]) // Optional(true)
let isFaceIdEnabled = preferences["faceIdEnabled"] ?? false
print(isFaceIdEnabled) // Now a Bool instead of Optional(Bool)
//: ## Falling back on true

if preferences["faceIdEnabled"] ?? true {
    // go to Face ID settings screen.
} else {
    // customer has disabled Face ID
}


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)



