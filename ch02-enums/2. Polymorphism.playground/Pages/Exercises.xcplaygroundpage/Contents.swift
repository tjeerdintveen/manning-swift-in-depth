//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
//: # Exercises
import Foundation

//: Given these data types:

enum Permissions {
    case read
    case write
    case readWrite
}

struct File {
    let path: String
    let permissions: Permissions
}
struct Directory {
    let path: String
    let permissions: Permissions
}

let file = File(path: "/usr/swiftindepth/swift.txt", permissions: .read)
let directory = Directory(path: "/usr/swiftindepth", permissions: .readWrite)

//: 1. How can we fill one array with both types?

//let filesystem = [?]

//: 2. What are the benefits of using an enum over a struct to combine these types?

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
