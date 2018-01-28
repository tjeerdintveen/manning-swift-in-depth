//: [Previous](@previous)

import Foundation
import PlaygroundSupport

let firstElement = [1,2,3].first { $0 > 10}
print(firstElement) // nil


import UIKit


@discardableResult func storeData(image: UIImage, url: URL) -> Bool {
    guard let data = UIImagePNGRepresentation(image) else {
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




//: [Next](@next)
