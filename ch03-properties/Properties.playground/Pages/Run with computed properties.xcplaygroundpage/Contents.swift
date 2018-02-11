//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Run with computed properties
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
        return endTime !=  nil
    }
    
    mutating func setFinished() {
        endTime = Date()
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

print(run.elapsedTime)
sleep(4)
print(run.elapsedTime)
print(run.isFinished)
run.endTime = Date()
print(run.isFinished)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
