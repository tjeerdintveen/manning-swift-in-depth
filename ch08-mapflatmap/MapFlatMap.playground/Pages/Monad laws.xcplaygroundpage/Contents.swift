//: [Previous](@previous)

import Foundation

//val a = 30
//val lhs = Option(a).flatMap(f)
//    => Some(60)
//
//val rhs = f(a)
//    => Some(60)
//
//lhs == rhs
//    => true

func half(_ int: Int) -> Int? { // Only half even numbers
    guard int % 2 == 0 else { return nil }
    return int / 2
}
//func double(_ value: Int) -> Int {
//    return value + value
//}


//: Left identity
//
//let value = 40
//let lhs = Optional(value).flatMap(half)
//let rhs = half(value)
//lhs == rhs // true

//: Right identity

//let value: Int? = 40
//let lhs = value.flatMap { Optional($0) }
//print(lhs) // Optional(20)
//let rhs = value
//print(rhs) // Optional(20)
//lhs == rhs

//val m = Option(30)
//
//val lhs = m.flatMap(Option(_))
//    => Some(30)
//
//val rhs = m
//    => Some(30)
//
//lhs == rhs
//    => true
//

// Associativity

let value = Optional(40)
let lhs = value.flatMap(half).flatMap(half)
let rhs = value.flatMap { int in half(int).flatMap(half) }
lhs == rhs // true
print(rhs) // Optional(10)


import UIKit

let string = "abc"
let results = string.flatMap { a -> [(Character, Character)] in
    string.flatMap { b -> [(Character, Character)] in
        if a == b {
            return []
        } else {
            return [(a, b)]
        }
    }
}
print(results) // [("a", "b"), ("a", "c"), ("b", "a"), ("b", "c"), ("c", "a"), ("c", "b")]

let repeated = [2, 3].flatMap { (value: Int) -> [Int] in
    return [value, value]
}

let str = stride(from: 0, to: 100, by: 2)

print(repeated) // [2, 2, 3, 3]

//: [Next](@next)
