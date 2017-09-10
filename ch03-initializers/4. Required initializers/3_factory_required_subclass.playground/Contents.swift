// Won't compile, required keyword is missing!
class Stream {
    
    let bufferSize: Int
    let offset: Int
    
    required init(bufferSize: Int, offset: Int) {
        self.bufferSize = bufferSize
        self.offset = offset
    }
    
    // Added factory method.
    // This won't compile.
    class func makeStream() -> Self {
        return self.init(bufferSize: 2048, offset: 0)
    }
    
}

let stream = Stream.makeStream()

class FileStream: Stream {
    
    let filePath: String
    
    init(filePath: String) {
        self.filePath = filePath
        super.init(bufferSize: 2048, offset: 0)
    }
    
    required convenience override init(bufferSize: Int, offset: Int) {
        self.init(filePath: "./")
    }
    
}

let fileStream = FileStream.makeStream()

