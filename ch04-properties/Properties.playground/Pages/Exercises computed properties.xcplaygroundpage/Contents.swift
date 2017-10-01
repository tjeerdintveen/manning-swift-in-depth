//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
//: # Exercises computed properties

import Foundation

//: In this exercise we're modelling a music library. Think Apple Music or Spotify.

struct Song {
    let id: String
    let name: String
    let durationInSeconds: Int
    let rating: Float
    let date: Date
    let playCount: Int
}

class Artist {
    
    var name: String
    var birthDate: Date
    var songs: [Song]
    
    init(name: String, birthDate: Date, songs: [Song]) {
        self.name = name
        self.birthDate = birthDate
        self.songs = songs
    }
    
    func getAge() -> Int? {
        let years = Calendar.current
            .dateComponents([.year], from: Date(), to: birthDate)
            .day
        
        return years
    }
    
    func summary() -> (mostPlayed: Song, leastPlayed: Song) {
        let sortedSongs = songs.sorted { (lhs: Song, rhs: Song) -> Bool in
            lhs.playCount > rhs.playCount
        }
        
        return (mostPlayed: sortedSongs[0], leastPlayed: sortedSongs[sortedSongs.count-1])
    }
    
    func songsReleasedAfter(date: Date) -> [Song] {
        return songs.filter { (song: Song) -> Bool in
            return song.date > date
        }
        
    }
    
}

//: 1. Which of the functions in Artist can be turned into computed properties?
//: 2. Turn the function(s) you picked into computed properties.

let aintNoSunshine = Song(id: "1", name: "Ain't no shunshine", durationInSeconds: 125, rating: 3.6, date: Date(), playCount: 3_000_203)
let lovelyday = Song(id: "2", name: "Lovely day", durationInSeconds: 255, rating: 2.8, date: Date(), playCount: 1_212_298)
let songs = [aintNoSunshine, lovelyday]

var components = DateComponents()
components.day = 4
components.month = 7
components.year = 1938
let billWithers = Artist(name: "Bill Withers", birthDate: Calendar.current.date(from: components)!, songs: [aintNoSunshine, lovelyday])

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
