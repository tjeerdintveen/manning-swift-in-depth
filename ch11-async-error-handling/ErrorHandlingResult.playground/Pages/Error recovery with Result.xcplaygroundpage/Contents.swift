//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Error recovery with Result

import Foundation
import PlaygroundSupport

struct Account: Equatable {
    // Empty for educational purposes
}

enum PaymentError: Error {
    case amountTooLow
}

enum AccountError: Error {
    case invalidAccount
}

enum MoneyError: Error {
    case transactionFailed
}

final class MoneyApi {
    func transfer(amount: Int, from: Account, to: Account) throws {
        throw MoneyError.transactionFailed
    }
}

let moneyAPI = MoneyApi()

func processPayment(fromAccount: Account, toAccount: Account,
     amountInCents:Int) -> Result<(), Error> {

    guard amountInCents > 0 else {
        return Result.failure(PaymentError.amountTooLow)
    }

    guard fromAccount != toAccount else {
        return Result.failure(AccountError.invalidAccount)
    }

    do {
        try moneyAPI.transfer(amount: amountInCents, from: fromAccount, to:
         toAccount)
        return Result.success(())
    } catch {
        return Result.failure(error)
    }

}

processPayment(fromAccount: Account(), toAccount: Account(), amountInCents: -20) // amountTooLow
processPayment(fromAccount: Account(), toAccount: Account(), amountInCents: 20) // invalidAccount

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)



