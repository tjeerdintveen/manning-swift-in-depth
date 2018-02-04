//: [Previous](@previous)

import Foundation


public enum Result<Value, ErrorType> {
    /// Indicates success with value in the associated object.
    case success(Value)
    
    /// Indicates failure with error inside the associated object.
    case failure(ErrorType)
}

typealias WannabeOptional<T> = Result<T, ()>
let optionalString: WannabeOptional<String> = WannabeOptional.success("I am almost like an optional")

//Unwrapping the Optional-like Result
switch optionalString {
case .success(let value): print(value) // I am almost like an optional
case .failure(let errorValue): print(errorValue) // (), nothing, like nil
}


func doubleSignedIntegers(_ value: Int) -> Result<Int, String> {
    if value <= 0 {
        return Result.failure("Integer must be above 0")
    } else {
        return Result.success(value + value)
    }
}

let failedDouble = doubleSignedIntegers(-20)
switch failedDouble {
case .success(let value): print(value)
case .failure(let errorString): print(errorString) // Integer must be above 0
}

let successfulDouble = doubleSignedIntegers(36)
switch successfulDouble {
case .success(let value): print(value) // 72
case .failure(let errorString): print(errorString)
}

// With Swift error
//public enum Result<Value, ErrorType: Swift.Error> {

//: [Next](@next)
