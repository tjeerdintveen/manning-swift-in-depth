import Foundation
// 1. Given this struct, does it make sense to change it into an enum? Why or why not? If so, change it to an enum.

struct RemoteImage {
    let isLoading: Bool
    let isCached: Bool
    let path: String
    let resolution: Int
    let data: Data
}

// 2. Given this struct, does it make sense to change it into an enum? Why or why not? If so, change it to an enum.

struct Friend {
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    let twitterHandle: String
    let instagramHandle: String
    let facebookProfileURL: String
}
