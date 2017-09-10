import Foundation // We need foundation for the Date type.

struct Pushups {
    let repetitions: [Int]
    let date: Date
}

extension Pushups {
    
    init(repetitions: [Int]) {
        self.repetitions = repetitions
        self.date = Date()
    }
    
    
}

let pushup = Pushups(repetitions: [22,20,10])

let secondPushup = Pushups(repetitions: [22,20,10], date: Date())

