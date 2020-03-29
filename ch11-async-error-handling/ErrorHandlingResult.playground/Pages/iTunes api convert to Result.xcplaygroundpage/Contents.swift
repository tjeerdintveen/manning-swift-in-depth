//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # iTunes api step 2: call url with Result

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

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

let url = URL(string: "https://itunes.apple.com/search?term=iron%20man")!

func callURL(with url: URL, completionHandler: @escaping (Result<Data,
 NetworkError>) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler:
 { (data, response, error) -> Void in
         let dataTaskError = error.map { NetworkError.fetchFailed($0)}
    let result = Swift.Result<Data, NetworkError>(value: data, error:
 dataTaskError)
         completionHandler(result)
    })

    task.resume()
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
