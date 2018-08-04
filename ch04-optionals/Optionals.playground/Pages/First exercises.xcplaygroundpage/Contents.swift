//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Exercises: multiple optionals

//: 1. If no optionals in a function are allowed to have a value, what would be a good tactic to make all optionals are filled?
//: 2. If the functions takes different paths depending on the optionals inside it, what would be a good approach to take to handle all these paths?

//: 3. Given these two enums which represent the data being copied, erased and pasted from the pasteboard (aka clipboard).

enum PasteBoardContents {
    case url(url: String)
    case emailAddress(emailAddress: String)
    case other(contents: String)
}

//: The PasteBoardEvent represents the event related to PasteBoardContents. Perhaps the contents were added to the pasteboard, erased from the pasteboard, or pasted from the pasteboard.

enum PasteBoardEvent {
    case added
    case erased
    case pasted
}

//: The describeAction function takes on the two enums, and return a String describing the event. Such as "The user added an email address to pasteboard". The goal of this exercise is to fill the body of a function.

func describeAction(event: PasteBoardEvent?, contents: PasteBoardContents?) -> String {
    // What goes here?
    return ""
}

//: Given this input:

describeAction(event: .added, contents: .url(url: "www.manning.com"))
describeAction(event: .added, contents: .emailAddress(emailAddress: "info@manning.com"))
describeAction(event: .erased, contents: .emailAddress(emailAddress: "info@manning.com"))
describeAction(event: .erased, contents: nil)
describeAction(event: nil, contents: .other(contents: "Swift in Depth"))

//: Make sure that the output is as follows:

"User added an url to pasteboard: www.manning.com."
"User added something to pasteboard."
"User erased an email address from the pasteboard."
"The pasteboard is updated."
"The pasteboard is updated."

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
