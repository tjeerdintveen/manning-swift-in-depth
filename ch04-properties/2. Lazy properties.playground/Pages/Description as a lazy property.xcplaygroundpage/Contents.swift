//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: ## The Movie type with a lazy description

struct Movie {
    let title: String
    let releaseDate: Date
    let ratings: [Float]
    
    init(title: String, releaseDate: Date, ratings: [Float]) {
        self.title = title
        self.releaseDate = releaseDate
        self.ratings = ratings
    }
    
    lazy var description: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: releaseDate)
        
        print("The description is being set")
        return title + " released at " + dateString
    }()
    
    func calculateAverageRating() -> Float {
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

//: ## Creating a movie

var homeAloneDateComponents = DateComponents()
homeAloneDateComponents.day = 16
homeAloneDateComponents.month = 10
homeAloneDateComponents.year = 1990
if let date = Calendar.current.date(from: homeAloneDateComponents) {
    var homeAlone = Movie(title: "Home Alone", releaseDate: date, ratings: [3.4, 3.2, 3.5, 4.2, 1.6, 2.4, 4.8])
    print(homeAlone.description)
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

