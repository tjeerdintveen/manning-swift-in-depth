//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # iTunes api step 3: Adding search

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

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

//: A custom extension to accept an optional value and error, for convenience with bridging to NSURLSession
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

enum NetworkError: Error {
    case fetchFailed(Error)
}

func callURL(with url: URL, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
        let dataTaskError = error.map { NetworkError.fetchFailed($0)}
        let result = Result<Data, NetworkError>(value: data, error: dataTaskError)
        completionHandler(result)
    })
    
    task.resume()
}

enum SearchResultError: Error {
    case invalidTerm(String)
    case loadingError(NetworkError)
    case failedToParseJSON(Data)
}

typealias SearchResult<Value> = Result<Value, SearchResultError>
typealias JSON = [String: Any]

func search(term: String, completionHandler: @escaping (SearchResult<JSON>) -> Void) {
    let cleanedTerm = term.components(separatedBy: .whitespacesAndNewlines).joined().lowercased()
    let path = "https://itunes.apple.com/search?term=" + cleanedTerm
    guard let url = URL(string: path) else {
        completionHandler(SearchResult(.invalidTerm(term)))
        return
    }
    callURL(with: url) { result in
        switch result {
        case .success(let data):
            if
                let json = try? JSONSerialization.jsonObject(with: data, options: []),
                let jsonDictionary = json as? JSON {
                let result = SearchResult<JSON>(jsonDictionary)
                completionHandler(result)
            } else {
                let result = SearchResult<JSON>(.failedToParseJSON(data))
                completionHandler(result)
            }
        case .failure(let error):
            let result = SearchResult<JSON>(.loadingError(error))
            completionHandler(result)
        }
    }
}

search(term: "Iron man") { (result) in
    print(result)
}


//: ## Dematerialize
let url = URL(string: "https://itunes.apple.com/search?term=ironman")!

callURL(with: url) { (result: Result<Data, NetworkError>) in
    let value = try? result.dematerialize()
    print(value) // Optional(80709 bytes)
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

