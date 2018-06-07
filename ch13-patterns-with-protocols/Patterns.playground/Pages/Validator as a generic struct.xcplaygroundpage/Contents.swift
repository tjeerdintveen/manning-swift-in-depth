//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Validator as a generic struct

import Foundation

struct Validator<T> {
    
    let validate: (T) -> Bool
    
    init(validate: @escaping (T) -> Bool) {
        self.validate = validate
    }
}

let notEmpty = Validator<String>(validate: { string -> Bool in
    return !string.isEmpty
})

notEmpty.validate("") // false
notEmpty.validate("Still reading this book huh? That's cool!") // true

extension Validator {
    func combine(_ other: Validator<T>) -> Validator<T> {
        let combinedValidator = Validator<T>(validate: { (value: T) -> Bool in
            let ownResult = self.validate(value)
            let otherResult = other.validate(value)
            return ownResult && otherResult
        })
        
        return combinedValidator
    }
}

let maxTenChars = Validator<String>(validate: { string -> Bool in
    return string.count <= 10
})

let combinedValidator: Validator<String> = notEmpty.combine(maxTenChars)
combinedValidator.validate("") // false
combinedValidator.validate("Hi") // true
combinedValidator.validate("This one is way too long") // false

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
