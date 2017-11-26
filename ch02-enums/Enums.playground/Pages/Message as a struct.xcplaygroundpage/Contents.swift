//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Message as a struct

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

let joinMessage = Message(userId: "2",
                          contents: nil,
                          date: Date(),
                          hasJoined: true, // We set the joined boolean
    hasLeft: false,
    isBeingDrafted: false,
    isSendingBalloons: false)


let textMessage = Message(userId: "1",
                          contents: "Hey everyone!", // We pass a message
    date: Date(),
    hasJoined: false,
    hasLeft: false,
    isBeingDrafted: false,
    isSendingBalloons: false)

// chatroom.sendMessage(joinMessage)
// chatroom.sendMessage(textMessage)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

