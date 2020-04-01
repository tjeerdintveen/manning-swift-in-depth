//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Mocking with protocols

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

protocol Session {
    associatedtype Task: DataTask
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> Task
    func dataTask(with url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) -> Task
}

protocol DataTask {
    func resume()
}

extension URLSession: Session {}
extension URLSessionDataTask: DataTask {}

class WeatherAPI<S: Session> {
    let session: S

    init(session: S) {
        self.session = session
    }

    func run() {
        guard let url = URL(string: "https://www.someweatherstartup.com") else {
            fatalError("Could not create url")
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            // load data
        }

        task.resume()
    }

}


let weatherAPI = WeatherAPI(session: URLSession.shared)
weatherAPI.run()


final class OfflineURLSession: Session {
    
    var sessions = [URL: OfflineTask]() // Make sure that we retain tasks
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> OfflineTask {
        let task = OfflineTask(completionHandler: completionHandler)
        sessions[url] = task
        return task
    }
}


enum ApiError: Error {
    case couldNotLoadData
}

struct OfflineTask: DataTask {
    
    typealias Completion =  (Data?, URLResponse?, Error?) -> Void
    let completionHandler: Completion
    
    init(completionHandler: @escaping Completion) {
        self.completionHandler = completionHandler
    }
    
    func resume() {
        let url = URL(fileURLWithPath: "prepared_response.json")
        let data = try! Data(contentsOf: url)
        completionHandler(data, nil, nil)
    }
}

let offlineApi = WeatherAPI(session: OfflineURLSession())
//offlineApi.run() // Only works once we have real json responses

//: Bonus extension

extension Session {
    func dataTask(with url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) -> Task {
        return dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completionHandler(Result.failure(error))
            } else if let data = data {
                completionHandler(Result.success(data))
            } else {
                fatalError()
            }
        })
    }
}

let url = URL(fileURLWithPath: "")
URLSession.shared.dataTask(with: url) { (result: Result<Data, Error>) in
    // ...
}

OfflineURLSession().dataTask(with: url) { (result: Result<Data, Error>) in
    // ...
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

