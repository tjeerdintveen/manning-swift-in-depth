protocol Streamable {
    init(bufferSize: Int, offset: Int)
}

class Stream: Streamable {
    
    let bufferSize: Int
    let offset: Int
    
    required init(bufferSize: Int, offset: Int) {
        self.bufferSize = 2048
        self.offset = offset
    }
    
}

let stream = Stream(bufferSize: 20, offset: 100)
