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

class StreamReader: Stream {
    
    func read() {
        // Left empty for example purposes.
    }
    
}

// Both designated and convenience initializers are available to the subclass.
let readerA = StreamReader(bufferSize: 10, offset: 10)
let readerB = StreamReader(bufferSize: 512)
let readerC = StreamReader(offset: 256)
