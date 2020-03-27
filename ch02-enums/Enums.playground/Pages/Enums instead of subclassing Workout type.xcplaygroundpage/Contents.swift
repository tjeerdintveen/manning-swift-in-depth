//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation // We need foundation for the Date type.

struct Run {
    let id: String
    let startTime: Date
    let endTime: Date
    let distance: Float
    let onRunningTrack: Bool
}

struct Cycle {
    
    enum CycleType {
        case regular
        case mountainBike
        case racetrack
    }
    
    let id: String
    let startTime: Date
    let endTime: Date
    let distance: Float
    let incline: Int
    let type: CycleType
}

struct Pushups {
    let repetitions: [Int]
    let date: Date
}

let run = Run(id: "3", startTime: Date(), endTime: Date(timeIntervalSinceNow: 3600), distance: 300, onRunningTrack: false)

let cycle = Cycle(id: "4", startTime: Date(), endTime: Date(timeIntervalSinceNow: 3600), distance: 400, incline: 20, type: .mountainBike)

let pushups = Pushups(repetitions: [22,20,10], date: Date())

enum Workout {
    case run(Run)
    case cycle(Cycle)
    case pushups(Pushups)
}

let workout = Workout.pushups(pushups)


switch workout {
case .run(let run):
    print("Run: \(run)")
case .cycle(let cycle):
    print("Cycle: \(cycle)")
case .pushups(let pushups):
    print("Pushups: \(pushups)")
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
