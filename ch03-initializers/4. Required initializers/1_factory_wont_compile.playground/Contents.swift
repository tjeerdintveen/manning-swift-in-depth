class Stream {
    
    let bufferSize: Int
    let offset: Int
    
    init(bufferSize: Int, offset: Int) {
        self.bufferSize = bufferSize
        self.offset = offset
    }
    
    // Added factory method.
    // This won't compile.
    class func makeStream() -> Self {
        return self.init(bufferSize: 2048, offset: 0)
    }
    
}
