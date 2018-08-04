//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Algebraic data types

import Foundation

enum Day {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

enum Age {
    case known(UInt8)
    case unknown
}

struct BooleanContainer {
    let first: Bool
    let second: Bool
}

BooleanContainer(first: true, second: true)
BooleanContainer(first: true, second: false)
BooleanContainer(first: false, second: true)
BooleanContainer(first: false, second: false)

enum PaymentType {
    case invoice
    case creditcard
    case cash
}
struct PaymentStatus {
    let paymentDate: Date?
    let isRecurring: Bool
    let paymentType: PaymentType
}
//
//// Alternatively, the enum and struct can be turned into a single struct.
//enum PaymentStatus {
//    case invoice(paymentDate: Date?, isRecurring: Bool)
//    case creditcard(paymentDate: Date?, isRecurring: Bool)
//    case cash(paymentDate: Date?, isRecurring: Bool)
//}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
