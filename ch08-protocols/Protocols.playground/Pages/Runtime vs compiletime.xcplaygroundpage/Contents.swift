//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Runtime vs compiletime

import Foundation

protocol CryptoCurrency {
    var name: String { get }
    var symbol: String { get }
    var holdings: Double { get set }
    var price: NSDecimalNumber? { get set }
}

struct Bitcoin: CryptoCurrency {
    let name = "Bitcoin"
    let symbol = "BTC"
    var holdings: Double
    var price: NSDecimalNumber?
}

struct Ethereum: CryptoCurrency {
    let name = "Ethereum"
    let symbol = "ETH"
    var holdings: Double
    var price: NSDecimalNumber?
}

func retrievePriceRunTime(coin: CryptoCurrency, completion: ((CryptoCurrency) -> Void) ) {
    // ... snip. Server returns coin with most-recent price.
    var copy = coin
    copy.price = 6000
    completion(copy)
}


func retrievePriceCompileTime<Coin: CryptoCurrency>(coin: Coin, completion: ((Coin) -> Void)) {
    // ... snip. Server returns coin with most-recent price.
    var copy = coin
    copy.price = 6000
    completion(copy)
}

let btc = Bitcoin(holdings: 3, price: nil)
retrievePriceRunTime(coin: btc) { (updatedCoin: CryptoCurrency) in
    print("Updated value runtime is \(updatedCoin.price?.doubleValue ?? 0)")
}

retrievePriceCompileTime(coin: btc) { (updatedCoin: Bitcoin) in
    print("Updated value compiletime is \(updatedCoin.price?.doubleValue ?? 0)")
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
