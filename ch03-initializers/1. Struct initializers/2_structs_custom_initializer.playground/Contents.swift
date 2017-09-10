import Foundation // We need foundation for the Date type.

struct Pushups {
    let repetitions: [Int]
    let date: Date
    
    init(repetitions: [Int]) {
        self.repetitions = repetitions
        self.date = Date()
    }
}

let pushups = Pushups(repetitions: [22,20,10])

// Error "Extra argument 'date' in call.
let errorPushups = Pushup(repetitions: [22,20,10], date: Date())

