//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//: # Exercises 2, 3, and 4: FourSquare API with Result.

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

//: # A FourSquare API implementation

let clientId = "USE YOUR FOURSQUARE CLIENT ID"
let clientSecret = "USE YOUR FOURSQUARE CLIENT SECRET"
let apiVersion = "20180403"

func createURL(endpoint: String, parameters: [String: String]) -> URL? {
    let baseURL = "https://api.foursquare.com/v2/"
    
    // We convert the parameters dictionary in an array of URLQueryItems
    var queryItems = parameters.map { pair -> URLQueryItem in
        return URLQueryItem(name: pair.key, value: pair.value)
    }
    
    // Add default parameters to query
    queryItems.append(URLQueryItem(name: "v", value: apiVersion))
    queryItems.append(URLQueryItem(name: "client_id", value: clientId))
    queryItems.append(URLQueryItem(name: "client_secret", value: clientSecret))
    
    var components = URLComponents(string: baseURL + endpoint)
    components?.queryItems = queryItems
    return components?.url
}

enum FourSquareError: Error {
    case couldNotCreateURL
    case networkError(Error)
    case serverError(errorType: String, errorDetail: String)
    case couldNotParseData
}

typealias JSON = [String: Any]

/// Search for venues with the FourSquare API
/// // https://developer.foursquare.com/docs/api/venues/search
///
/// - Parameters:
///   - latitude: latitude of a location
///   - longitude: longitude of a location
///   - completion: returns Result with either a [JSON] or potential FourSquareError
func getVenues(latitude: Double, longitude: Double, completion: @escaping (Result<[JSON], FourSquareError>) -> Void) {
    let parameters = [
        "ll": "\(latitude),\(longitude)",
        "intent": "browse",
        "radius": "250"
    ]
    
    guard let url = createURL(endpoint: "venues/search", parameters: parameters)
        else {
            completion(Result(.couldNotCreateURL))
            return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        let translatedError = error.map { FourSquareError.networkError($0) }
        let result = Result<Data, FourSquareError>(value: data, error: translatedError)
            // Parsing Data to JSON
            .flatMap { data in
                guard
                    let rawJson = try? JSONSerialization.jsonObject(with: data, options: []),
                    let json = rawJson as? JSON
                    else {
                        return Result(.couldNotParseData)
                }
                return Result(json)
            }
            // Check for server errors
            .flatMap { (json: JSON) -> Result<JSON, FourSquareError> in
                if
                    let meta = json["meta"] as? JSON,
                    let errorType = meta["errorType"] as? String,
                    let errorDetail = meta["errorDetail"] as? String {
                    return Result(.serverError(errorType: errorType, errorDetail: errorDetail))
                }
                
                return Result(json)
            }
            // Extract venues
            .flatMap { (json: JSON) -> Result<[JSON], FourSquareError> in
                guard
                    let response = json["response"] as? JSON,
                    let venues = response["venues"] as? [JSON]
                    else {
                        return Result(.couldNotParseData)
                }
                return Result(venues)
        }
        
        completion(result)
    }
    
    task.resume()
}


// Times square
let latitude = 40.758896
let longitude = -73.985130

//: ## Calling getVenues

getVenues(latitude: latitude, longitude: longitude) { (result: Result<[JSON], FourSquareError>) in
    switch result {
    case .success(let categories): print(categories)
    case .failure(let error): print(error)
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
