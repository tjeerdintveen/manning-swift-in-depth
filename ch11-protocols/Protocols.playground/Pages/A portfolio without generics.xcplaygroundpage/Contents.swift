//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # A portfolio without generics

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

final class Portfolio {
    var coins: [CryptoCurrency]
    
    init(coins: [CryptoCurrency]) {
        self.coins = coins
    }
    
    func addCoin(_ newCoin: CryptoCurrency) {
        coins.append(newCoin)
    }
    
    // Helper functions as an example. E.g. we could calculate total value.
    func calculateSum() -> NSDecimalNumber {
        var value = NSDecimalNumber(value: 0)
        for coin in coins {
            let amount = coin.holdings * (coin.price?.doubleValue ?? 0)
            value = value.adding(NSDecimalNumber(value: amount))
        }
        return value
    }
}

//: No need to specify what goes inside of portfolio.
let portfolio = Portfolio(coins: [])

//: Now we can mix coins.
let coins: [CryptoCurrency] = [
    Ethereum(holdings: 4, price: NSDecimalNumber(value: 500)),
    Bitcoin(holdings: 4, price: NSDecimalNumber(value: 6000))
]

portfolio.coins = coins

print(type(of: portfolio)) // Portfolio
let retrievedCoins = portfolio.coins
print(type(of: retrievedCoins)) // Array<CryptoCurrency>

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

