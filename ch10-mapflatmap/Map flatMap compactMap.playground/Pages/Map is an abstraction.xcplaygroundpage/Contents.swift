//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation


/// Removed emoji from a string
///
/// - Parameter string: a target string to filter emoji's from
/// - Returns: The string without emoji's
func removeEmojis(_ string: String) -> String {
     var scalars = string.unicodeScalars
     scalars.removeAll(where: { $0.properties.isEmoji })
     return String(scalars)
}
//: Map works on multiple types

let omgBabies: String? = "❤️ OMG Cute ⭐️⭐️babypics⭐️⭐️! 😍❤️🍼👶"
print(omgBabies.map(removeEmojis)) // Optional(" OMG Cute babypics! ")

let food = ["Favorite Meal": "🍕 Pizza", "Favorite Drink": "☕️ Coffee"]
print(food.mapValues(removeEmojis)) // ["Favorite Meal": " Pizza", "Favorite Drink": " Coffee"]

let set: Set<String> = ["Great job 👍🏻", "Excellent 🙌"]
print(set.map(removeEmojis)) // ["Great job ", "Great job "]

//    let
//.mapValues(removeEmojis)
//[1000: "Some value"].mapValues(removeEmojis)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
