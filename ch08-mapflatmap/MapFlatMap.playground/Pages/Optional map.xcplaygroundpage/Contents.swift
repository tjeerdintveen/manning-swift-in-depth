//: [Previous](@previous)

import Foundation

//: ## Double-nested optional
//
//let receivedData = ["url" : "https://www.clubpenguinisland.com"]
//
//let path: String? = receivedData["url"]
//
//let url = path.map { (string: String) -> URL? in
//    let url = URL(string: string) // Optional(https://www.clubpenguinisland.com)
//    return url // We return an optional string
//}
//
//print(url) // Optional(Optional(http://www.clubpenguinisland.com))

//: ## Removing double-nesting with a force unwrap
//: Doing this is crash-sensitive!
//
//let receivedData = ["url" : "https://www.clubpenguinisland.com"]
//
//let path: String? = receivedData["url"]
//
//let url = path.map { (string: String) -> URL in
//    return URL(string: string)! // We force unwrap, dangerous!
//}
//
//print(url) // Optional(http://www.clubpenguinisland.com)

//: ## Removing double-nesting with flatMap

let receivedData = ["url" : "https://www.clubpenguinisland.com"]

let path: String? = receivedData["url"]

let url = path.flatMap { (string: String) -> URL? in // We return URL? again
    return URL(string: string) // We return an optional URL
}

print(url) // Optional(http://www.clubpenguinisland.com) // The optional is not double-nested


//: [Next](@next)

