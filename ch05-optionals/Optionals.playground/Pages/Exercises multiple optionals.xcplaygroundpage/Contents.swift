//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Exercises: multiple optionals

//: 1. If no optionals in a function are allowed to have a value, what would be a good tactic to make all optionals are filled?
//: 2. If the functions takes different paths depending on the optionals inside it, what would be a good approach to take to handle all these paths?

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

//: 3. Can you fill the body of describeAction so that it returns a string, based on the optional values it receives?
func describeAction(event: PasteBoardEvent?, contents: PasteBoardContents?) -> String {
    // What goes here?
    return ""
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
