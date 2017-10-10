//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Clean optional unwrapping.

//: Introducing Customer
struct Customer {
    let id: String
    let email: String
    let firstName: String?
    let lastName: String?
    let balance: Int
}

//: Without syntactic sugar we'd write optionals as follows:
//struct Customer {
//    let id: String
//    let email: String
//    let firstName: Optional<String>
//    let lastName: Optional<String>
//}

let customer = Customer(id: "30", email: "mayolover@gmail.com", firstName: "Jake", lastName: "Freemason", balance: 300)

//: In general you would unwrap using if let.
if let firstName = customer.firstName {
    print("First name is \(firstName)")
}

//: Switch statements work too.
switch customer.firstName {
case .some(let name): print("First name is \(name)")
case .none: print("Customer didn't enter a first name")
}

switch customer.firstName {
case let name?: print("First name is \(name)")
case nil: print("Customer didn't enter a first name")
}

//: Variable shadowing

extension Customer: CustomStringConvertible {
    var description: String {
        var customDescription: String = "\(id), \(email)"
        
        if let firstName = firstName {
            customDescription += ", \(firstName)"
        }
        
        if let lastName = lastName {
            customDescription += " \(lastName)"
        }
        
        return customDescription
    }
}

print(customer)

//: Combine unwrapping:
if let firstName = customer.firstName, let lastName = customer.lastName {
    print("Friend's full name is \(firstName) \(lastName)")
}

//: ## Embellishing if let statements
//: If let statements can be combined with booleans:

if let firstName = customer.firstName, customer.balance > 0 {
    let welcomeMessage = "Dear \(firstName), you have money on your account, want to spend it on mayonnaise?"
}

//: If let statements can be combined with pattern matching:

if let firstName = customer.firstName, 4500..<5000 ~= customer.balance {
    let notification = "Dear \(firstName), you are getting close to afford our $50 tub!"
}

//: ## When you're not interested in a value

//: If we’re not interested in the unwrapped value, we can replace it with an underscore.
if
    let _ = customer.firstName,
    let _ = customer.lastName {
    print("The customer entered his full name")
}

//: We can use traditional nil checks
if
    customer.firstName != nil,
    customer.lastName != nil {
    print("The customer entered his full name")
}

//: We can perform actions when an optional is nil.
if customer.firstName == nil, customer.lastName == nil {
    print("The customer has supplied a name")
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
