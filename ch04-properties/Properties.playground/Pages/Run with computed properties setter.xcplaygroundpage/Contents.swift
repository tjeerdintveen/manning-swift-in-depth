//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Run with computed properties setter
//: ## Introducing the Run workout

import Foundation

struct Run {
    let id: String
    let startTime: Date
    var endTime: Date?
    
    var elapsedTime: TimeInterval {
        return Date().timeIntervalSince(startTime)
    }
    
    var isFinished: Bool {
        get {
            return endTime !=  nil
        } set {
            if !newValue {
                endTime = nil
            } else if endTime == nil { // Only set endTime if it wasn't finished
                endTime = Date()
            }
        }
    }
    
    init(id: String, startTime: Date) {
        self.id = id
        self.startTime = startTime
        self.endTime = nil
    }
}

//: ## Creating a Run workout

var run = Run(id: "10", startTime: Date())

//: Here we are reading the values dynamically.

print(run.endTime) // nil
print(run.isFinished) // false
run.isFinished = true
print(run.endTime) // Optional(2017-09-30 15:41:22 +0000)
// We continue again
run.isFinished = false
print(run.endTime) // nil

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

