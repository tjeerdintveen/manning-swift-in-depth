//: [Previous](@previous)

import Foundation

let stringsArr = [["I", "just"], ["want", "to"], ["learn", "about"], ["protocols"]]
let flattenedArray = stringsArr.flatMap { $0 }
print(flattenedArray) // ["I", "just", "want", "to", "learn", "about", "protocols"]

let counts = stringsArr.flatMap { $0.map { $0.count } }

print(counts) // [1, 4, 4, 2, 5, 5, 9]

//let result = [[0,1], [2,2]].map { [$0, $0] }
// map // [[[0, 1], [0, 1]], [[2, 2], [2, 2]]]
let result = [[0,1], [2,2]].flatMap { [$0, $0] }
print(result)

let notnestedresult = [0,1, 2, 3].flatMap { [$0, $0] }
print(notnestedresult) // [0, 0, 1, 1, 2, 2, 3, 3]

let notnestedresultmap = [0,1, 2, 3].map { [$0, $0] }
print(notnestedresultmap) // [[0, 0], [1, 1], [2, 2], [3, 3]]




extension String {
    func interspersed(_ element: Character) -> String {
        let characters = self.flatMap { (char: Character) -> [Character] in
            return [char, element]
            }.dropLast()
        
        return String(characters)
    }
}

"Swift".interspersed("-") // S-w-i-f-t

//extension String {
//    func interspersed(_ element: Character) -> String {
//        let characters = self.flatMap { return [$0, element] }.dropLast()
//        return String(characters)
//    }
//}



"abcdef".replaceTokens(token: "a", args: ["-","+"])

func intersperse(_ string: String, element: Character) -> String {
    
//    let newlist = transformedChars.append(string[lastIndex])
//    print(newlist)
    
//    let characters = string.enumerated().flatMap { (tuple) -> [Character] in
//        if tuple.offset == 0 {
//            return [tuple.element]
//        } else {
//            return [element, tuple.element]
//        }
//    }

    let characters = string.flatMap { return [$0, element] }.dropLast()
    return String(characters)
}

let interspersedString = intersperse("Swift", element: "-")
print(interspersedString) // S-w-i-f-t


let integers = ["1", "OMG SHOES", "3"].flatMap(Int.init)
print(integers) // [1, 3]

let nullableIntegers: [Int?] = ["1", "OMG SHOES", "3"].map(Int.init)
for case let number? in nullableIntegers {
    print("The number is \(number)")
}
// The number is 1
// The number is 3



//let result = "Hi there".flatMap { (char: Character) -> [Character] in
//    return [char, char]
//}
//
//
//let first = "Hi there".dropFirst()
//
////let result =
////    "Hi there"
////        .flatMap { (char: Character) -> [Character] in
////            return ["-", char]
////        }.dropFirst()
////result
//
////func intersperse(_ string: String, element: Character) -> String {
////    let characters = "Hi there".flatMap { (char: Character) -> [Character] in
////        return [char, element]
////        }.dropLast()
////
////    return String(characters)
////}
//
//func intersperse(_ string: String, element: Character) -> String {
//    let characters = "Hi there".flatMap { [$0, element]}.dropLast()
//    return String(characters)
//}
//
//intersperse("Hi there", element: "*")
//
//
//
//let resultdf = "".dropFirst()
////String(result)
//
//
//func safeOffset(_ string: String) -> String? {
//
//    return nil
//}
//
////
////if let str = somethingString("Hello") {
////    if let str = somethingString(str) {
////        if let str = somethingString(str) {
////            print(str)
////        }
////    }
////}
//
//let indexes = "abc".map { (char)  in
//    return "abc".index(of: char)
//}
//print(indexes)
//
//let charIndex = "abc".index(of: "c")!
//let index = "abc".index(after: charIndex)
//
//
//
//extension String {
//    subscript (safe index: Index) -> Character? {
//        return indices.contains(index) ? self[index] : nil
//    }
//
//    func after(char: Character) -> Character? {
//        guard let targetIndex = self.index(of: char) else {
//            return nil
//        }
//
//        let nextIndex = index(after: targetIndex)
//        if indices.contains(nextIndex) {
//            return self[nextIndex]
//        } else {
//            return nil
//        }
//    }
//}
//
//
//let target = "ABCDEF"
//
//if let next = target.after(char: "A") {
//    if let next = target.after(char: next) {
//        if let next = target.after(char: next) {
//            print(next)
//        }
//    }
//}
//
//let nextChar =
//    target
//        .after(char: "A")
//        .flatMap { target.after(char: $0) }
//        .flatMap { target.after(char: $0) }
//        .flatMap { target.after(char: $0) }
//        .flatMap { target.after(char: $0) }
//
//print(nextChar) // Optional("F")
//
//if let nextChar = nextChar {
//    print(nextChar)
//}
//
//struct PartialStringResult<T> {
//    let result: T
//    let remains: String
//
//    func flatMap<U>(_ transform: (T) -> PartialStringResult<U>) -> PartialStringResult<U> {
//        return transform(result)
//    }
//}
//
//func parse(_ str: String) -> PartialStringResult<Int> {
//    return PartialStringResult(result: 300, remains: String(str.dropFirst()))
//}
//
//let partial = parse("ABCDEF")
//let newPartial = parse(partial.remains)
//let finalpartial = parse(partial.remains)
//
//func parseAgain(_ str: String) -> PartialStringResult<Bool> {
//    return PartialStringResult(result: true, remains: str)
//}
//
//let firstResult = parse("ABCDEF")
//
//firstResult.flatMap { (int) -> PartialStringResult<Int> in
//    let newResult = parse("abc")
//
//}

//parse("ABCDEF").flatMap { (result: PartialStringResult<Int>) -> PartialStringResult<Bool> in
//    parseAgain(result.remains).flatMap({ (boolType) -> PartialStringResult<Bool> in
//        let res = parseAgain(boolType.remains)
//        print("Allresults are \(result.result), \(boolType.result), \(res.result)")
//
//        return res
//    })
//}

//if let index = "abc".index(of: "c") {
//
//}

//
//print("tesT " + result)



//: [Next](@next)

//let strings = [“a”,”b”,”c”]



//let result = "STRING IS:" + strings.flatMap { $0 } // STRING IS:abc
//print(result)
//let secondResult = strings.flatMap { $0 } // [“a”, “b” , “c”]
//print(secondResult) // Type is [String.Element]


//“THISWORKS, two steps” + secondResult // ABCabc

//let doesntwork = “STRING “ + strings

// Explicit elements is what flatMap returns.
// String typealias Element = Character
//let stringElements: [String.Element] = [“a”,”b”]

//“WORKS TOO: “ + stringElements // WORKS TOO: ab

