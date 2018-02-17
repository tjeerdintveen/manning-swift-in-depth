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


/*
 This source file is part of the Swift.org open source project
 
 Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception
 
 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
 */

/// An simple enum which is either a value or an error.
/// It can be used for error handling in situations where try catch is
/// problematic to use, for eg: asynchronous APIs.
public enum Result<Value, ErrorType: Swift.Error> {
    /// Indicates success with value in the associated object.
    case success(Value)
    
    /// Indicates failure with error inside the associated object.
    case failure(ErrorType)
    
    /// Initialiser for value.
    public init(_ value: Value) {
        self = .success(value)
    }
    
    /// Initialiser for error.
    public init(_ error: ErrorType) {
        self = .failure(error)
    }
    
    /// Initialise with something that can throw ErrorType.
    public init(_ body: () throws -> Value) throws {
        do {
            self = .success(try body())
        } catch let error as ErrorType {
            self = .failure(error)
        }
    }
    
    /// Evaluates the given closure when this Result instance has a value.
    public func map<U>(_ transform: (Value) throws -> U) rethrows -> Result<U, ErrorType> {
        switch self {
        case .success(let value):
            return Result<U, ErrorType>(try transform(value))
        case .failure(let error):
            return Result<U, ErrorType>(error)
        }
    }
    
}

//: 6. Create the dematerialize method on Result.

/// Get the value if success else throw the saved error.
extension Result {
    public func dematerialize() throws -> Value {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}

//: 7. By looking at the map function on Result, see if you can create mapError.

extension Result {
    
    /// Evaluates the given closure when this Result instance has a value.
    public func mapError<E: Error>(_ transform: (ErrorType) throws -> E) rethrows -> Result<Value, E> {
        switch self {
        case .success(let value):
            return Result<Value, E>(value)
        case .failure(let error):
            return Result<Value, E>(try transform(error))
        }
    }
    
}

//: 8. Connect to an API of your choice and implement the Result type on it.

//No answer, you can look at the last section in the chapter for an example.


//: [Next](@next)
