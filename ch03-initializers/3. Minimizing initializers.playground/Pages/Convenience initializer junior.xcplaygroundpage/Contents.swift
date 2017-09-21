//: [Previous](@previous)
//: Playground - noun: a place where people can play

import UIKit

func random(max: UInt32) -> UInt32 {
    return arc4random_uniform(max)
}

struct Player {
    let name: String
    let color: UIColor
}

extension Player {
    
    init(name: String) {
        self.name = name
        
        self.color = UIColor(red:  CGFloat(random(max: 100)) / 100,
                             green: CGFloat(random(max: 100)) / 100,
                             blue:  CGFloat(random(max: 100)) / 100,
                             alpha: 1.0)
    }
}

class BoardGame {
    let players: [Player]
    let numberOfTiles: Int
    
    init(players: [Player], numberOfTiles: Int) {
        self.players = players
        self.numberOfTiles = numberOfTiles
    }
    
    convenience init(players: [Player]) {
        self.init(players: players, numberOfTiles: 32)
    }
    
    convenience init(names: [String]) {
        var players = [Player]()
        for name in names {
            players.append(Player(name: name))
        }
        self.init(players: players, numberOfTiles: 32)
    }
}

class MutabilityLand: BoardGame {
    var scoreBoard = [String: Int]()
    var winner: Player?
    
    let instructions: String
    
    init(players: [Player], instructions: String, numberOfTiles: Int) {
        self.instructions = instructions
        super.init(players: players, numberOfTiles: numberOfTiles)
    }
    
    convenience override init(players: [Player], numberOfTiles: Int) {
        self.init(players: players, instructions: "Read the manual", numberOfTiles: numberOfTiles)
    }
}

class MutabilityLandJunior: MutabilityLand {
    let soundsEnabled: Bool
    
    init(soundsEnabled: Bool, players: [Player], instructions: String, numberOfTiles: Int) {
        self.soundsEnabled = soundsEnabled
        super.init(players: players, instructions: instructions, numberOfTiles: numberOfTiles)
    }
    
    convenience override init(players: [Player], instructions: String, numberOfTiles: Int) {
        self.init(soundsEnabled: false, players: players, instructions: instructions, numberOfTiles: numberOfTiles)
    }
}

let players = [
    Player(name: "Melissa"),
    Player(name: "SuperJeff"),
    Player(name: "Dave")
]

// Designated initializer
let mutabilityLandJr = MutabilityLandJunior(players: players, instructions: "Kids don't read manuals", numberOfTiles: 8)
//let mutabilityLandJr = MutabilityLandJunior(soundsEnabled: true, players: players, instructions: "Kids don't read manuals", numberOfTiles: 8)
//let mutabilityLandJr = MutabilityLandJunior(names: ["Philippe", "Alex"])
//let mutabilityLandJr = MutabilityLandJunior(players: players)
//let mutabilityLandJr = MutabilityLandJunior(players: players, numberOfTiles: 8)


//: [Next](@next)
