//: [Previous](@previous)

import Foundation
import PlaygroundSupport

enum ListError: Error {
    case invalidValue
}

struct TodoList {
    
    private var values = [String]()
    
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
        
        values.append(contentsOf: trimmedStrings)
    }
    
    mutating func sortedFirst() -> String? {
        values.sorted()
        return values.sorted().first
    }

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
//let url = playgroundSharedDataDirectory.appendingPathComponent("somefile.txt", isDirectory: false)
print("URL \(url)")
print("---")
print("---")
print("---")

//: Before running this, you need a to create a "Shared Playground Data" folder to your ~/Documents directory
do {
    try writeToFiles(data: [url: "Hello there"])
} catch {
    print(error)
}

enum UserError: Error {
    case invalidFirstName
    case invalidLastName
}

class User {
    
    private var firstName: String
    private var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func update(firstName: String, lastName: String) throws {
        guard firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw UserError.invalidFirstName
        }
        
        guard lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw UserError.invalidLastName
        }
        
        self.firstName = firstName
        self.lastName = lastName
    }
}

let user = User(firstName: "Mary", lastName: "Jane")
user.lastName = ""



class OnlinePayments {

    var token: String
    var path: String
    
    init(token: String, path: String) {
        self.token = token
        self.path = path
    }
    
    func update(token: String, path: String) {
        self.token = token
        self.path = path
    }
    
}

let payments = OnlinePayments(token: "sj3r90jsdnkjq3i", path: "www.myapp.com")
payments.update(token: "abcdef", path: "/zzz")

//: [Next](@next)
