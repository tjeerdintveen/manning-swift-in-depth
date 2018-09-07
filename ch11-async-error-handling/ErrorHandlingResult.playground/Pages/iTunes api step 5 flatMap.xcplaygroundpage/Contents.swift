//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # iTunes api step 5: flatMap

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
    
    /// Evaluates the given closure when this Result instance has an error.
    public func mapError<E: Error>(_ transform: (ErrorType) throws -> E) rethrows -> Result<Value, E> {
        switch self {
        case .success(let value):
            return Result<Value, E>(value)
        case .failure(let error):
            return Result<Value, E>(try transform(error))
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
    case underlyingError(NetworkError)
    case invalidData
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
        
        let convertedResult: SearchResult<JSON> =
            result
                // Transform error type to SearchResultError
                .mapError { (networkError: NetworkError) -> SearchResultError in
                    return SearchResultError.underlyingError(networkError)
                }
                // Parse Data to JSON, or return SearchResultError
                .flatMap { (data: Data) -> SearchResult<JSON> in
                    guard
                        let json = try? JSONSerialization.jsonObject(with: data, options: []),
                        let jsonDictionary = json as? JSON else {
                            return SearchResult(.invalidData) // Parsing failed, we now create a failing SearchResult.
                    }
                    
                    return SearchResult(jsonDictionary)
        }
        
        completionHandler(convertedResult)
    }
}

search(term: "Iron man") { (result: SearchResult<JSON>) in
    print(result)
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

