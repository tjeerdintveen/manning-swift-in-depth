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

struct Artist {

    var name: String
    var birthDate: Date
    var songsFileName: String
    
    init(name: String, birthDate: Date, songsFileName: String) {
        self.name = name
        self.birthDate = birthDate
        self.songsFileName = songsFileName
    }

    func getAge() -> Int? {
        let years = Calendar.current
            .dateComponents([.year], from: birthDate, to: Date())
            .year

        return years
    }
    
    func loadSongs() -> [Song] {
        guard
            let fileURL = Bundle.main.url(forResource: songsFileName, withExtension: "plist"),
            let data = try? Data(contentsOf: fileURL),
            let songs = try? PropertyListDecoder().decode([Song].self, from: data) else {
                return []
        }
        return songs
    }

    mutating func songsReleasedAfter(year: Int) -> [Song] {
        return loadSongs().filter { (song: Song) -> Bool in
            return song.year > year
        }
    }

}

//: 1. See if you can clean up the Artist type by using lazy and/or computed properties.

var components = DateComponents()
components.day = 4
components.month = 7
components.year = 1938
var billWithers = Artist(name: "Bill Withers", birthDate: Calendar.current.date(from: components)!, songsFileName: "songs")
billWithers.getAge()
let songs = billWithers.loadSongs()
print(billWithers.getAge())

//: 2. Assuming loadSongs is turned into a lazy property called "songs", make sure the following code doesn't break it by trying to override the property data
// billWithers.songs = []

//: 3. Assuming loadSongs is turned into a lazy property called "songs", how can you make sure that the following lines won't break the lazily loaded property? Point out two ways to prevent a lazy property from breaking.
// billWithers.songs
// billWithers.songsFileName = "oldsongs" // change file name
// billWithers.songs.count // Should be 0 after renaming songsFileName, but is 2

 //: 4. If you need a property with both behavior and storage, what kind of property would you use?
 //: 5. If you need a property with only behavior and no storage, what kind of property would you use?
 //: 6. Can you spot the bug in the code below?

import Foundation

struct Tweet {
    let date: Date
    let author: String
    var message: String {
        didSet {
            message = message.trimmingCharacters(in: .whitespaces)
        }
    }
}

let tweet = Tweet(date: Date(),
                  author: "@tjeerdintveen",
                  message: "This has a lot of unnecessary whitespace   ")

tweet.message.count

//: 7. How can you fix the bug?

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

