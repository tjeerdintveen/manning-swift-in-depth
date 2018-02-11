//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Answers: multiple optionals

//: 1. If no optionals in a function are allowed to have a value, what would be a good tactic to make all optionals are filled?
//: Use a guard, this can block optionals at the top of a function.

//: 2. If the functions takes different paths depending on the optionals inside it, what would be a good approach to take to handle all these paths?
//: Putting multiple optionals inside a tuple allows you to pattern match on them.

//: Given these two enums which represent the data being copied, erased and pasted from the pasteboard (aka clipboard).

enum PasteBoardEvent {
    case added
    case erased
    case pasted
}

enum PasteBoardContents {
    case url(url: String)
    case emailAddress(emailAddress: String)
    case other(contents: String)
}

// We can use a single switch statement inside describeAction.
func describeAction(event: PasteBoardEvent?, contents: PasteBoardContents?) -> String {
    switch (event, contents) {
    case let (.added?, .url(url)?): return "User added a url to pasteboard: \(url)"
    case (.added?, _): return "User added something to pasteboard"
    case (.erased?, .emailAddress?): return "User erased an email address from the pasteboard"
    default: return "The pasteboard is updated"
    }
}

//: Given this input
describeAction(event: .added, contents: .url(url: "www.manning.com"))
describeAction(event: .added, contents: .emailAddress(emailAddress: "info@manning.com"))
describeAction(event: .erased, contents: .emailAddress(emailAddress: "info@manning.com"))
describeAction(event: .erased, contents: nil)
describeAction(event: nil, contents: .other(contents: "Swift in Depth"))

//: Make sure the output is as follows

"User added a url to pasteboard: www.manning.com"
"User added something to pasteboard"
"User erased an email address from the pasteboard"
"The pasteboard is updated"
"The pasteboard is updated"

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
