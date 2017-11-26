//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Enum with explicit raw values

import Foundation

enum Currency: String {
    case euro = "euro"
    case usd = "usd"
    case gbp = "gdp"
}

let currency = Currency.euro
print(currency.rawValue) // "usd"


let parameters = ["filter": currency.rawValue]
print(parameters) // ["filter": "euro"]

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
