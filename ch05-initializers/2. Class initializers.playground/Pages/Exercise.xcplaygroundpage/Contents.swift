//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
//: # Exercises
// Given these classes:
class Device {
    
    var serialNumber: String
    var room: String
    
    init(serialNumber: String, room: String) {
        self.serialNumber = serialNumber
        self.room = room
    }
    
    convenience init() {
        self.init(serialNumber: "Unknown", room: "Unknown")
    }
    
    convenience init(serialNumber: String) {
        self.init(serialNumber: serialNumber, room: "Unknown")
    }
    
    convenience init(room: String) {
        self.init(serialNumber: "Unknown", room: room)
    }
    
}

class Television: Device {
    enum ScreenType {
        case led
        case oled
        case lcd
        case unknown
    }
    
    enum Resolution {
        case ultraHd
        case fullHd
        case hd
        case sd
        case unknown
    }
    
    let resolution: Resolution
    let screenType: ScreenType
    
    init(resolution: Resolution, screenType: ScreenType, serialNumber: String, room: String) {
        self.resolution = resolution
        self.screenType = screenType
        super.init(serialNumber: serialNumber, room: room)
    }
    
}

//: Make the following line of code work by adding a single initializer somewhere.
let firstTelevision = Television(room: "Lobby")
let secondTelevision = Television(serialNumber: "abc")

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
