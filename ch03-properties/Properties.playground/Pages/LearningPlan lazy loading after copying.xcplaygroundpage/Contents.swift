//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # LearningPlan lazy loading after copying

import Foundation

//: ## Introducing the LearningPlan struct

struct LearningPlan {
    
    var level: Int
    
    var description: String
    
    lazy private(set) var contents: String = {
        // Smart algorithm calculation simulated here
        print("I'm taking my sweet time to calculate.")
        sleep(2)
        
        switch level {
        case ..<25: return "Watch an English documentary."
        case ..<50: return "Translate a newspaper article to English and transcribe one song."
        case 100...: return "Read two academic papers and translate them into your native language."
        default: return "Try to have 30 mins of English reading."
        }
    }()
    
    init(level: Int, description: String) {
        self.level = level
        self.description = description
    }
}


var intensePlan = LearningPlan(level: 138, description: "A special plan for today!")


//: Copy is being made.
var easyPlan = intensePlan

//: Trigger lazy loading after a copy.
intensePlan.contents

//: We lower the intensity
easyPlan.level = 0

//: Now each plan loads their own contents separately
print(intensePlan.contents) // Read two academic papers and translate them into your native language.
print(easyPlan.contents) // Watch an English documentary.

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

