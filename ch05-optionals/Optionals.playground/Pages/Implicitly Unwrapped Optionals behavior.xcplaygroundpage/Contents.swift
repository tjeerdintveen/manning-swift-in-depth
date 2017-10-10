//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Implicitly Unwrapped Optionals behavior

//: IUO changes on context
//let x: Int! = 3
//let y = x // Optional(3)
//let z = x + 2 // 5, z is not an optional
//
//: Explicitly adding a type
//
//let x: Int! = 3
//let y: Int = x // 3
//
//: Using the as keyword
//
//let x: Int! = 3
//let y = x as Int
//
//: Force unwrap
//
//let x: Int! = 3
//let y = x!
//
//
//: Rebinding an IUO
//
//let x: Int! = 3
//let y = x // Optional(3)

//: Using a guard

func usingAGuard() {
    let x: Int! = 3
    guard let y = x else {
        return
    }
    print(y)
}



//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
