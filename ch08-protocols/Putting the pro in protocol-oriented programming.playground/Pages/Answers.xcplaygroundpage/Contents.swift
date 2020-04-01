//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Answers

import Foundation

//: 1. What is the difference between the following statements?
//: The non-generic function uses dynamic dispatch (runtime). The generic function uses static dispatch (compile-time)

//: 2. How would you decide to use a generic or non-generic protocol in the following struct. Is this the correct choice? Why or why not?

//: A recipe requires multiple different ingredients. By using a generic, we can only use one type of ingredient. Using eggs for everything can get boring, so, in this case we should step away from generics.

//: 3. How would you decide to use a to use a generic or non-generic protocol in the following struct. Is the following a good choice? Why or why not?

//: The delegate is a single type, we can safely use a generic here. We will get compile-time benefits, such as extra performance, and seeing at compile-time which type we'll use. The code could look like this:

protocol APIDelegate {
    func load(completion:(Data) -> Void)
}

class API<Delegate: APIDelegate> {
    private let delegate: Delegate?
    
    init(delegate: Delegate) {
        self.delegate = delegate
    }
}

struct ApiLoadHandler: APIDelegate {
    func load(completion: (Data) -> Void) {
        print("I am loading")
    }
}

let dataModel = API(delegate: ApiLoadHandler())

// 4: Consider the following subclassing hierarchy for a game, where we have enemies that can attack with a certain type of damage. Can you replace this subclassing hierarchy with a protocol-based solution?

protocol Enemy {
    associatedtype DamageType
    func attack() -> DamageType
}

struct Fire {}
class Imp: Enemy {
    func attack() -> Fire {
        return Fire()
    }
}

struct BluntDamage {}
class Centaur: Enemy {
    func attack() -> BluntDamage {
        return BluntDamage()
    }
}

//: 5. Now, a new Song type is introduced, but instead of playing a file at a URL, it uses an AudioFile type. How would you deal with this? See if you can make the protocol reflect this.

//: We introduce an associatedtype, e.g. Media. The contents property is now of type Media, which resolves to something different for each type.

protocol Playable {
    associatedtype Media
    var contents: Media { get }
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

struct AudioFile {}
final class Song: Playable {
    let contents: AudioFile

    init(contents: AudioFile) {
        self.contents = contents
    }
    
    func play() { print("Playing song") }
}

//: 6. Given this playlist that first could only play movies. How can you make sure it can play either movies or songs?

final class Playlist<P: Playable> {
    
    private var queue: [P] = []
    
    func addToQueue(playable: P) {
        queue.append(playable)
    }
    
    func start() {
        queue.first?.play()
    }
}

//: Note: We can't mix, but we can't create a playlist for songs. Or a playlist for movies.

//: 8. Create an extension that enables the explode() function, but only on types that conform to a Mentos and Coke protocols

protocol Mentos {}
protocol Coke {}

extension Mentos where Self: Coke {
    func explode() {
        print("KABOOM!")
    }
}

func mix<T>(concoction: T) where T: Mentos, T: Coke {
    concoction.explode()
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
