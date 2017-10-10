//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
//: # Answers
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
enum FileSystem {
    case file(File)
    case directory(Directory)
}

let filesystem: [FileSystem] = [
    FileSystem.file(file),
    FileSystem.directory(directory)
]

//: 2. What are the benefits of using an enum over a struct to combine these types?

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

