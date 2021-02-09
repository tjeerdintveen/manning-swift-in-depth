//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//: # Exercise 5: Mixing throwing functions with Result.

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
    case unexpectedError(Error) // Adding new error for when conversion to Result fails
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
        completion(Result.failure(.couldNotCreateURL))
            return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        let translatedError = error.map { FourSquareError.networkError($0) }
        let result = Result<Data, FourSquareError>(value: data, error: translatedError)
            // Parsing Data to JSON
            .flatMap { data in
                do {
                    let data = try parseData(data)
                    return Result.success(data)
                } catch {
                    return Result.failure(.unexpectedError(error))
                }
            }
            
            // Check for server errors
            .flatMap { (json: JSON) -> Result<JSON, FourSquareError> in
                do {
                    let json = try validateResponse(json: json)
                    return Result.success(json)
                } catch {
                    return Result.failure(.unexpectedError(error))
                }
            }
            // Extract venues
            .flatMap { (json: JSON) -> Result<[JSON], FourSquareError> in
                do {
                    let venues = try extractVenues(json: json)
                    return Result.success(venues)
                } catch {
                    return Result.failure(.unexpectedError(error))
                }
        }
        
        completion(result)
    }
    
    task.resume()
}

func parseData(_ data: Data) throws -> JSON {
    guard
        let json = try? JSONSerialization.jsonObject(with: data, options: []),
        let jsonDictionary = json as? JSON else {
            throw FourSquareError.couldNotParseData
    }
    return jsonDictionary
}

func validateResponse(json: JSON) throws -> JSON {
    if
        let meta = json["meta"] as? JSON,
        let errorType = meta["errorType"] as? String,
        let errorDetail = meta["errorDetail"] as? String {
        throw FourSquareError.serverError(errorType: errorType, errorDetail: errorDetail)
    }
    
    return json
}

func extractVenues(json:  JSON) throws -> [JSON] {
    guard
        let response = json["response"] as? JSON,
        let venues = response["venues"] as? [JSON]
        else {
            throw FourSquareError.couldNotParseData
    }
    return venues
}

// Times square
let latitude = 40.758896
let longitude = -73.985130

getVenues(latitude: latitude, longitude: longitude) { (result: Result<[JSON], FourSquareError>) in
    switch result {
    case .success(let categories): print(categories)
    case .failure(let error): print(error)
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
