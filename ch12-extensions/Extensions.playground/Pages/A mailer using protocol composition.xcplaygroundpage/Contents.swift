//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # A mailer using protocol composition

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
        // Connect to server
        // Submit email
    }
}

protocol MailValidator {
    func validate(email: Email) throws
}

extension MailValidator {
    func validate(email: Email) throws {
        // Check email address, and if subject is missing.
    }
}

extension MailValidator where Self: Mailer {
    func send(email: Email) throws {
        try validate(email: email)
        // Connect to server
        // Submit email
        print("Email validated and sent.")
    }
    
    //: We can add bonus methods.
    //: E.g. a delayed email which we need to validate beforehand.
    func send(email: Email, at: Date) throws {
        try validate(email: email)
        // Connect to server
        // Add email to delayed queued.
        print("Email validated and stored.")
    }
}

//: Now, SMTPClient gets a validating send method.
//: The downside is that SMTPClient needs to adhere to two protocols.
struct SMTPClient: Mailer, MailValidator {
    
}

let client = SMTPClient()
let email = Email(subject: "Learn Swift",
      body: "Lorem ipsum",
      to: [MailAdress(value: "john@appleseed.com")],
      from: MailAdress(value: "stranger@somewhere.com"))

try? client.send(email: email) // Email validated and sent.

//: We also can get bonus methods that only unlock once a type adheres to both Mailer and MailValidator
try? client.send(email: email, at: Date(timeIntervalSinceNow: 3600)) // Email validated and queued.

func submitEmail<T>(sender: T, email: Email) where T: Mailer, T: MailValidator {
    try? sender.send(email: email, at: Date(timeIntervalSinceNow: 3600))
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
