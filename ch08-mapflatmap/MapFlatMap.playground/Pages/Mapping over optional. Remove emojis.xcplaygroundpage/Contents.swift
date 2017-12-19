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

import UIKit

//struct Cover {
//    let image: UIImage
//    let title: String?
//
//    init(image: UIImage, title: String?) {
//        self.image = image
//
//        var cleanedTitle: String? = nil
//        if let title = title {
//            cleanedDescription = removeEmojis(description)
//        }
//        self.title = cleanedTitle
//    }
//}

//struct Cover {
//    let image: UIImage
//    let title: String?
//
//    init(image: UIImage, title: String?) {
//        self.image = image
//
//        self.title = title.map { (string: String) -> String in
//            return removeEmojis(string)
//        }
//    }
//}

//struct Cover {
//    let image: UIImage
//    let title: String?
//
//    init(image: UIImage, title: String?) {
//        self.image = image
//        self.title = title.map(removeEmojis)
//    }
//}

//struct Cover {
//    let id: String
//    let image: UIImage
//    let title: String?
//
//    init(id: String, image: UIImage, title: String?) {
//        self.id = id
//        self.image = image
//
//        var cleanedTitle: String? = nil
//        if let title = title {
//            cleanedDescription = removeEmojis(description)
//        }
//        self.title = cleanedTitle
//    }
//}

//struct Cover {
//    let image: UIImage
//    let title: String?
//
//    init(image: UIImage, title: String?) {
//        self.image = image
//        self.title =
//            title
//                .map(removeEmojis)
//                .map { $0.trimmingCharacters(in: .whitespaces) }
//    }
//}
//
//let image = UIImage()
let cover = Cover(image: image, title: "❤️ OMG Cute ⭐️⭐️babypics⭐️⭐️! 😍❤️🍼👶")
print(cover.title) // Optional("OMG Cute babypics!")

print(removeEmojis("Hi💩😬🎉🐑🚙✋😇😴🚁🛀")) // "Hi"
