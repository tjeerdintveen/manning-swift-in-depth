//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation

//: # Conditional Conformance part 2

//: AudioTrack with Conditional Conformance

protocol Track {
    func play()
}

struct AudioTrack: Track {
    let file: URL
    func play() {
        print("playing audio at \(file)")
    }
}

extension Array: Track where Element: Track {
    func play() {
        for element in self {
            element.play()
        }
    }
}

//: ## Conditional Conformance with Optional

extension Optional: Track where Wrapped: Track {
    func play() {
        switch self {
        case .some(let track):
            track.play()
        case nil:
            break // do nothing
        }
    }
}

let audio: AudioTrack? = AudioTrack(file: URL(fileURLWithPath: "1.mp3"))
audio?.play() // Now an optional can play audio too, if there is any `Track` type inside.

func playDelayed<T: Track>(_ track: T, delay: Double) {
    // ... snip
}

playDelayed(audio, delay: 3.0)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
