//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

import Foundation
import UIKit

//: # Exercises

//: 1.
protocol AudioProtocol {}

// What is the difference between the following statements?
func loadAudio(audio: AudioProtocol) {}
func loadAudio<T: AudioProtocol>(audio: T) {}

//: 2. How would you decide to use a generic or non-generic protocol in the following struct. Is this the correct choice? Why or why not?

protocol Ingredient {}
struct Recipe<I: Ingredient> {
    let ingredients: [I]
    let instructions: String
}

//: 3. How would you decide to use a to use a generic or non-generic protocol in the following struct. Is the following a good choice? Why or why not?

protocol APIDelegate {
    func load(completion:(Data) -> Void)
}

struct ApiLoadHandler: APIDelegate {
    func load(completion: (Data) -> Void) {
        print("I am loading")
    }
}

class API {
    private let delegate: APIDelegate?
    
    init(delegate: APIDelegate) {
        self.delegate = delegate
    }
}

let dataModel = API(delegate: ApiLoadHandler())


// 4: Consider the following subclassing hierarchy for a game, where we have enemies that can attack with a certain type of damage. Can you replace this subclassing hierarchy with a protocol-based solution?

class AbstractDamage {}

class AbstractEnemy {
    func attack() -> AbstractDamage {
        fatalError("This method must be implemented by subclass")
    }
}

class Fire: AbstractDamage {}
class Imp: AbstractEnemy {
    override func attack() -> Fire {
        return Fire()
    }
}

class BluntDamage: AbstractDamage {}
class Centaur: AbstractEnemy {
    override func attack() -> BluntDamage {
        return BluntDamage()
    }
}
//: 5.
//: Let's say we have the following types:
//: a. A protocol representing something that can play a file at location.

protocol Playable {
    var contents: URL { get }
    func play()
}

//: b. A Movie struct that inherits this protocol.

final class Movie: Playable {
    let contents: URL
    
    init(contents: URL) {
        self.contents = contents
    }
    
    func play() { print("Playing video at \(contents)") }
}

//: Now, a new Song type is introduced, but instead of playing a file at a URL, it uses an AudioFile type. How would you deal with this? See if you can make the protocol reflect this.

//: Uncomment and note that this file won't compile.
//struct AudioFile {}
//final class Song: Playable {
//    let contents: AudioFile
//
//    init(contents: AudioFile) {
//        self.contents = contents
//    }
//      func play() { print("Playing song") }
//}

// 6:. Given this playlist that first could only play movies. How can you make sure it can play either movies or songs?

final class Playlist {
    
    private var queue: [Movie] = []
    
    func addToQueue(playable: Movie) {
        queue.append(playable)
    }
    
    func start() {
        queue.first?.play()
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
