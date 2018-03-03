//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # iTunes api step 8: AnyError

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum PaymentError: Error {
    case amountTooLow
    case insufficientFunds
}

let error = AnyError(PaymentError.amountTooLow)

var result: Result<String, AnyError>
result = Result(PaymentError.amountTooLow)
result = Result(anyError: { () throws -> String in
    throw PaymentError.insufficientFunds
})


enum AccountError: Error {
    case invalidAccount
}

//: # Creating results with different errors

typealias GenericResult<Value> = Result<Value, AnyError>

struct Account {
    let id: String
}

func isValid(_ account: Account) -> Bool {
    return true
}

class MoneyAPI {
    
    func transfer(_ amountInCents: Int, from: Account, to: Account, completion: @escaping (Result<Data, AnyError>) -> Void) {
        
    }
}

let moneyAPI = MoneyAPI()

func processPayment(fromAccount: Account, toAccount: Account, amountInCents: Int, completion: @escaping (Result<String, AnyError>) -> Void) {
    
    guard amountInCents > 0 else {
        completion(Result(PaymentError.amountTooLow))
        return
    }
    
    guard isValid(toAccount) && isValid(fromAccount) else {
        completion(Result(AccountError.invalidAccount))
        return
    }

    moneyAPI.transfer(amountInCents, from: fromAccount, to: toAccount) { (result: Result<Data, AnyError>) in
        let response = result.mapAny(parseResponse)
        completion(response)
    }

}
enum ParsingError: Error {
    case invalidFormat
}

func parseResponse(_ data: Data) throws -> String {
    throw ParsingError.invalidFormat
}

let from = Account(id: "abc")
let to = Account(id: "def")
processPayment(fromAccount: from, toAccount: to, amountInCents: 100) { (result: Result<String, AnyError>) in
    switch result {
    case .success(let value): print(value)
    case .failure(let error) where error.underlyingError is AccountError:
        print("Accuont error")
    case .failure(let error):
        print(error)
    }
}

processPayment(fromAccount: from, toAccount: to, amountInCents: 100) { (result: Result<String, AnyError>) in
    let value = try? result.dematerialize()
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
