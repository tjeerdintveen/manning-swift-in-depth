//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Optional boolean nil coalescing

let preferences = ["autoLogin": true, "faceIdEnabled": true]
let isFaceIdEnabled = preferences["faceIdEnabled"] ?? false


//: ## Falling back on true

func loadContents(url: URL) -> Data? {
    var data = try? Data(contentsOf: url)
    
    if data?.isEmpty ?? true {
        let fileURL = Bundle.main.url(forResource: "default", withExtension: "txt")
        // Normally force unwrapping is ill advised, more on that later.
        data = try? Data(contentsOf: fileURL!)
    }
    
    return data
}

let url = Bundle.main.url(forResource: "hello", withExtension: "txt")
let result = loadContents(url: url!)



//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)



