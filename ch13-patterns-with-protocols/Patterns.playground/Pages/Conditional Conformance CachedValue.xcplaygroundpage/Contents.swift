//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Conditional Conformance CachedValue

import Foundation

final class CachedValue<T> {
    private let load: (() -> T)
    private var lastLoaded: Date
    
    private var timeToLive: Double
    private var currentValue: T
    
    public var value: T {
        let needsRefresh = lastLoaded.timeIntervalSinceNow > timeToLive
        if needsRefresh {
            currentValue = load()
            lastLoaded = Date()
            return currentValue
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

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
