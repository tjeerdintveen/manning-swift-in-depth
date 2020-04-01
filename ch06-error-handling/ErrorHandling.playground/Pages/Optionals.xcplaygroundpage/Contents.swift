//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Optionals

import Foundation
import PlaygroundSupport
import UIKit

//: Instead of throwing an error, we can return an optional

func loadFile(name: String) -> Data? {
    let url = playgroundSharedDataDirectory.appendingPathComponent(name)
    return try? Data(contentsOf: url)
}


@discardableResult func storeData(image: UIImage, url: URL) -> Bool {
    guard let data = image.pngData() else {
        return false
    }
    
    do {
        try data.write(to: url)
        return true
    } catch {
        return false
    }
}

let image = UIImage()
let url = playgroundSharedDataDirectory.appendingPathComponent("image")
storeData(image: image, url: url)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
