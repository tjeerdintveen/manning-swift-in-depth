//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Conditional Conformance

//: Equatable is synthesized on structs

struct Movie: Equatable {
    let title: String
    let rating: Float
}

let movie = Movie(title: "The princess bride", rating: 9.7)

movie == movie // true. We can already compare without implementing Equatable


//: ## AudioTrack without Conditional Conformance

protocol Track {
    func play()
}

struct AudioTrack: Track {
    let file: URL
    func play() {
        print("playing audio at \(file)")
    }
}

extension Array where Element: Track {
    func play() {
        for element in self {
            element.play()
        }
    }
}

let tracks = [
    AudioTrack(file: URL(fileURLWithPath: "1.mp3")),
    AudioTrack(file: URL(fileURLWithPath: "2.mp3"))
]
tracks.play() // We use the play() method

// If an Array is nested, we can't call play() any more.
//[tracks, tracks].play() // error: type of expression is ambiguous without more context

// Or we can't pass an array if anything expects the Track protocol.
func playDelayed<T: Track>(_ track: T, delay: Double) {
    // ... snip
}

//playDelayed(tracks, delay: 2.0) // argument type '[AudioTrack]' does not conform to expected type 'Track'

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
