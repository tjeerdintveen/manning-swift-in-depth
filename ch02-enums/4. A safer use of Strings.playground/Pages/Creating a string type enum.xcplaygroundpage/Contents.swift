//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
enum ImageType: String {
    case jpg
    case bmp
    case gif
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "jpg", "jpeg": self = .jpg
        case "bmp", "bitmap": self = .bmp
        case "gif", "gifv": self = .gif
        default: return nil
        }
    }
    
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
logMetadata(for: "jpeg") // "Received jpg"
logMetadata(for: "JPG") // "Received a jpg"
logMetadata(for: "JPEG") // "Received a jpg"
logMetadata(for: "gif") // "Received a gif"

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
