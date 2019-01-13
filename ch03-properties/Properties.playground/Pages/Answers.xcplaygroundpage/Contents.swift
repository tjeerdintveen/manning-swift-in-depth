//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Exercises computed properties

import Foundation

//: In this exercise we're modelling a music library. Think Apple Music or Spotify.

//: Decodable will be explained. For now all that is important is that it allows us to turn raw data (such as plist files) into songs
struct Song: Decodable {
    let duration: Int
    let track: String
    let year: Int
}

//: 1. See if you can clean up the Artist type by using lazy and/or computed properties.
struct Artist {
    
    var name: String
    var birthDate: Date
    let songsFileName: String
    
    init(name: String, birthDate: Date, songsFileName: String) {
        self.name = name
        self.birthDate = birthDate
        self.songsFileName = songsFileName
    }
    
    // Age is now computed (calculated each time)
    var age: Int? {
        let years = Calendar.current
            .dateComponents([.year], from: birthDate, to: Date())
            .year
        
        return years
    }
    
    // loadSongs() is now a lazy property, because it's expensive to load a file on each call.
    lazy private(set) var songs: [Song] = {
        guard
            let fileURL = Bundle.main.url(forResource: songsFileName, withExtension: "plist"),
            let data = try? Data(contentsOf: fileURL),
            let songs = try? PropertyListDecoder().decode([Song].self, from: data) else {
                return []
        }
        return songs
    }()
    
    mutating func songsReleasedAfter(year: Int) -> [Song] {
        return songs.filter { (song: Song) -> Bool in
            return song.year > year
        }
    }
    
}

var components = DateComponents()
components.day = 4
components.month = 7
components.year = 1938
var billWithers = Artist(name: "Bill Withers", birthDate: Calendar.current.date(from: components)!, songsFileName: "songs")
billWithers.age
let songs = billWithers.songs

//: 2. Assuming loadSongs is turned into a lazy property called "songs", make sure the following code doesn't break it by trying to override the property data
// billWithers.songs = []

//: This can be achieved by making "songs" a private(set) property.

//: 3. Assuming loadSongs is turned into a lazy property called "songs", how can you make sure that the following lines won't break the lazily loaded property? Point out two ways.
//billWithers.songs
//billWithers.songsFileName = "oldsongs"
//billWithers.songs.count // Should be 0 after renaming songsFileName, but is 2

//: The lazy property "songs" points to a var called songsFileName. To prevent mutation after lazily loading songs, we can make songsFileName a let property. Alternatively, we can make Artist a class to prevent this bug.


//: # Exercises property observers
import Foundation
//: 4. If you need a propery with both behavior and storage, what kind of property would you use?
//: A stored property with a property observer.

//: 5. If you need a property with only behavior and no storage, what kind of property would you use?
//: A computed property, or lazy property if the computation is expensive.

//: 6. Can you spot the bug in the code below?
//
//struct Tweet {
//    let date: Date
//    let author: String
//    var message: String {
//        didSet {
//            message = message.trimmingCharacters(in: .whitespaces)
//        }
//    }
//}
//
//let tweet = Tweet(date: Date(),
//                  author: "@tjeerdintveen",
//                  message: "This has a lot of unnecessary whitespace   ")
//
//tweet.message.count

//: The whitespace isn't trimmed from the initializer.

//: 7. How can you fix the bug?
//: By adding an initializer to the struct with a defer clause.

struct Tweet {
    let date: Date
    let author: String
    var message: String {
        didSet {
            message = message.trimmingCharacters(in: .whitespaces)
        }
    }

    init(date: Date, author: String, message: String) {
        defer { self.message = message }
        self.date = date
        self.author = author
        self.message = message
    }
}

let tweet = Tweet(date: Date(),
                  author: "@tjeerdintveen",
                  message: "This has a lot of unnecessary whitespace   ")

tweet.message.count


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

