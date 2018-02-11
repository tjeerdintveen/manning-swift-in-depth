//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Granular unwrapping


struct Customer {
    let id: String
    let email: String
    let firstName: String?
    let lastName: String?
    let balance: Int
    
    var displayName: String? {
        switch (firstName, lastName) {
        case let (first?, last?): return first + " " + last
        case let (first?, nil): return first
        case let (nil, last?): return last
        default: return nil
        }
    }
    
}

func createConfirmationMessage(name: String, product: String) -> String {
    return """
    Dear \(name),
    Thank you for ordering the \(product)"
    Your order will be delivered tomorrow.
    
    Kind regards,
    The Mayonnaise depot.
    """
}

let customer = Customer(id: "30", email: "famthompson@gmail.com", firstName: nil, lastName: "Thompson", balance: 300)

if let displayName = customer.displayName {
    createConfirmationMessage(name: displayName, product: "Economy size party tub!")
} else {
    createConfirmationMessage(name: "customer", product: "Economy size party tub!")
}


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)


