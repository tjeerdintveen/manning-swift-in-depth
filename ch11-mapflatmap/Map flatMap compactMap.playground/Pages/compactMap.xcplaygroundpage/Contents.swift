//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # compactMap


let wrongUrl = URL(string: "OMG SHOES")
print(wrongUrl) // nil
let properUrl = URL(string: "https://www.swift.org")
print(properUrl) // Optional(https://www.swift.org)

let strings = [
    "https://www.duckduckgo.com",
    "https://www.twitter.com",
    "OMG SHOES",
    "https://www.swift.org"
]

//: Notice how compactMap filters out "OMG SHOES", and no values are optional
//let optionalUrls = strings.map { URL(string: $0) }
//print(optionalUrls) // [Optional(https://www.duckduckgo.com), Optional(https://www.twitter.com), nil, Optional(https://www.swift.org)]
let urls = strings.compactMap(URL.init)
print(urls) // [https://www.duckduckgo.com, https://www.twitter.com, https://www.swift.org]

//: If you don't like compactMap, you can use a for loop

let optionalUrls: [URL?] = [
    URL(string: "https://www.duckduckgo.com"),
    URL(string: "Bananaphone"),
    URL(string: "https://www.twitter.com"),
    URL(string: "https://www.swift.org")
]
for case let url? in optionalUrls {
    print("The url is \(url)") // url is unwrapped here
}

//: flatMap can be either chained or nested.
func half(_ int: Int) -> Int? { // Only half even numbers
    guard int % 2 == 0 else { return nil }
    return int / 2
}

let value = Optional(40)
let lhs = value.flatMap(half).flatMap(half)
let rhs = value.flatMap { int in half(int).flatMap(half) }
lhs == rhs // true
print(rhs) // Optional(10)

//: You can nest flatMaps for special operations.

let string = "abc"
let results = string.flatMap { a -> [(Character, Character)] in
    string.compactMap { b -> (Character, Character)? in
        if a == b {
            return nil
        } else {
            return (a, b)
        }
    }
}
print(results) // [("a", "b"), ("a", "c"), ("b", "a"), ("b", "c"), ("c", "a"), ("c", "b")]

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
