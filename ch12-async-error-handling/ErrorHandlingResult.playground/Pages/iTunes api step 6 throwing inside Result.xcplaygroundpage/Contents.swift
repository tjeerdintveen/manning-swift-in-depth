//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # iTunes api step 6: Throwing inside Result

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

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

//: # Implementing Result

//: ## Lower level API call to make network requests

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

//: ## Higher level API call to Search

enum SearchResultError: Error {
    case invalidTerm(String)
    case underlyingError(NetworkError)
    case invalidData
}

typealias SearchResult<Value> = Result<Value, SearchResultError>
typealias JSON = [String: Any]

enum ParsingError: Error {
    case couldNotParseJSON
}

func parseData(_ data: Data) throws -> JSON {
    guard
        let json = try? JSONSerialization.jsonObject(with: data, options: []),
        let jsonDictionary = json as? JSON else {
            throw ParsingError.couldNotParseJSON
    }
    return jsonDictionary
}

func search(term: String, completionHandler: @escaping (SearchResult<JSON>) -> Void) {
    let cleanedTerm = term.components(separatedBy: .whitespacesAndNewlines).joined().lowercased()
    let path = "https://itunes.apple.com/search?term=" + cleanedTerm
    guard let url = URL(string: path) else {
        completionHandler(SearchResult(.invalidTerm(term)))
        return
    }
    
    callURL(with: url) { result in
        let convertedResult: SearchResult<JSON> =
            result
                .mapError { SearchResultError.underlyingError($0) }
                .flatMap { (data: Data) -> SearchResult<JSON> in
                    do {
                        // Catch if the parseData method throws some error.
                        let searchResult: SearchResult<JSON> = Result(try parseData(data))
                        return searchResult
                    } catch {
                        // We ignore any errors that parseData throws and revert to SearchResultError
                        return SearchResult(.invalidData)
                    }
        }
        
        completionHandler(convertedResult)
    }
}

//: ## Calling the search API

search(term: "Iron man") { (result: SearchResult<JSON>) in
    print(result)
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)



