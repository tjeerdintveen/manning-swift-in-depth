//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Higher order functions

import Foundation
//
func a() throws {}

func b() throws {}

func c() throws {}

func firstLevel() throws {
    try a()
    try b()
    try c()
}

func secondLevel() throws {
    try preconditionFailure(firstLevel())
}

//
//
//func thirdlevel() {
//    do {
//        try secondLevel()
//    } catch {
//        print(error)
//    }
//}
//

struct SomeError: Error {
//    let row: Int
//    let column: Int
}

func throwing() throws {
    throw SomeError()
}

do {
    try throwing()
} catch {
    print(error)
}
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
