//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # A mailer using protocol inheritance

import Foundation

struct MailAdress {
    let value: String
}

struct Email {
    let subject: String
    let body: String
    let to: [MailAdress]
    let from: MailAdress
}

protocol Mailer {
    func send(email: Email) throws
}

extension Mailer {
    func send(email: Email) throws {
        // Omitted: Connect to server
        // Omitted: Submit email
    }
}

protocol ValidatingMailer: Mailer {
    func send(email: Email) throws // Override send
    func validate(email: Email) throws
}

//: Now the send method is a throwing method that validates.
extension ValidatingMailer {
    func send(email: Email) throws {
        try validate(email: email)
        // Connect to server
        // Submit email
        print("Email validated and sent.")
    }
    
    func validate(email: Email) throws {
        // Check email address, and if subject is missing.
    }
}

struct SMTPClient: ValidatingMailer {
    // Implementation omitted.
}

let client = SMTPClient()

try? client.send(email: Email(subject: "Learn Swift",
                              body: "Lorem ipsum",
                              to: [MailAdress(value: "john@appleseed.com")],
                              from: MailAdress(value: "stranger@somewhere.com")))

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
