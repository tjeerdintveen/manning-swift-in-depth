//: [Previous](@previous)

import Foundation

//: 1. What is the difference between reduce and reduce(into:)?
//: With reduce(into:) we can prevent copies for each iteration.

//: 2. How would you choose between the two?
//: Reduce makes sense when we aren't creating expensive copies for each iteration, such as when reducing into an integer. reduce(into:) makes more sense when we are reducing into a struct, such as an array or dictionary.

//: ## Infinite Sequence

//: 3. Make an infinite sequence. This sequence will keep looping over the sequence that you pass.
//: An infinite sequence is useful to generate data, such as when zipping. The infinite sequence will keep going, but the other sequence could deplete, thus stopping the iteration.

// If we implement both Sequence and IteratorProtocol, we only need to implement the next method.
struct InfiniteSequence<S: Sequence>: Sequence, IteratorProtocol {
    
    let sequence: S
    var currentIterator: S.Iterator
    var isFinished: Bool = false
    
    init(_ sequence: S) {
        self.sequence = sequence
        self.currentIterator = sequence.makeIterator()
    }
    
    mutating func next() -> S.Element? {
        guard !isFinished else {
            return nil
        }
        
        if let element = currentIterator.next() {
            return element
        } else {
            self.currentIterator = sequence.makeIterator()
            let element = currentIterator.next()
            if element == nil {
                // If sequence is still empty after creating a new one, then the sequence is empty to begin with. We'll need to protect against this in case of an infinite loop.
                isFinished = true
            }
            return element
        }
    }
    
}

let infiniteSequence = InfiniteSequence(["a","b","c"])
for (index, letter) in zip(0..<100, infiniteSequence) {
    print("\(index): \(letter)")
}

//: 4. Make the following type adhere to Collection

struct Fruits {
    let banana = "Banana"
    let apple = "Apple"
    let tomato = "Tomato"
}

extension Fruits: Collection {
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return 3 // Yep, it's 3, not 2. That's how Collection wants it.
    }
    
    func index(after i: Int) -> Int {
        return i+1
    }
    
    subscript(index: Int) -> String {
        switch index {
        case 0: return banana
        case 1: return apple
        case 2: return tomato
        default: fatalError("The fruits end here.")
        }
    }
    
}

let fruits = Fruits()
fruits.forEach { (fruit) in
    print(fruit)
}
//: [Next](@next)
