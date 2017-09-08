
import Foundation

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

//let filesystem = [?] // What type goes here?

