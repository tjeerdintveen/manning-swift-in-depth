//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
//: # Exercise
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

//: How can we fill one array with both types?

//let filesystem = [?]

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
