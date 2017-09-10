class Stream {
    
    let bufferSize: Int
    let offset: Int
    
    // Designated initializer.
    init(bufferSize: Int, offset: Int) {
        self.bufferSize = bufferSize
        self.offset = offset
    }
    
    // Convenience initializers.
    convenience init(bufferSize: Int) {
        self.init(bufferSize: bufferSize, offset: 0)
    }
    
    convenience init(offset: Int) {
        self.init(bufferSize: 2048, offset: offset)
    }
    
}

class FileStream: Stream {
    
    var filePath: String
    init(filePath: String) {
        self.filePath = filePath
        super.init(bufferSize: 2048, offset: 0)
    }
    
    // We override the designated initializer from Stream
    override init(bufferSize: Int, offset: Int) {
        self.filePath = "./"
        super.init(bufferSize: bufferSize, offset: offset)
    }
    
}

let fileStream = FileStream(filePath: "flapjacks.txt")

// Now Stream's initializers work on FileStream

let streamA = FileStream(bufferSize: 10, offset: 10)
let streamB = FileStream(bufferSize: 512)
let streamC = FileStream(offset: 256)

