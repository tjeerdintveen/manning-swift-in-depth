//: [Previous](@previous)

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

//: [Next](@next)


