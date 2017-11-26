//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # An invalid Message

import Foundation

struct Message {
    let userId: String
    let contents: String?
    let date: Date
    
    let hasJoined: Bool
    let hasLeft: Bool
    
    let isBeingDrafted: Bool
    let isSendingBalloons: Bool
}

//: This message has invalid state. Can't have both "hasJoined" and "hasLeft".

let brokenMessage = Message(userId: "2",
                            contents: "Hi there", // We have text to show
    date: Date(),
    hasJoined: true, // But this message also signals a joining state
    hasLeft: true, // ... and a leaving state
    isBeingDrafted: false,
    isSendingBalloons: false)

// chatroom.sendMessage(brokenMessage)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
