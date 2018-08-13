//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Exercises and answers

//: 1. Create a function that turns an array into a nested array, make sure to use the `map` function.

func makeSubArrays<T>(_ arr: [T]) -> [[T]] {
    return arr.map { [$0] }
}

makeSubArrays(["a","b","c"]) // [[a], [b], [c]]
makeSubArrays([100,50,1]) // [[100], [50], [1]]

//: 2. Create a function that transforms the values inside a dictionary for movies. Each rating, from 1 to 5, needs to be turned into a human readable format.

// E.g.
// A rating of 1.2 is "Very low", a rating of 3 is "Average", a rating of 4.5 is "Excellent".

func transformRating<T>(_ dict: [T: Float]) -> [T: String] {
    return dict.mapValues { (rating) -> String in
        switch rating {
        case ..<1: return "Very weak"
        case ..<2: return "Weak"
        case ..<3: return "Average"
        case ..<4: return "Good"
        case ..<5: return "Excellent"
        default: fatalError("Unknown rating")
        }
    }
}

let moviesAndRatings: [String : Float] = ["Home Alone 4" : 1.2, "Who framed Roger Rabbit?" : 4.6, "Star Wars: The Phantom Menace" : 2.2, "The Shawshank Redemption" : 4.9]
let moviesHumanRadable = transformRating(moviesAndRatings)
print(moviesHumanRadable) // ["Home Alone 4": "Weak", "Star Wars: The Phantom Menace": "Average", "Who framed Roger Rabbit?": "Excellent", "The Shawshank Redemption": "Excellent"]

//: 3. Still looking at the movies and ratings, convert the dictionary into a single description per movie with the rating appended to the title.

let movies: [String : Float] = ["Home Alone 4" : 1.2, "Who framed Roger Rabbit?" : 4.6, "Star Wars: The Phantom Menace" : 2.2, "The Shawshank Redemption" : 4.9]

func convertRating(_ rating: Float) -> String {
    switch rating {
    case ..<1: return "Very weak"
    case ..<2: return "Weak"
    case ..<3: return "Average"
    case ..<4: return "Good"
    case ..<5: return "Excellent"
    default: fatalError("Unknown rating")
    }
}

let movieDescriptions = movies.map { (tuple) in
    return "\(tuple.key) (\(convertRating(tuple.value)))"
}

print(movieDescriptions) // ["Home Alone 4 (Weak)", "Star Wars: The Phantom Menace (Average)", "Who framed Roger Rabbit? (Excellent)", "The Shawshank Redemption (Excellent)"]

//: 4. Generate an array of the letters "a", "b", "c" 10 times. The end result should be ["a", "b", "c", "a", "b", "c", "a" ... etc. The array should be 30 elements long. See if you can solve this with a map operation on some kind of iterator.

let values = (0..<30).map { (int: Int) -> String in
    switch int % 3 {
    case 0: return "a"
    case 1: return "b"
    case 2: return "c"
    default: fatalError("Not allowed to come here")
    }
}

print(values)

//: 5. Given a contact data dictionary, the following code gets the street and city from the data and cleans up the strings. See if you can reduce the boilerplate, be sure to use map somewhere.

let contact =
    ["address":
        
        [
            "zipcode": "12345",
            "street": "broadway",
            "city": "wichita"
        ]
        
]

func capitalizedAndTrimmed(_ string: String) -> String {
    return string.trimmingCharacters(in: .whitespaces).capitalized
}

var capitalizedStreet: String? = nil
var capitalizedCity: String? = nil

if let address = contact["address"] {
    if let street = address["street"] {
        capitalizedStreet = capitalizedAndTrimmed(street.capitalized)
    }
    if let city = address["city"] {
        capitalizedCity = capitalizedAndTrimmed(city.capitalized)
    }
}

print(capitalizedStreet) // Broadway
print(capitalizedCity) // Wichita

//: Cleaned up:
let someStreet = contact["address"]?["street"].map(capitalizedAndTrimmed)
let someCity = contact["address"]?["city"].map(capitalizedAndTrimmed)

// 6. Create a function that turns an array of integers into an array with a value subtracted and added for each integer.
//: For instance [20, 30, 40] will be turned into [19, 20, 21, 29, 30, 31, 39, 40, 41]
//: Try to solve it with the help of map or flatMap.

func buildList(_ values: [Int]) -> [Int] {
    return values.flatMap {
        [$0 - 1, $0, $0 + 1]
    }
}

print(buildList([20,30,40]))

// 7. Generate values from 0 to 100, with only even numbers. But be sure to skip every factor of ten. Such as 10, 20, etc. You would end up with [2, 4, 6, 8, 12, 14, 16, 18, 22 ... etc
// See if you can solve it with the help of map or flatMap.

let strideSequence = stride(from: 0, through: 30, by: 2).flatMap { int in
    return int % 10 == 0 ? nil : int
}
print(strideSequence)

//: 8. Create a function that removes all vowels from a string. Again, see if you can solve it with map or flatMap.

func removeVowels(_ string: String) -> String {
    let characters = string.flatMap { char -> Character? in
        switch char {
        case "e", "u", "i", "o", "a": return nil
        default: return char
        }
    }
    
    return String(characters)
}

removeVowels("Hi there!") // H thr!

//: 9. Given an array of tuples, create an array with tuples of all possible tuple pairs of these values, e.g. [1,2] gets turned into [(1, 1), (1, 2), (2, 1), (2, 2)]. Again, see if you can do it with the help from map and/or flatMap.

func pairValues(_ values: [Int]) -> [(Int, Int)] {
    return values.flatMap { lhs in
        values.map { rhs -> (Int, Int) in
            return (lhs, rhs)
        }
    }
}

print(pairValues([1,2]))

//: 10. Write a function that duplicates each value inside an array. See if you can use map or flatMap for this.
//: E.g., [1,2,3] turns into [1, 1, 2, 2, 3, 3] and [["a", "b"],["c", "d"]], turns into [["a", "b"], ["a", "b"], ["c", "d"], ["c", "d"]]

func double<T>(_ values: [T]) -> [T] {
    return values.flatMap { [$0, $0] }
}

print(double([1,2,3]))
print(double([["a", "b"], ["c", "d"]]))

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
