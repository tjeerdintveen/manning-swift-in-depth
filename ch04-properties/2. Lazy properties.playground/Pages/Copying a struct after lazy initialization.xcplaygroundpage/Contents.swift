//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: ## Copying a movie after lazy initialization

struct Movie {
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
    var homeAlone = Movie(title: "Home Alone", releaseDate: date, ratings: [])
    
/*:
 ## Copying a struct after lazy loading
     
Below we are first calling description on a movie (homeAlone), triggering the lazy loading.
     
Then a copy is being made, called homeAloneTwo.
     
If we trigger description again at the copy (homeAloneTwo), we'll see that description isn't lazily loaded.
     
We can see this because the print statement "The description is being set" is only called once.
     
Because the description is copied, it is wrong. homeAloneTwo has the description of homeAlone
 
 */
    
    // Notice how the description is only lazily loaded once
    print(homeAlone.description)
    
    var homeAloneTwo = homeAlone // A copy is being made
    homeAloneTwo.title = "Home Alone 2"
    print(homeAlone.title) // Home Alone
    print(homeAloneTwo.title) // Home Alone 2
    
    print(homeAloneTwo.description) // Wrong description
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)


