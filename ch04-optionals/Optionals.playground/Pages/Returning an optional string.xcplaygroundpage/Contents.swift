//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Returning an optional string

struct Customer {
    let id: String
    let email: String
    let firstName: String?
    let lastName: String?
    let balance: Int
    
    var displayName: String? {
        guard let firstName = firstName, let lastName = lastName else {
            return ""
        }
        return "\(firstName) \(lastName)"
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

let customer = Customer(id: "30", email: "mayolover@gmail.com", firstName: "Jake", lastName: "Freemason", balance: 300)

if let displayName = customer.displayName {
    createConfirmationMessage(name: displayName, product: "Economy size party tub!")
} else {
    createConfirmationMessage(name: "customer", product: "Economy size party tub!")
}
    

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

