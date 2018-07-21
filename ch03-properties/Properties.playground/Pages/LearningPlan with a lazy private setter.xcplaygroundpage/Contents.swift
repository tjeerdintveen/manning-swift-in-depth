//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # LearningPlan with a lazy private setter

import Foundation

//: ## Introducing the LearningPlan struct

struct LearningPlan {
    
    let level: Int
    
    var description: String
    
    //: contents is now a lazy property.
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

var plan = LearningPlan(level: 18, description: "A special plan for today!")
//: Now, plan's content cannot be overriden, much safer!
//: See for yourself by uncommenting the next line.
//plan.contents = "Let's eat pizza and watch Netflix all day"

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

