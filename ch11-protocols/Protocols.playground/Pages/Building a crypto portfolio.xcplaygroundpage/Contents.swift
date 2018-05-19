//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Building a crypto portfolio

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

final class Portfolio<Coin: CryptoCurrency> {
    var coins: [Coin]
    
    init(coins: [Coin]) {
        self.coins = coins
    }
    
    func addCoin(_ newCoin: Coin) {
        coins.append(newCoin)
    }
    
    func calculateSum() -> NSDecimalNumber {
        var value = NSDecimalNumber(value: 0)
        for coin in coins {
            let amount = coin.holdings * (coin.price?.doubleValue ?? 0)
            value = value.adding(NSDecimalNumber(value: amount))
        }
        return value
    }
}

let coins = [
    Ethereum(holdings: 4, price: NSDecimalNumber(value: 500)),
//    Bitcoin(holdings: 4, price: NSDecimalNumber(value: 6000)) // We can't mix
]
let portfolio = Portfolio(coins: coins)

//portfolio.addCoin(Bitcoin())
//  error: cannot convert value of type 'Bitcoin' to expected argument type 'Ethereum'
print(type(of: portfolio.coins)) // Array<Ethereum>

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
