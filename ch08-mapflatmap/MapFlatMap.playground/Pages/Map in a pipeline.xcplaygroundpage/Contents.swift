//: [Previous](@previous)

import Foundation

//func transform(_ languages: String) -> [String] {
//    let list =
//        languages
//            .split(separator: ",")
//            .filter { $0 != "electron" }
//            .map { $0.capitalized }
//            .sorted()
//
//    return list
//}

func transform(_ languages: String) -> [String] {
    var elements = [String]()
    for element in languages.split(separator: ",") where element != "electron" {
        elements.append(element.capitalized)
    }
    
    return elements.sorted()
}

let list = transform("swift,kotlin,go,python,rust,electron")
print(list) // ["Go", "Python", "Rust", "Swift"]

