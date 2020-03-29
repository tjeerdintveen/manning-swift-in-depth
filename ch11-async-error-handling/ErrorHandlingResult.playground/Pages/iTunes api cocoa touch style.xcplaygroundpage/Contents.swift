//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # iTunes api step 1: Cocoa Touch style

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func callURL(with url: URL, completionHandler: @escaping (Data?, Error?)
 -> Void) {
     let task = URLSession.shared.dataTask(with: url, completionHandler:
 { (data, response, error) -> Void in
        completionHandler(data, error)
     })

    task.resume()
}

let url = URL(string: "https://itunes.apple.com/search?term=iron%20man")!

callURL(with: url) { (data, error) in
     if let error = error {
         print(error)
    } else if let data = data {
         let value = String(data: data, encoding: .utf8)
         print(value)
    } else {
        // What goes here?
     }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
