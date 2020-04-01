//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Exercises and Answers

import Foundation

//: ## 1. Create an extension that enables the explode() function, but only on types that conform to a Mentos and Coke protocols

protocol Mentos {}
protocol Coke {}

extension Mentos where Self: Coke {
    func explode() {
        print("BOOM!")
    }
}

func mix<T>(concoction: T) where T: Mentos, T: Coke {
    concoction.explode()
}

//: ## 2. What is the output of the following code?

protocol Transaction {
    var description: String { get }
}
extension Transaction {
    var description: String { return "Transaction" }
}

protocol RefundableTransaction: Transaction {}

extension RefundableTransaction {
    var description: String { return "RefundableTransaction" }
}

struct CreditcardTransaction: RefundableTransaction {}

func printDescription(transaction: Transaction) {
    print(transaction.description)
}

printDescription(transaction: CreditcardTransaction())

//: ## 3.
import UIKit
protocol MyProtocol {}

//: What is the difference between:
extension UIViewController: MyProtocol {}
//: and
extension MyProtocol where Self: UIViewController {}

//: Answer: The first line makes all uiviewcontrollers and their subclasses conform to MyProtocol. The second line makes a ViewController only adhere to a protocol on a as needed basis.

//: 4. Up for a challenge? Create a "scan" extension on Sequence. This is like reduce, but, besides returning the end value, it also returns intermediary results, all as one array. Very useful for debugging! Be sure to use makeIterator and ContiguousArray for extra speed.

extension Sequence {
    func scan<Result>(
        initialResult: Result,
        _ nextPartialResult: (Result, Element) throws -> Result
        ) rethrows -> [Result] {
        var iterator = makeIterator()
        
        var results = ContiguousArray<Result>()
        var accumulated: Result = initialResult
        while let element = iterator.next() {
            accumulated = try nextPartialResult(accumulated, element)
            results.append(accumulated)
        }
        
        return Array(results)
    }
}


let results = (0..<5).scan(initialResult: "") { (result: String, int: Int) -> String in
        return "\(result)\(int)"
}
print(results) // ["0", "01", "012", "0123", "01234"]


let lowercased = ["S", "W", "I", "F", "T"].scan(initialResult: "") { (result: String, string: String) -> String in
    return "\(result)\(string.lowercased())"
}

print(lowercased) // ["s", "sw", "swi", "swif", "swift"]

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
