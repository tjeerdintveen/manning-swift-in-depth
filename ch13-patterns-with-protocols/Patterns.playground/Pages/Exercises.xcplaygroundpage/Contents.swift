//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Exercises

//: 1. Given these types, see if you can make WaffleHouse testable to verify that a Waffle has been served.

struct Waffle {}

class Chef {
    func serve() -> Waffle {
        return Waffle()
    }
}

struct WaffleHouse {
    
    let chef = Chef()
    
    func serve() -> Waffle {
        return chef.serve()
    }
    
}

let waffleHouse = WaffleHouse()
let waffle = waffleHouse.serve()

//: 2. What is the benefit of a generic having few constraints, when applying conditional conformance?

//: 3. Make CachedValue conform to `Track`.

//: 4. Are you up for an advanced challenge? We're building a small Publisher/Subscriber framework. Where a publisher can notify all its listed subscribers of an event. Currently, Publisher can maintain an array of a single type of subscriber.
//: Can you type erase SubscriberProtocol, so that Publisher can store different types of subscribers?
//: Hint: Since SubscriberProtocol has an associated type, you can make a generic AnySubscriber<Msg> where Msg represents the Message associated type.

//: First, we introduce the PublisherProtocol.
protocol PublisherProtocol {
    //: Message defaults to String, but can be something else too.
    //: This saves us a typealias declaration.
    associatedtype Message = String
    
    //: PublisherProtocol has a Subscriber, constrained to the SubscriberProtocol.
    //: They share the same message type.
    associatedtype Subscriber: SubscriberProtocol
        where Subscriber.Message == Message
    
    func subscribe(subscriber: Subscriber)
}

//: Second, we introduce the SubscriberProtocol, resembling a subscriber that reacts to events from a publisher.
protocol SubscriberProtocol {
    //: Message defaults to String, but can be something else too.
    //: This saves us a typealias declaration.
    associatedtype Message = String
    func update(message: Message)
}

//: We create a Publisher that stores a single type of subscriber. But, it can't mix and match subscribers.
//: Can you make Publisher work with multiple types of subscribers?
final class Publisher<S: SubscriberProtocol>: PublisherProtocol where S.Message == String {
    
    var subscribers = [S]()
    func subscribe(subscriber: S) {
        subscribers.append(subscriber)
    }
    
    func sendEventToSubscribers() {
        subscribers.forEach { subscriber in
            subscriber.update(message: "Here's an event!")
        }
    }
}

//: To demonstrate, we can repeatedly pass a single type of subscriber to a publisher
final class SomeSubscriber: SubscriberProtocol {
    func update(message: String) {
        print("I received: \(message)")
    }
}

let publisher = Publisher<SomeSubscriber>()
publisher.subscribe(subscriber: SomeSubscriber())
publisher.subscribe(subscriber: SomeSubscriber())
publisher.sendEventToSubscribers()

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
