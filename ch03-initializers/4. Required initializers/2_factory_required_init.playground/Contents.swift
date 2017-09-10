class Stream {
    
    let bufferSize: Int
    let offset: Int
    
    required init(bufferSize: Int, offset: Int) {
        self.bufferSize = bufferSize
        self.offset = offset
    }
    
    class func makeStream() -> Self {
        return self.init(bufferSize: 2048, offset: 0)
    }
    
}

// We can now create a stream with the makeStream function
let stream = Stream.makeStream()

