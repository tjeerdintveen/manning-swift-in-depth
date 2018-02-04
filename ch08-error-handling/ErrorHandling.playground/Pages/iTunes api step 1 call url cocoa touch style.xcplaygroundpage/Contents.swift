//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


func callURL(with url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
        completionHandler(data, error)
    })
    
    task.resume()
}

let url = URL(string: "https://itunes.apple.com/search?term=ironman")!

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



//: [Next](@next)

