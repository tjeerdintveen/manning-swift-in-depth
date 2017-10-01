//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Healthplan breaking lazy

import Foundation

//: ## Introducing the HealthPlan struct

struct HealthPlan {
    
    let intensity: Int
    
    var description: String
    
    lazy var contents: String = {
        // Smart algorithm calculation simulated here
        print("I'm taking my sweet time to calculate.")
        sleep(2)
        
        switch intensity {
        case ..<25: return "You can have a cheat meal, as long as you run 2 miles today!"
        case ..<50: return "Eat lots of proteins, perform 20 pushups and run 4 miles, you can do it!"
        case 100...: return "Eat raw eggs only. Do some crossfit and be sure to tell everyone!"
        default: return "Try to have a varied meal and 30 mins of exercise."
        }
    }()
    
    init(intensity: Int, description: String) {
        self.intensity = intensity
        self.description = description
    }
}

var plan = HealthPlan(intensity: 18, description: "A special workout for today!")
//: We can easily break lazy properties.
plan.contents = "Let's eat pizza and watch Netflix all day"
print(plan.contents) // "Let's eat pizza all day and watch Netflix"

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

