//: [Previous](@previous)

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
        case let .parseError(line: line, symbol: symbol): return "Parsing data failed at line: \(line) and symbol: \(symbol)"
        case .noIngredientsDetected: return "No ingredients were detected."
        case .noRecipeDetected: return "No recipe was detected."
        }
    }
    
    var failureReason: String? {
        switch self {
        case .parseError: return "The HTML file had unsuspected symbols"
        case .noIngredientsDetected: return "The recipe seemed to be missing its ingredients."
        case .noRecipeDetected: return "The recipe seemed to be missing."
        }
    }
    
    var recoverySuggestion: String? {
        return "Please try a different recipe."
    }

}

import UIKit

struct ErrorHandler {
    
    static let `default` = ErrorHandler()
    
    let genericMessage = "Sorry! Something went wrong"
    
    func handleError(error: Error) {
        presentToUser(message: genericMessage)
    }
    
    func handleError(error: LocalizedError) {
        if let errorDescription = error.errorDescription {
            presentToUser(message: errorDescription)
        } else {
            presentToUser(message: genericMessage)
        }
    }
    
    func handleError(error: NSError) {
        presentToUser(message: error.localizedDescription)
    }
    
    func presentToUser(message: String) {
        // Show alert dialog in iOS or OSX
        // ... snip
    }
    
}



// Removes the blabbing stories that people put in front of recipes and strips the actual recipe
struct RecipeExtractor {

    let html: String
    
    func extractRecipe() -> Recipe? {
        do {
            return try parseHTML(html)
        } catch let ParseRecipeError.parseError(line, symbol) {
            print("Parsing failed at line: \(line) and symbol: \(symbol)")
            let error = ParseRecipeError.parseError(line: line, symbol: symbol)
            ErrorHandler.default.handleError(error: error)
            return nil
        } catch {
            ErrorHandler.default.handleError(error: error)
            return nil
        }
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

//: [Next](@next)
