//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Answers

//: 1. Answer. One way is to make Chef a protocol, and then we can swap out the implementation of Chef inside WaffleHouse. Then we can pass a testing chef to WaffleHouse.

struct Waffle {}

protocol Chef {
    func serve() -> Waffle
}

class TestingChef: Chef {
    var servedCounter: Int = 0
    func serve() -> Waffle {
        servedCounter += 1
        return Waffle()
    }
}

struct WaffleHouse<C: Chef> {
    
    let chef: C
    init(chef: C) {
        self.chef = chef
    }
    
    func serve() -> Waffle {
        return chef.serve()
    }
    
}

let testingChef = TestingChef()
let waffleHouse = WaffleHouse(chef: testingChef)
waffleHouse.serve()
testingChef.servedCounter == 1 // true

//: 2. Then you have more flexibility in having a base working with many types, and still the option to get benefits when a type does conform to a protocol.

//: 3. Make CachedValue conform to Track.

import Foundation

final class CachedValue<T> {
    private let load: (() -> T)
    private var lastLoad: Date
    
    private var timeToLive: Double
    private var currentValue: T
    
    public var value: T {
        let needsRefresh = lastLoad.timeIntervalSinceNow > timeToLive
        if needsRefresh {
            currentValue = load()
            lastLoad = Date()
            return currentValue
        }
        return currentValue
    }
    
    init(timeToLive: Double, load: @escaping (() -> T)) {
        self.timeToLive = timeToLive
        self.load = load
        self.currentValue = load()
        self.lastLoad = Date()
    }
}

protocol Track {
    func play()
}

class Song: Track {
    func play() {
        // Playing song
    }
}

//: Conditional conformance works on custom types too!
extension CachedValue: Track where T: Track {
    func play() {
        currentValue.play()
    }
}

let cachedSong = CachedValue<Song>(timeToLive: 360, load: { () -> Song in
    return Song()
})

cachedSong.play()

//: 4. Making a Pub Sub framework. We solve it by creating AnySubscriber.
//: Notice how we need to make AnySubscriber generic, because of the Message associated type from Subscriber. Thus in this case, Publisher stores AnySubscriber of type AnySubscriber<String>.
struct AnySubscriber<Msg>: SubscriberProtocol {
    
    private let _update: (_ message: Msg) -> Void

    typealias Message = Msg
    
    init<S: SubscriberProtocol>(_ subscriber: S) where S.Message == Msg {
        _update = subscriber.update
    }
    
    func update(message: Msg) {
        _update(message)
    }
}

protocol PublisherProtocol {
    associatedtype Message = String
    
    associatedtype Subscriber: SubscriberProtocol
        where Subscriber.Message == Message
    
    func subscribe(subscriber: Subscriber)
}

protocol SubscriberProtocol {
    associatedtype Message = String
    func update(message: Message)
}

//: Publisher isn't generic anymore. Now it can mix and match subscribers.
final class Publisher: PublisherProtocol {
    
    //: Publisher makes use of AnySubscriber<String> types. Basically, it pins down the Message associated type to String.
    var subscribers = [AnySubscriber<String>]()
    func subscribe(subscriber: AnySubscriber<String>) {
        subscribers.append(subscriber)
    }
    
    func sendEventToSubscribers() {
        subscribers.forEach { subscriber in
            subscriber.update(message: "Here's an event!")
        }
    }
}

//: We can test out our solution with two different subscribers.
final class Printer: SubscriberProtocol {
    
    func update(message: String) {
        print("I received: \(message)")
    }
}

final class Cacher: SubscriberProtocol {
    
    var storedMessages = [String]()
    
    func update(message: String) {
        print("I am storing: \(message)")
        storedMessages.append(message)
    }

}

let publisher = Publisher()
publisher.subscribe(subscriber: AnySubscriber(Printer()))
publisher.subscribe(subscriber: AnySubscriber(Cacher()))

publisher.sendEventToSubscribers()

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
