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
    
    // Now the overriden initializer is a convenience initializer.
    convenience override init(bufferSize: Int, offset: Int) {
        // Note how it doesn't call super anymore.
        self.init(filePath: "./")
    }
    
}

class AudioStream: FileStream {
    
    enum Encoding {
        case mpeg4
        case flac
        case alac
        case unknown
    }
    
    let encoding: Encoding
    
    init(encoding: Encoding, filePath: String) {
        self.encoding = encoding
        super.init(filePath: filePath)
    }
    
    // Overrides FileStream's initializer.
    override init(filePath: String) {
        self.encoding = .unknown
        super.init(filePath: filePath)
    }
    
}

let audiostreamA = AudioStream(encoding: .flac, filePath: "song.flac")

// All the inherited initializers work as well!
let audiostreamB = AudioStream(filePath: "song.flac")
let audiostreamC = AudioStream(bufferSize: 256)
let audiostreamD = AudioStream(offset: 128)
let audiostreamE = AudioStream(bufferSize: 256, offset: 128)


