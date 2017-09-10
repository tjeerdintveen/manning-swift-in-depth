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
    
    // A single set is enough for today.
    init(singleSet: Int) {
        self.repetitions = [singleSet]
        self.date = Date()
    }
}

// Free initializer
let pushups = Pushups(repetitions: [22,20,10], date: Date())

// Customer initializers
let multipleRepetitionsPushups = Pushups(repetitions: [22,20,10])
let singleSetPushups = Pushups(singleSet: 3)
