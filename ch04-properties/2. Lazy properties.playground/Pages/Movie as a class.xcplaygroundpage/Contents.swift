//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: ## Movie as a class

class Movie {
    // title is now a var
    var title: String
    let releaseDate: Date
    let ratings: [Float]
    
    init(title: String, releaseDate: Date, ratings: [Float]) {
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

var homeAloneDateComponents = DateComponents()
homeAloneDateComponents.day = 16
homeAloneDateComponents.month = 10
homeAloneDateComponents.year = 1990
if let date = Calendar.current.date(from: homeAloneDateComponents) {
    
    
    /*:
     ## Copying a struct before lazy loading
     
     Below we are first calling creating a movie (homeAlone).
     Then a copy is being made, called homeAloneTwo.
     
     Now we trigger the lazily loading of both descriptions (of both movies), we'll see that description isn't lazily loaded.
     
     We can see this because the print statement "The description is being set" is only called once.
     
     */
    
    var homeAlone = Movie(title: "Home Alone", releaseDate: date, ratings: [])
    
    var reference = homeAlone // A copy is being made
    reference.title = "Home Alone 2"
    print(homeAlone.title) // Home Alone
    print(reference.title) // Home Alone 2
    
    /*:
     Notice how "The description is being set" is now called only once.
     Movie isn't copied but referenced.
     */
    
    print(homeAlone.description) // Home Alone 2 released at Oct 16, 1990
    print(reference.description) // Home Alone 2 released at Oct 16, 1990
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)


