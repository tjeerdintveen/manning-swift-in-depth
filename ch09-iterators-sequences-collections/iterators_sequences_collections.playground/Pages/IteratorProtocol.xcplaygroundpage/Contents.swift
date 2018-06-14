//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # IteratorProtocol

let cheeses = ["Gouda", "Camembert", "Brie"]

for cheese in cheeses {
    print(cheese)
}

var cheeseIterator = cheeses.makeIterator()

while let cheese = cheeseIterator.next() {
    print(cheese)
}

// Prints:
//"Gouda"
//"Camembert"
//"Brie"

//
//for element in values {
//    // do something with character
//}

// Under the hood

// Taking a closer look at iterator

let groceries = ["Flour", "Eggs", "Sugar"]
var groceriesIterator: IndexingIterator<[String]> = groceries.makeIterator()
print(groceriesIterator.next()) // Optional("Flour")
print(groceriesIterator.next()) // Optional("Eggs")
print(groceriesIterator.next()) // Optional("Sugar")
print(groceriesIterator.next()) // nil
print(groceriesIterator.next()) // nil

//print(iterator.next()) // Optional("a")
//print(iterator.next()) // Optional("b")
//print(iterator.next()) // Optional("c")
//print(iterator.next()) // nil
//print(iterator.next()) // nil
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
