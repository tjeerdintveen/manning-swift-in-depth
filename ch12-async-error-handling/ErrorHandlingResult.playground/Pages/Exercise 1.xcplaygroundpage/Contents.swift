//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//: # Exercise 1.
//: By looking at the map function on Result, see if you can create mapError.

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

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
