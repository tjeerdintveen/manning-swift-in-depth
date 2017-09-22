//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

enum ImageType: String {
    case jpg
    case bmp
    case gif
}

func logMetadata(for imageType: String) {
    // Creating the enum
    guard let type = ImageType(rawValue: imageType) else {
        print("imagetype unknown")
        return
    }
    switch type {
    case .jpg: print("Received a jpg")
    case .bmp: print("Received a bmp")
    case .gif: print("Received a gif")
    }
}

logMetadata(for: "jpg") // "Received jpg"

logMetadata(for: "JPG") // Bug: imagetype unknown

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
