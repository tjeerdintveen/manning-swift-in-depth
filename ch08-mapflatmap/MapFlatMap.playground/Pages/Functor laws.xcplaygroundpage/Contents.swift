//: [Previous](@previous)

import Foundation


let value: Int? = 10

value.map { $0 } == value

func double(_ int: Int) -> Int {
    return int + int
}

func addFour(_ int: Int) -> Int {
    return int + 4
}

value.map { addFour(double($0)) } == value.map(double).map(addFour)

//functor.map({ $0 }) == functor
//
//Optional("Hello").map { $0 } == Optional("Hello")
//
//and the law for compositionality
//
//    functor.map({ f2(f1($0)) }) == functor.map(f1).map(f2)


//: [Next](@next)
