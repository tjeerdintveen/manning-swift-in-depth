//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//: # Questions and answers

//: 1. Can you name one or more downsides of how Swift handles errors, and how to compensate for them?

// Functions are marked as throwing, so it places the burden on the developer to handle it. Yet, functions don't reveal which errors are thrown.

//: 2. Can you name three ways to make sure throwing functions return to their original state after throwing errors?

//Use immutable functions
//Work on copies or temporary values
//Use defer to reverse mutation

//: 3. What's the downside of passing messages for the user inside an error?
// Solution: Because then it's harder to differentiate between technical information and information to display to the user.

//: 4. The following code will not compile. What two changes to loadFile can you make to make the code compile? (without resorting to try! and try?)

//enum LoadError {
//    case couldntLoadFile
//}
//
//func loadFile(name: String) -> Data? {
//    let url = playgroundSharedDataDirectory.appendingPathComponent(name)
//    do {
//        return try Data(contentsOf: url)
//    } catch let error as LoadError {
//        print("Can't load file named \(name)")
//        return nil
//    }
//}

//: Answer: Make loadFile catch all errors and not just a specific one. Or make loadFile throwing.

//: 5. Can you name at least three ways to make throwing API's easier to use for developers?

//: Capture an error when creating a type, so an error is handled only on creation of a type and not passing of a value.

//: Return an optional instead of throwing an error when there is a single failing reason.

//: Prevent propagation with the `try?` keyword.

//: Prevent propagation with the `try!` keyword.

//: [Next](@next)
