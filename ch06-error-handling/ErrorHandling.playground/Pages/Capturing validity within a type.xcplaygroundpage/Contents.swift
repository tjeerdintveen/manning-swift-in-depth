//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Capturing validity within a type

import Foundation

enum ValidationError: Error {
    case noEmptyValueAllowed
    case invalidPhoneNumber
}
func validatePhoneNumber(_ text: String) throws {
    guard !text.isEmpty else {
        throw ValidationError.noEmptyValueAllowed
    }
    
    let pattern = "^(\\([0-9]{3}\\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$"
    if text.range(of: pattern, options: .regularExpression, range: nil, locale: nil) == nil {
        throw ValidationError.invalidPhoneNumber
    }
}

do {
    try validatePhoneNumber("(123) 123-1234")
    print("Phonenumber is valid")
} catch {
    print(error)
}

struct PhoneNumber {
    
    let contents: String
    
    init(_ text: String) throws {
        guard !text.isEmpty else {
            throw ValidationError.noEmptyValueAllowed
        }
        
        let pattern = "^(\\([0-9]{3}\\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$"
        if text.range(of: pattern, options: .regularExpression, range: nil, locale: nil) == nil {
            throw ValidationError.invalidPhoneNumber
        }
        self.contents = text
    }
}

do {
    let phoneNumber = try PhoneNumber("(123) 123-1234")
    print(phoneNumber.contents) // (123) 123-1234
} catch {
    print(error)
}
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
