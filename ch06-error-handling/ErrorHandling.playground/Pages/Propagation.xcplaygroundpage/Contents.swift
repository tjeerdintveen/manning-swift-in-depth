//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Propagation

import Foundation

struct Recipe {
    let ingredients: [String]
    let steps: [String]
}

enum ParseRecipeError: Error {
    case parseError(line: Int, symbol: String)
    case noRecipeDetected
    case noIngredientsDetected
}


extension ParseRecipeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .parseError:
            return NSLocalizedString("The HTML file had unexpected symbols.",
                                     comment: "Parsing error reason unexpected symbols")
        case .noIngredientsDetected:
            return NSLocalizedString("No ingredients were detected.",
                                     comment: "Parsing error no ingredients.")
        case .noRecipeDetected:
            return NSLocalizedString("No recipe was detected.",
                                     comment: "Parsing error no recipe.")
        }
    }
    
    var failureReason: String? {
        switch self {
        case let .parseError(line: line, symbol: symbol):
            return String(format: NSLocalizedString("Parsing data failed at line: %i and symbol: %@",
                                                    comment: "Parsing error line symbol"), line, symbol)
        case .noIngredientsDetected:
            return NSLocalizedString("The recipe seems to be missing its ingredients.",
                                     comment: "Parsing error reason missing ingredients.")
        case .noRecipeDetected:
            return NSLocalizedString("The recipe seems to be missing a recipe.",
                                     comment: "Parsing error reason missing recipe.")
        }
    }
    
    var recoverySuggestion: String? {
        return "Please try a different recipe."
    }
    
}

extension ParseRecipeError: CustomNSError {
    static var errorDomain: String { return "com.recipeextractor" }
    
    var errorCode: Int { return 300 }
    
    var errorUserInfo: [String: Any] {
        return [
            NSLocalizedDescriptionKey: errorDescription ?? "",
            NSLocalizedFailureReasonErrorKey: failureReason ?? "",
            NSLocalizedRecoverySuggestionErrorKey: recoverySuggestion ?? ""
        ]
    }
}

let nsError: NSError = ParseRecipeError.parseError(line: 3, symbol: "#") as NSError
print(nsError)


import UIKit

struct ErrorHandler {
    
    static let `default` = ErrorHandler()
    
    let genericMessage = "Sorry! Something went wrong"
    
    func handleError(_ error: Error) {
        presentToUser(message: genericMessage)
    }
    
    func handleError(_ error: LocalizedError) {
        if let errorDescription = error.errorDescription {
            presentToUser(message: errorDescription)
        } else {
            presentToUser(message: genericMessage)
        }
    }
    
    func presentToUser(message: String) {
        // Show alert dialog in iOS or OSX
        // ... snip
    }
    
}



// Removes the blabbing stories that people put in front of recipes and strips the actual recipe
struct RecipeExtractor {
    
    let html: String
    
    func extractRecipe() throws -> Recipe {
        return try parseHTML(html)
    }
    
    private func parseHTML(_ html: String) throws -> Recipe {
        let ingredients = try extractIngredients(html)
        let steps = try extractSteps(html)
        return Recipe(ingredients: ingredients, steps: steps)
    }
    
    private func extractIngredients(_ html: String) throws -> [String] {
        // ... Parsing happens here
        
        // .. Unless an error is thrown
        throw ParseRecipeError.noIngredientsDetected
    }
    
    private func extractSteps(_ html: String) throws -> [String] {
        // ... Parsing happens here
        
        // .. Unless an error is thrown
        throw ParseRecipeError.noRecipeDetected
    }
    
}

let html = "" // We can obtain html from a source
let recipeExtractor = RecipeExtractor(html: html)

do {
    let recipe = try recipeExtractor.extractRecipe()
    print(recipe)
} catch  {
    ErrorHandler.default.handleError(error)
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
