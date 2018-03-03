//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # iTunes api step 3: Adding search

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//: A custom extension to accept an optional value and error, for convenience with bridging from NSURLSession
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
        switch result {
        case .success(let data):
            if
                let json = try? JSONSerialization.jsonObject(with: data, options: []),
                let jsonDictionary = json as? JSON {
                let result = SearchResult<JSON>(jsonDictionary)
                completionHandler(result)
            } else {
                let result = SearchResult<JSON>(.invalidData)
                completionHandler(result)
            }
        case .failure(let error):
            let result = SearchResult<JSON>(.underlyingError(error))
            completionHandler(result)
        }
    }
}

search(term: "Iron man") { (result) in
    switch result {
    case .success(let json): print(json)
    case .failure(let error): print(error)
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

