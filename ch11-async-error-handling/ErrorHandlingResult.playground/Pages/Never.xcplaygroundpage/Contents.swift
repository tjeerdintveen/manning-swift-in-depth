//: [Previous](@previous)

import Foundation


protocol Service {
    associatedtype Value
    associatedtype Err: Error
    func load(complete: @escaping (Result<Value, Err>) -> Void)
}

struct Subscription {}
/*
enum BogusError: Error {}

final class SubscriptionsLoader: Service {
    func load(complete: @escaping (Result<[Subscription], BogusError>) -> Void) {
        // ... load data. Always succeeds
        let subscriptions = [Subscription(), Subscription()]
        complete(Result(subscriptions))
    }
}

let subscriptionsLoader = SubscriptionsLoader()
subscriptionsLoader.load { (result: Result<[Subscription], BogusError>) in
    switch result {
    case .success(let subscriptions): print(subscriptions)
        // We don't need .failure
    }
}
*/
//: Using the Never type

final class SubscriptionsLoader: Service {
    func load(complete: @escaping (Result<[Subscription], Never>) -> Void) {
        // ... load data. Always succeeds
        let subscriptions = [Subscription(), Subscription()]
        complete(Result.success(subscriptions))
    }
}

let subscriptionsLoader = SubscriptionsLoader()
subscriptionsLoader.load { (result: Result<[Subscription], Never>) in
    switch result {
    case .success(let subscriptions): print(subscriptions)
        // We don't need .failure
    }
}

//: [Next](@next)
