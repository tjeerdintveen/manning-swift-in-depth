//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Healthplan lazy loading after copying

import Foundation

//: ## Introducing the HealthPlan struct

struct HealthPlan {
    
    var intensity: Int
    
    var description: String
    
    lazy private(set) var contents: String = {
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


var intenseHealthPlan = HealthPlan(intensity: 138, description: "A special workout for today!")


//: Copy is being made.
var easyPlan = intenseHealthPlan

//: Trigger lazy loading after a copy.
intenseHealthPlan.contents

//: We lower the intensity
easyPlan.intensity = 0

//: Now each plan loads their own contents separately
print(intenseHealthPlan.contents) // Eat raw eggs only. Do some crossfit and be sure to tell everyone!
print(easyPlan.contents) // You can have a cheat meal, as long as you run 2 miles today!

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

