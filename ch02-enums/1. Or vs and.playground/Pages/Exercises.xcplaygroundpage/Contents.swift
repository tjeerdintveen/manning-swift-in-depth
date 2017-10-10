//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Exercises

 import Foundation

/*:
 1. Given this struct that represents an image that is loaded remotely. Can we get compiler benefits by turning it into an enum?  If so, change it to an enum.
*/


struct RemoteImage {
    let isLoading: Bool
    let isCached: Bool
    let path: String
    let resolution: Int
    let data: Data
}

/*:
 2. Given this struct which represents a Friend in a social networking app.Does it make sense to turn this into an enum? If so, change it to an enum.
 */

struct Friend {
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    let twitterHandle: String?
    let instagramHandle: String?
    let facebookProfileURL: String?
}
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
