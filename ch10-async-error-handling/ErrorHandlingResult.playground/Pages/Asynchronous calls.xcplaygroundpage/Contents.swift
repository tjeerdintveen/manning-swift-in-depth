//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Asynchronous calls

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://www.duckduckgo.com/")!

let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
    if let error = error {
        print(error)
    } else if let data = data {
        let value = String(data: data, encoding: .utf8)
        print(value)
    } else {
        // What goes here?
    }
})

//task.resume()

public enum Result<Value, ErrorType: Swift.Error> {

    /// Indicates success with value in the associated object.
    case success(Value)
    
    /// Indicates failure with error inside the associated object.
    case failure(ErrorType)
    
    init(value: Value?, error: ErrorType?) {
        if let error = error {
            self = .failure(error)
        } else if let value = value {
            self = .success(value)
        } else {
            fatalError("Could not create Result")
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

enum DataTaskError: Error {
    case fetchFailed(Error)
}

// WIth regular Result type
//func customDataTask(with url: URL, completionHandler: @escaping (Result<Data, DataTaskError>) -> Void) {
//    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
//        let dataTaskError = error.map { DataTaskError.fetchFailed($0)}
//        let result = Result<Data, DataTaskError>(value: data, error: dataTaskError)
//        completionHandler(result)
//    })
//
//    task.resume()
//}

// With DataTaskResult
typealias DataTaskResult<Value> = Result<Value, DataTaskError>

let datataskResult = DataTaskResult("Hi there")
print(datataskResult) // success("Hi there")


func customDataTask(with url: URL, completionHandler: @escaping (DataTaskResult<Data>) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
        let dataTaskError = error.map { DataTaskError.fetchFailed($0)}
        let result = DataTaskResult<Data>(value: data, error: dataTaskError)
        completionHandler(result)
    })
    
    task.resume()
}

//customDataTask(with: url) { (result: Result<Data, DataTaskError>) in
//    switch result {
//    case .success(let data):
//        let value = String(data: data, encoding: .utf8)
//        print(value)
//    case .failure(let error):
//        print(error)
//    }
//}

//: ## Conversion to Optional

customDataTask(with: url) { (result: Result<Data, DataTaskError>) in
    let value = try? result.dematerialize()
    print(value) // Optional("<!DOCTYPE html> ... etc
}

//: ## Map

func htmlFrom(url: URL, completionHandler: @escaping (DataTaskResult<String>) -> Void) {
    customDataTask(with: url) { (result: DataTaskResult<Data>) in
        let convertedResult: DataTaskResult<String> = result.map({ (data: Data) -> String in
            return String(data: data, encoding: .utf8) ?? ""
        })
        completionHandler(convertedResult)
    }
}

htmlFrom(url: url) { (result: DataTaskResult<String>) in
    switch result {
    case .success(let html): print(html)
    case .failure(let error): print(error)
    }
}

enum ParsingError: Error {
    case parsingFailed
    case invalidSymbol
}

let someError = Result<String, ParsingError>.failure(ParsingError.invalidSymbol)
let convertedError = someError.map { (string: String) -> String in
    return "The value is \(string)"
}

switch convertedError {
case .success(let string): print(string)
case .failure(let error): print(error) // invalidSymbol
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
