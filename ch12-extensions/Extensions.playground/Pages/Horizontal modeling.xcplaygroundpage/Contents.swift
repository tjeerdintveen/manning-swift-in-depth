//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Horizontal modeling

import Foundation

protocol RequestBuilder {
    var baseURL: URL { get }
    func makeRequest(path: String) -> URLRequest
}

extension RequestBuilder {
    func makeRequest(path: String) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpShouldHandleCookies = false
        request.timeoutInterval = 30
        return request
    }
}

struct BikeRequestBuilder: RequestBuilder {
    let baseURL: URL = URL(string: "https://www.biketriptracker.com")!
}

let bikeRequestBuilder = BikeRequestBuilder()
let request = bikeRequestBuilder.makeRequest(path: "/trips/all")
print(request) // https://www.biketriptracker.com/trips/all

//: ## Multiple extensions

enum ResponseError: Error {
    case invalidResponse
}
protocol ResponseHandler {
    func decrypt(data: Data) throws -> Data
    func validate(response: URLResponse) throws
}

extension ResponseHandler {
    func validate(response: URLResponse) throws {
        guard let httpresponse = response as? HTTPURLResponse else {
            throw ResponseError.invalidResponse
        }
    }
}

class BikeAPI: RequestBuilder, ResponseHandler {
    let baseURL: URL = URL(string: "https://www.biketriptracker.com")!
    
    func decrypt(data: Data) throws -> Data {
        return data
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
