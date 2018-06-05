//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Optional enums

enum Membership {
    /// 10% discount
    case gold
    /// 5% discount
    case silver
}

struct Customer {
    let id: String
    let email: String
    let firstName: String?
    let lastName: String?
    let balance: Int

    let membership: Membership?
    
    var displayName: String? {
        switch (firstName, lastName) {
        case let (first?, last?): return first + " " + last
        case let (first?, nil): return first
        case let (nil, last?): return last
        default: return nil
        }
    }
    
}

let customer = Customer(id: "30", email: "famthompson@gmail.com", firstName: nil, lastName: "Thompson", balance: 300,  membership: .gold)

if let membership = customer.membership {
    switch membership {
    case .gold: print("Customer gets 10% discount")
    case .silver: print("Customer gets 5% discount")
    }
} else {
    print("Customer pays regular price")
}

switch customer.membership {
case .gold?: print("Customer gets 10% discount")
case .silver?: print("Customer gets 5% discount")
case nil: print("Customer pays regular price")
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)



