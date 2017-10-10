//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

//: # Answers

import Foundation

/*:
 1. Yes, a RemoteImage can't be both loading and already be cached. Turning it into an enum can enforce these characteristics at compile time.
 */


enum RemoteImage {
    case loading
    case cached(path: String, resolution: Int, data: Data)
}

/*:
 2. No we can keep Friend a struct. This is because there are no "or" statements when looking at a Friend's properties. There are "and" statements: A friend has a firstName AND a lastName. A friend may or may not have a twitter handle or instagram or facebook profile, but these are not mutually exclusive.
 */

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

