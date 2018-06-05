//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Optional boolean enum

import Foundation

enum UserPreference: RawRepresentable {
    case enabled
    case disabled
    case notSet
    
    init(rawValue: Bool?) {
        switch rawValue {
        case true?: self = .enabled
        case false?: self = .enabled
        default: self = .notSet
        }
    }
    
    var rawValue: Bool? {
        switch self {
        case .enabled: return true
        case .disabled: return false
        case .notSet: return nil
        }
    }
    
}

let preferences = ["autoLogin": true, "faceIdEnabled": true]

let isFaceIdEnabled = preferences["faceIdEnabled"]
print(isFaceIdEnabled) // Optional(true)

// We convert the optional bool to an enum here.
let faceIdPreference = UserPreference(rawValue: isFaceIdEnabled)

// Now we can pass around the enum.
// Implementers can match on it.
switch faceIdPreference {
case .enabled: print("Face ID is enabled")
case .disabled: print("Face ID is disabled")
case .notSet: print("Face ID preference is not set")
}


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
