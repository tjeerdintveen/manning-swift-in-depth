//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)

import Foundation

class OnlineCourse {
    func start() {
        print("Starting online course.")
    }
}
class SwiftOnTheServer: OnlineCourse {
    override func start() {
        print("Starting Swift course.")
    }
}

//: Subclassing showcases subtyping

var swiftCourse: SwiftOnTheServer = SwiftOnTheServer()
var course: OnlineCourse = swiftCourse // is allowed
course.start() // Starting Swift course. Type is still OnlineCourse.

//: Our generic types are invariant

struct Container<T> {}

var containerSwiftCourse: Container<SwiftOnTheServer> = Container<SwiftOnTheServer>()
//var containerOnlineCourse: Container<OnlineCourse> = containerSwiftCourse // error: cannot convert value of type 'Container<SwiftOnTheServer>' to specified type 'Container<OnlineCourse>'

struct Cache<T> {
    // methods omitted
}
func refreshCache(_ cache: Cache<OnlineCourse>) {
    
}
refreshCache(Cache<OnlineCourse>()) // is allowed
//refreshCache(Cache<SwiftOnTheServer>()) // error: cannot convert value of type 'Cache<SwiftOnTheServer>' to expected argument type 'Cache<OnlineCourse>'


//: Swift types are covariant

func readOptionalCourse(_ value: Optional<OnlineCourse>) {
    // ... snip
}

readOptionalCourse(OnlineCourse()) // is allowed
readOptionalCourse(SwiftOnTheServer()) // is allowed, Optional has special privileges

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous)
