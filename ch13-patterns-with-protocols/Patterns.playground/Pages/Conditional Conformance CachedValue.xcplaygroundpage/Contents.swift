//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Conditional Conformance CachedValue

import Foundation

final class CachedValue<T> {
    private let load: () -> T
    private var lastLoaded: Date
    
    private var timeToLive: Double
    private var currentValue: T
    
    public var value: T {
        let needsRefresh = abs(lastLoaded.timeIntervalSinceNow) > timeToLive
        if needsRefresh {
            currentValue = load()
            lastLoaded = Date()
        }
        return currentValue
    }
    
    init(timeToLive: Double, load: @escaping (() -> T)) {
        self.timeToLive = timeToLive
        self.load = load
        self.currentValue = load()
        self.lastLoaded = Date()
    }
}

//: Applying Conditional Conformance to CachedValue

extension CachedValue: Equatable where T: Equatable {
    static func == (lhs: CachedValue, rhs: CachedValue) -> Bool {
        return lhs.value == rhs.value
    }
}

// Conforming to Hashable
extension CachedValue: Hashable where T: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

// Conforming to Comparable
extension CachedValue: Comparable where T: Comparable {
    static func <(lhs: CachedValue, rhs: CachedValue) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func ==(lhs: CachedValue, rhs: CachedValue) -> Bool {
        return lhs.value == rhs.value
    }
}

let cachedValueOne = CachedValue(timeToLive: 60) {
    // Perform expensive operation
    // E.g. Calculate the purpose of life
    return 42
}

let cachedValueTwo = CachedValue(timeToLive: 120) {
    // Perform another expensive operation
    return 1000
}

cachedValueOne == cachedValueTwo // Equatable: We can check for equality.
cachedValueOne > cachedValueTwo // Comparable: We can compare two cached values.

let set = Set(arrayLiteral: cachedValueOne, cachedValueTwo) // Hashable: We can store CachedValue in a set

let simplecache = CachedValue(timeToLive: 2, load: { () -> String in
    print("I am being refreshed!")
    return "I am the value inside CachedValue"
})

// Prints: "I am being refreshed!"
simplecache.value // "I am the value inside CachedValue" <3>
simplecache.value // "I am the value inside CachedValue" <3>

sleep(3) // wait 3 seconds <4>

// Prints: "I am being refreshed!" <4>
simplecache.value // "I am the value inside CachedValue"


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
