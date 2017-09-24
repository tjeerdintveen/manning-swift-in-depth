//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
/*: # Exercises

1. If you need a propery with both behavior and storage, what kind of property would you use?
2. If you need a property with only behavior and no storage, what kind of property would you use?
3. Can you spot the bug in the code below?
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
}

let tweet = Tweet(date: Date(),
                  author: "@tjeerdintveen",
                  message: "This has a lot of unnecessary whitespace   ")
    
//: 4. How can you fix the bug?

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
