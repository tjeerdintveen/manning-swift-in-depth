//: [Previous](@previous)

import Foundation

enum ReadError: Error {
    case fileNotFound(path: String)
    case wrongAuthorizationLevel(path: String, userId: String, minimumRole: String)
}

extension ReadError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .fileNotFound(path: path, userId: userId):
            return "File not found at \(path)"
        case let .wrongAuthorizationLevel(path: path, userId: userId, minimumRole: minimumRole):
            return "Can't access file for user \(userId), requires role \(minimumRole)"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case let .fileNotFound(path: path, userId: userId):
            return "Try a different file"
        case let .wrongAuthorizationLevel(path: path, userId: userId, minimumRole: minimumRole):
            return "Try to bribe someone for admin rights"
        }
    }
    
}

func loadResource(_ path: String) throws -> Data {
    //..
    throw ReadError.fileNotFound(path: path)
}

do {
    try loadResource("./pancakes.txt")
} catch let (readError: ReadError.fileNotFound(path)) {
    print("Could not load resource at \(path) with userId \(userId))")
} catch let ReadError.wrongAuthorizationLevel(path, userId, minimumRole) {
    print("Could not load resource at \(path), userId \(userId) does not have authorization level for role: \(minimumRole)")
}

//: [Next](@next)

