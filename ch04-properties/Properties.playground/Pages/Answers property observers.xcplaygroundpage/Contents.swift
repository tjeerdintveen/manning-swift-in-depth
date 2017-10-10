//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
/*:
 # Answers property observers
 
 1. If you need a propery with both behavior and storage, what kind of property would you use?
 A stored property with a property observer.
 2. If you need a property with only behavior and no storage, what kind of property would you use?
 A computed property, if it's not too expensive
 
 3. Can you spot the bug in the code below?
 The message isn't trimmed from whitespace in the initializer.
 
 4. How can you fix the bug?
 By adding an initializer to the struct with a defer clause.
 */
import Foundation

struct Tweet {
    let date: Date
    let author: String
    var message: String {
        didSet {
            message = message.trimmingCharacters(in: .whitespaces)
        }
    }
    
    init(date: Date, author: String, message: String) {
        defer { self.message = message }
        self.date = date
        self.author = author
        self.message = message
    }
}

let tweet = Tweet(date: Date(),
                  author: "@tjeerdintveen",
                  message: "This has a lot of unnecessary whitespace   ")

tweet.message.count

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

