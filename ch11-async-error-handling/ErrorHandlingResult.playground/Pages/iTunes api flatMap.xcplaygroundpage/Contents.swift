//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # iTunes api : flatMap

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//: A custom extension to accept an optional value and error, for convenience with bridging from NSURLSession

extension Swift.Result {
      // ... snip

    init(value: Success?, error: Failure?) {
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

func search(term: String, completionHandler: @escaping (SearchResult<JSON>)
 -> Void) {
    let encodedString = term.addingPercentEncoding(withAllowedCharacters:
        .urlHostAllowed)
    let path = encodedString.map { "https://itunes.apple.com/search?term="
        + $0 }
    
    guard let url = path.flatMap(URL.init) else {
        let result = SearchResult<JSON>.failure(.invalidTerm(term))
        completionHandler(result)
        return
    }

    callURL(with: url) { result in

        let convertedResult: SearchResult<JSON> =
            result
                 // Transform Data to JSON
                .map { (data: Data) -> JSON in
                     guard
                        let json = try? JSONSerialization.jsonObject(with:
 data, options: []),
                        let jsonDictionary = json as? JSON else {
                            return [:]
                     }

                    return jsonDictionary
                }
                // Transform NetworkError to SearchResultError
                .mapError { (networkError: NetworkError) ->
 SearchResultError in
                     return SearchResultError.underlyingError(networkError)
 // Handle error from lower layer
        }

        completionHandler(convertedResult)
     }
}

search(term: "Iron man") { (result) in
    switch result {
    case .success(let json): print(json)
    case .failure(let error): print(error)
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

