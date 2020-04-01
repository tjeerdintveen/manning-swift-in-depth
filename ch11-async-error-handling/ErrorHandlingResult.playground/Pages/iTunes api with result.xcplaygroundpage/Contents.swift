//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # iTunes api: call url with Result

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum NetworkError: Error {
    case fetchFailed(Error)
 }

func callURL(with url: URL, completionHandler: @escaping (Result<Data,
 NetworkError>) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler: {
 (data, response, error) -> Void in
      // ... details will be filled in shortly
    })

    task.resume()
}

let url = URL(string: "https://itunes.apple.com/search?term=iron%20man")!

callURL(with: url) { (result: Result<Data, NetworkError>) in
    switch result {
    case .success(let data):
         let value = String(data: data, encoding: .utf8)
         print(value)
    case .failure(let error):
         print(error)
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
