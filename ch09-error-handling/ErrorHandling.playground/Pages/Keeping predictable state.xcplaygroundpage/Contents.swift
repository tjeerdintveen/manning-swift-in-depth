//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Keeping predictable state

import Foundation
import PlaygroundSupport

enum ListError: Error {
    case invalidValue
}

struct TodoList {
    
    private var values = [String]()
    
    //: This method does maintain a predictable state by working on a temporary value
    
    mutating func append(strings: [String]) throws {
        var trimmedStrings = [String]()
        for string in strings {
            let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if trimmedString.isEmpty {
                throw ListError.invalidValue
            } else {
                trimmedStrings.append(trimmedString)
            }
        }
        
        // Only when everything succeeds, do we start mutating the struct.
        values.append(contentsOf: trimmedStrings)
    }

    //: This method doesn't maintain a predictable state.
    
//    mutating func append(strings: [String]) throws {
//        for string in strings {
//            let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
//
//            if trimmedString.isEmpty {
//                throw ListError.invalidValue
//            } else {
//                values.append(trimmedString)
//            }
//        }
//    }
    
}

//: We can use defer to revert mutation that occured halfway a process.
func writeToFiles(data: [URL: String]) throws {
    var storedUrls = [URL]()
    defer {
        if storedUrls.count != data.count {
            for url in storedUrls {
                try! FileManager.default.removeItem(at: url)
            }
        }
    }
    
    for (url, contents) in data {
        try contents.write(to: url, atomically: true, encoding: String.Encoding.utf8)
        storedUrls.append(url)
    }
}

let url = playgroundSharedDataDirectory.appendingPathComponent("somefile.txt")

//: Before running this, you need a to create a "Shared Playground Data" folder to your ~/Documents directory
do {
    try writeToFiles(data: [url: "Hello there"])
} catch {
    print(error)
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
