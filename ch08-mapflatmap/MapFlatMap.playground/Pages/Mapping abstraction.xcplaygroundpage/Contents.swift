//: [Previous](@previous)

import Foundation

/// Detect if scalar is emoji
/// Based on unicode tables
/// https://apps.timwhitlock.info/emoji/tables/unicode
///
/// - Parameter scalar: The target unicode scalar
/// - Returns: true is unicode is in emoji range
func isEmoji(_ scalar: Unicode.Scalar) -> Bool {
    switch Int(scalar.value) {
    case 0x1F601...0x1F64F: return true // Emoticons
    case 0x1F600...0x1F636: return true // Additional emoticons
    case 0x2702...0x27B0: return true // Dingbats
    case 0x1F680...0x1F6C0: return true // Transport and map symbols
    case 0x1F681...0x1F6C5: return true // Additional transport and map symbols
    case 0x24C2...0x1F251: return true // Enclosed characters
    case 0x1F30D...0x1F567: return true // Other additional symbols
    default: return false
    }
}

/// Removed emoji from a string
///
/// - Parameter string: a target string to filter emoji's from
/// - Returns: The string without emoji's
func removeEmojis(_ string: String) -> String {
    let result: String.UnicodeScalarView = string.unicodeScalars.filter { !isEmoji($0) }
    return String(result)
}

let omgBabies: String? = "❤️ OMG Cute ⭐️⭐️babypics⭐️⭐️! 😍❤️🍼👶"
print(omgBabies.map(removeEmojis)) // Optional(" OMG Cute babypics! ")

let food = ["Favorite Meal": "🍕 Pizza", "Favorite Drink": "☕️ Coffee"]
print(food.mapValues(removeEmojis)) // ["Favorite Meal": " Pizza", "Favorite Drink": " Coffee"]

let set: Set<String> = ["Great job 👍🏻", "Excellent 🙌"]
print(set.map(removeEmojis)) // ["Great job ", "Great job "]

//    let
//.mapValues(removeEmojis)
//[1000: "Some value"].mapValues(removeEmojis)



//: [Next](@next)
