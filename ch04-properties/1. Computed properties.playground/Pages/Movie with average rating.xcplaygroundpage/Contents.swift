//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: ## The Movie type

struct Movie {
    let title: String
    let releaseDate: Date
    let ratings: [Float]
    
    var averageRating: Float {
        let totalRating = ratings.reduce(0, +)
        return totalRating / Float(ratings.count)
    }
    
    var daysTillRelease: Int {
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

var components = DateComponents()
components.day = 11
components.month = 6
components.year = 2019
if let date = Calendar.current.date(from: components) {
    let movie = Movie(title: "Sharknado 8", releaseDate: date, ratings: [2.0, 3.0, 1.0])
    print(movie.averageRating) // 2.0
}

//: ## Introducing the highestAverage function

func highestAverage(movies: [Movie]) -> Movie {
    let sorted = movies.sorted { (lhs: Movie, rhs: Movie) -> Bool in
        lhs.averageRating > rhs.averageRating
    }
    
    return sorted[0]
}

//: ## Creating the movies

var homeAloneDateComponents = DateComponents()
homeAloneDateComponents.day = 16
homeAloneDateComponents.month = 10
homeAloneDateComponents.year = 1990
let homeAlone = Movie(title: "Home Alone", releaseDate: Calendar.current.date(from: homeAloneDateComponents)!, ratings: [3.4, 3.2, 3.5, 4.2, 1.6, 2.4, 4.8])

var homeAloneTwoDateComponents = DateComponents()
homeAloneTwoDateComponents.day = 20
homeAloneTwoDateComponents.month = 11
homeAloneTwoDateComponents.year = 1992
let homeAloneTwo = Movie(title: "Home Alone 2", releaseDate: Calendar.current.date(from: homeAloneTwoDateComponents)!, ratings: [1.2, 2.3, 3.4, 2.2, 3.7])

var homeAloneThreeDateComponents = DateComponents()
homeAloneThreeDateComponents.day = 12
homeAloneThreeDateComponents.month = 12
homeAloneThreeDateComponents.year = 1997
let homeAloneThree = Movie(title: "Home Alone 2", releaseDate: Calendar.current.date(from: homeAloneThreeDateComponents)!, ratings: [1.2, 1.1, 1.3, 1.1, 2.3, 2.5, 2.1, 2.0])

let movies = [homeAlone, homeAloneTwo, homeAloneThree]

//: ## Finding the highest rated movie

let highestRatedMovie = highestAverage(movies: movies)
print(highestRatedMovie) // Home Alone

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
