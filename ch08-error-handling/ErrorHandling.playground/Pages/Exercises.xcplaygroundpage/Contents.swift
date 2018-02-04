//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//: ## First section

//: Can you name one or more downsides of how Swift handles errors, and how to compensate for them?

//Functions are marked as throwing, so it places the burden on the developer to handle it. Yet, functions don't reveal which errors are thrown.

//: Can you name three ways to make sure throwing functions return to their original state after throwing errors?

//Use immutable functions
//Work on copies or temporary values
//Use defer to reverse mutation

//: ## Second section

//: What's the downside of passing messages for the user inside an error?
// Solution: Because then it's harder to differentiate between technical information and information to display to the user.

//: The following code will not compile. What two changes to checkAllergy can you make to make the code compile? (without resorting to try! and try?)

//func checkAllergy(_ foodItem: String) {
//    do {
//        try isGlutenFree(foodItem)
//    } catch let error as GlutenError {
//        print("Can't eat \(foodItem). Reason: \(error)")
//    }
//}

enum GlutenError: Error {
    case containsWheat
    case containsBarley
    case containsRye
}

func isGlutenFree(_ foodItem: String) throws -> Bool {
    switch foodItem.lowercased() {
    case "bread": throw GlutenError.containsWheat
    case "flour", "whiskey", "vodka": throw GlutenError.containsRye
    case "beer": throw GlutenError.containsBarley
    default: return true
    }
}

//: Answer: Make checkAllergy catch all errors and not just a specific one. Or make checkAllergy throwing.

//: How can you minimize the number of errors that are thrown? Refactor into a solution

//func guess(_ number: Int) -> Bool {
////    https://doc.rust-lang.org/book/second-edition/ch09-03-to-panic-or-not-to-panic.html
//}


//TODO: keep validating something, solution: Turn into a type

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
    
    /// Get the value if success else throw the saved error.
    public func dematerialize() throws -> Value {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
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
    
    /// Evaluates the given closure when this Result instance has a value, passing the unwrapped value as a parameter.
    ///
    /// The closure returns a Result instance itself which can have value or not.
    public func flatMap<U>(_ transform: (Value) -> Result<U, ErrorType>) -> Result<U, ErrorType> {
        switch self {
        case .success(let value):
            return transform(value)
        case .failure(let error):
            return Result<U, ErrorType>(error)
        }
    }
    
}

extension Result: CustomStringConvertible {
    public var description: String {
        switch self {
        case .success(let value):
            return "Result(\(value))"
        case .failure(let error):
            return "Result(\(error))"
        }
    }
}

/// A type erased error enum.
public struct AnyError: Swift.Error, CustomStringConvertible {
    /// The underlying error.
    public let underlyingError: Swift.Error
    
    public init(_ error: Swift.Error) {
        // If we already have any error, don't nest it.
        if case let error as AnyError = error {
            self = error
        } else {
            self.underlyingError = error
        }
    }
    
    public var description: String {
        return String(describing: underlyingError)
    }
}

// AnyError specific helpers.
extension Result where ErrorType == AnyError {
    /// Initialise with something that throws AnyError.
    public init(anyError body: () throws -> Value) {
        do {
            self = .success(try body())
        } catch {
            self = .failure(AnyError(error))
        }
    }
    
    /// Initialise with an error, it will be automatically converted to AnyError.
    public init(_ error: Swift.Error) {
        self = .failure(AnyError(error))
    }
    
    /// Evaluates the given throwing closure when this Result instance has a value.
    ///
    /// The final result will either be the transformed value or any error thrown by the closure.
    public func mapAny<U>(_ transform: (Value) throws -> U) -> Result<U, AnyError> {
        switch self {
        case .success(let value):
            do {
                return Result<U, AnyError>(try transform(value))
            } catch {
                return Result<U, AnyError>(error)
            }
        case .failure(let error):
            return Result<U, AnyError>(error)
        }
    }
}


extension Result {
    
    init(value: Value?, error: ErrorType?) {
        if let error = error {
            self = .failure(error)
        } else if let value = value {
            self = .success(value)
        } else {
            fatalError("Could not create Result")
        }
    }
}

//: Result: Create a network request of your choice, and use the Result type.

//: Define a typealias for the Result that you're using, pinning the Error.

//: Result: Map over this result type to turn raw data into a more usable type.

//: Result: Create the materialize method
//
//extension Result {
//
//    /// Get the value if success else throw the saved error.
//    public func dematerialize() throws -> Value {
//        switch self {
//        case .success(let value):
//            return value
//        case .failure(let error):
//            throw error
//        }
//    }
//}
//
////: Result: Add the map method
//
//extension Result {
//
//    /// Initialiser for value.
//    public init(_ value: Value) {
//        self = .success(value)
//    }
//
//    /// Initialiser for error.
//    public init(_ error: ErrorType) {
//        self = .failure(error)
//    }
//
//    /// Evaluates the given closure when this Result instance has a value.
//    public func map<U>(_ transform: (Value) throws -> U) rethrows -> Result<U, ErrorType> {
//        switch self {
//        case .success(let value):
//            return Result<U, ErrorType>(try transform(value))
//        case .failure(let error):
//            return Result<U, ErrorType>(error)
//        }
//    }
//}

//: [Next](@next)
