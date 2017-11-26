//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Enum with omitted raw values

import Foundation

enum Currency: String {
    case euro
    case usd
    case gbp
}

let currency = Currency.euro
print(currency.rawValue) // "usd"


let parameters = ["filter": currency.rawValue]
print(parameters) // ["filter": "euro"]

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
