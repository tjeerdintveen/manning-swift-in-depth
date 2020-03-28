//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation
import UIKit

//: # Mapping over optionals

//: Removing emojis from a string.

/// Removed emoji from a string
///
/// - Parameter string: a target string to filter emoji's from
/// - Returns: The string without emoji's
func removeEmojis(_ string: String) -> String {
     var scalars = string.unicodeScalars
     scalars.removeAll(where: { $0.properties.isEmoji })
     return String(scalars)
}

//: ## Cover without map

class Cover {
    let image: UIImage
    let title: String?

    init(image: UIImage, title: String?) {
        self.image = image

        var cleanedTitle: String? = nil
        if let title = title {
            cleanedTitle = removeEmojis(title)
        }
        self.title = cleanedTitle
    }
}

//: ## Cover with elaborate map

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

//: ## Cover with short map

//struct Cover {
//    let image: UIImage
//    let title: String?
//
//    init(image: UIImage, title: String?) {
//        self.image = image
//        self.title = title.map(removeEmojis)
//    }
//}

//: ## Cover with two mapping operations chained

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
let image = UIImage()
let cover = Cover(image: image, title: "❤️ OMG Cute ⭐️⭐️babypics⭐️⭐️! 😍❤️🍼👶")
print(cover.title) // Optional("OMG Cute babypics!")

print(removeEmojis("Hi💩😬🎉🐑🚙✋😇😴🚁🛀")) // "Hi"

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
