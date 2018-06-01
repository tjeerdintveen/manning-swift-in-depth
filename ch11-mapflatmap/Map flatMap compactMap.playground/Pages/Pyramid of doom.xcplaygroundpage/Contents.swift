//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Pyramid of doom

func half(_ int: Int) -> Int? { // Only half even numbers
    guard int % 2 == 0 else { return nil }
    return int / 2
}
print(half(4)) // Optional(2)
print(half(5)) // nil

var value: Int? = nil
let startValue = 80

//: We can continuously unwrap optional operations, ending up with a pyramid of domo.

if let halvedValue = half(startValue) {
    print(halvedValue) // 40
    value = halvedValue
    
    if let halvedValue = half(halvedValue) {
        print(halvedValue) // 20
        value = halvedValue
        
        if let halvedValue = half(halvedValue) {
            print(halvedValue) // 10
            if let halvedValue = half(halvedValue) {
                value = halvedValue
            } else {
                value = nil
            }
            
        } else {
            value = nil
        }
    } else {
        value = nil
    }
}

print(value) // Optional(5)

//: A pyramid of doom can be prevented when stacking if let unwraps.

var endValue: Int? = nil

if
    let firstHalf = half(startValue),
    let secondHalf = half(firstHalf),
    let thirdHalf = half(secondHalf),
    let fourthHalf = half(thirdHalf) {
    endValue = fourthHalf
}
print(endValue) // Optional(5)

//: But, alternatively we can use flatMap, which is useful when we don't have clean one-liner functions to use in if-let statements. Also we don't have to bind new constants.

let endResult =
    half(startValue)
        .flatMap(half)
        .flatMap(half)
        .flatMap(half)

print(endResult) // Optional(5)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
