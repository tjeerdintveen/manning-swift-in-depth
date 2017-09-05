import Foundation

enum Message {
    case contents(userId: String, contents: String, date: Date)
    case draft(userId: String, contents: String, date: Date)
    case hasJoined(userId: String, date: Date)
    case hasLeft(userId: String, date: Date)
    case balloon(userId: String, date: Date)
}

let textMessage = Message.contents(userId: "2", contents: "Bonjour!", date: Date())

let joinMessage = Message.hasJoined(userId: "2", date: Date())



func logMessage(message: Message) {
    switch message {
    case let .contents(userId: id, contents: contents, date: date):
        print("[\(date)] User \(id) sends message: \(contents)")
    case let .draft(userId: id, contents: contents, date: date):
        print("[\(date)] User \(id) is drafting a message: \(contents)")
    case let .hasJoined(userId: id, date: date):
        print("[\(date)] User \(id) has joined the chatroom")
    case let .hasLeft(userId: id, date: date):
        print("[\(date)] User \(id) has left the chatroom")
    case let .balloon(userId: id, date: date):
        print("[\(date)] User \(id) is sending balloons")
    }
}

logMessage(message: joinMessage) // User 2 has joined the chatroom
logMessage(message: textMessage) // User 2 sends message: Bonjour!



if case let Message.contents(_, contents: contents, _) = textMessage {
    print("Received: \(contents)") // Bonjour!
}


