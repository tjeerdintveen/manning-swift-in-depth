//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: ## Movie, initializer has a defer closure

struct Movie {
    var title: String {
        didSet {
            title = title.trimmingCharacters(in: .whitespaces)
        }
    }
    
    let releaseDate: Date
    let ratings: [Float]
    
    init(title: String, releaseDate: Date, ratings: [Float]) {
//: A defer closure is added.
        defer {
            self.title = title
        }
        self.title = title
        self.releaseDate = releaseDate
        self.ratings = ratings
    }
    
    lazy private(set) var description: String = {
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

var components = DateComponents()
components.day = 28
components.month = 9
components.year = 1985
if let date = Calendar.current.date(from: components) {
/*:
Notice how the title now is sanitized, from both the initializer or by setting the property.
*/
    var movie = Movie(title: "Beverly Hills Cop        ", releaseDate: date, ratings: [])
    print(movie.title) // "Beverly Hills Cop"
    movie.title = "Beverly Hills Cop         "
    print(movie.title) // "Beverly Hills Cop"
}
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)



