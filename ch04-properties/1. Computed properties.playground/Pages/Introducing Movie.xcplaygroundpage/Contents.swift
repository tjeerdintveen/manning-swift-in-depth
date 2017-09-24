//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: ## The Movie type

struct Movie {
    let title: String
    let releaseDate: Date
    let ratings: [Float]
    
    func daysTillRelease() -> Int {
        let days = Calendar.current
            .dateComponents([.day], from: Date(), to: releaseDate)
            .day
        
        if let days = days, days > 0 {
            return days
        } else {
            return 0
        }
    }
    
}

//: ## Creating a movie

var components = DateComponents()
components.day = 11
components.month = 6
components.year = 2019
if let date = Calendar.current.date(from: components) {
    let movie = Movie(title: "Sharknado 8", releaseDate: date, ratings: [])
    print(movie.daysTillRelease())
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
