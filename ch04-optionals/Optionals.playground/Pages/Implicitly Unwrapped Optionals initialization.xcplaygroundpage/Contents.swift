//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

class ChatService {
    var isHealthy = true
    // Left empty for demonstration purposes.
}

class ProcessMonitor {
    
    class func start() -> ProcessMonitor {
        return ProcessMonitor()
    }
    
    var chatService: ChatService!

    func status() -> String {
        if chatService.isHealthy {
            return "Everything is up and running"
        } else {
            return "Chatservice is down!"
        }
    }
}

let processMonitor = ProcessMonitor.start()
//processMonitor.status() // fatal error: unexpectedly found nil

let chat = ChatService()

processMonitor.chatService = chat
processMonitor.status() // "Everything is up and running"

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
