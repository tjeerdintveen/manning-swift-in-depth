//: [Previous](@previous)

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

var swiftCourse: SwiftOnTheServer = SwiftOnTheServer()
var course: OnlineCourse = swiftCourse // is allowed
course.start() // Starting Swift course. Type is still OnlineCourse.

//: Custom types don't allow for covariance
struct Container<T> {}

var containerSwiftCourse: Container<SwiftOnTheServer> = Container<SwiftOnTheServer>()
//var containerOnlineCourse: Container<OnlineCourse> = containerSwiftCourse // error: cannot convert value of type 'Container<SwiftOnTheServer>' to specified type 'Container<OnlineCourse>'


//: Swift types get special privileges, are covariant

var swiftCourseArr: Array<SwiftOnTheServer> = Array<SwiftOnTheServer>()
var courseArr: Array<OnlineCourse> = swiftCourseArr // is allowed
courseArr.first?.start() // "Starting Swift course". Type is still [OnlineCourse].





struct Cache<T> {
    // methods omitted
}
func refreshCache(_ cache: Cache<OnlineCourse>) {
    
}
refreshCache(Cache<OnlineCourse>()) // is allowed
//readCourse(Cache<SwiftOnTheServer>()) // error: cannot convert value of type 'Cache<SwiftOnTheServer>' to expected argument type 'Cache<OnlineCourse>'

// But, arrays are exempt from this limitation

func readArrayCourse(array: Array<OnlineCourse>) {
    // ... snip
}

readArrayCourse(array: Array<OnlineCourse>()) // is allowed
readArrayCourse(array: Array<SwiftOnTheServer>()) // is allowed, Array has special privileges


//Explicit
func readOptionalCourse(_ value: Optional<OnlineCourse>) {
    // ... snip
}

readOptionalCourse(OnlineCourse()) // is allowed
readOptionalCourse(SwiftOnTheServer()) // is allowed, Optional has special privileges


func readArraySwiftServer(array: Array<SwiftOnTheServer>) {
    // ... snip
}

//readArraySwiftServer(array: [OnlineCourse()])


// Array is allowed to do this, but we're not
//error: cannot convert value of type 'CustomType<SwiftOnTheServer>' to specified type 'CustomType<OnlineCourse>'
//
var swiftCourseCustom: Cache<SwiftOnTheServer> = Cache<SwiftOnTheServer>()
//var courseCustom: CustomType<OnlineCourse> = swiftCourseCustom

// more practical example:
// Generic is already specialized here
//func acceptCourse(course: Cache<OnlineCourse>) {
//
//}

let swiftOnServerCache = Cache<SwiftOnTheServer>()
//Cannot convert value of type 'Cache<SwiftOnTheServer>' to expected argument type 'Cache<OnlineCourse>'
//acceptCourse(course: swiftOnServerCache)

// TODO: Would be nice for read only purposes

// Can make acceptCourse generic.. which works
func acceptAnyThing<T>(cache: Cache<T>) {
    
}

acceptAnyThing(cache: swiftOnServerCache)

// Cat is a subclass of Animal
class Animal {}
class Cat: Animal {}
class Dog: Animal {}

var cats = [Cat()]
var animals: [Animal] = cats
animals.append(Dog())

print(animals) // [Cat, Dog]
print(cats) // [Cat], intact, no dogs in cats array

//Cat[] cats = ...;
//Animal[] animals = cats; // Array covariance is allowed
//animals[0] = new Dog(); // Putting a Dog into an array of Animal: no complaint from the compiler, no runtime check
//Cat cat = cats[0]; // We try to get a Cat from the array of Cat but it’s a Dog!
//cat.purr(); // invalid method call, will probably crash the JVM




import UIKit

//var views: Array<UIView> = [UIView()]
//var buttons: Array<UIButton> = [UIButton()]
//views = buttons

//: Subtyping with arrays

var courses: Array<OnlineCourse> = [OnlineCourse()]
courses = [SwiftOnTheServer()]
courses.first?.start() // Starting Swift course.

// But, we can't specialize the array type
//var swiftCourses: Array<SwiftOnTheServer> = courses // cannot convert value of type 'Array<OnlineCourse>' to specified type 'Array<SwiftOnTheServer>'

// Same for optionals
var optionalCourse: Optional<OnlineCourse> = Optional(OnlineCourse())
optionalCourse = Optional(SwiftOnTheServer())

//error: cannot convert value of type 'Optional<OnlineCourse>' to specified type 'Optional<SwiftOnTheServer>'
//var optionalServerCourse: Optional<SwiftOnTheServer> = optionalCourse

//: Subtyping




//

//func complete<C: Course>(_ course: C) {
//    print("Completed \(course)")
//}
//
//complete(Course())
//complete(LearningSwift())
//
//func acceptOptional(_ value: Optional<Course>) {
//    print(value)
//}
//
//let learningSwift: Optional<LearningSwift> = LearningSwift()
//acceptOptional(Course())
//acceptOptional(learningSwift)
//
//class Animal {}
//class Cat: Animal {}
//struct Shelter<T: Animal> {
//    let inhabitants:[T]
//    init(inhabitants:[T]) {
//        self.inhabitants = inhabitants;
//    }
//}
//
//func countFurballs(_ shelter:Shelter<Animal>) {
//    print("Furballs: \(shelter.inhabitants.count)")
//}
//
//var catShelter = Shelter(inhabitants:[Cat()])
//
//countFurballs(catShelter) // throws compilation error
//
////var animals = [Animal]()
////animals.append(Cat())
//
//var shelters: [Shelter<Animal>] = [
//    Shelter<Animal>(inhabitants: [])
//]
//
////// Gaat fout ,want generic in generic kan niet.
////// error: cannot convert value of type 'Shelter<Cat>' to expected argument type 'Shelter<Animal>'
////shelters.append(
////    Shelter<Cat>(inhabitants: [])
////)
//
////: Any arrays
//
//var anyArray = [Any]()
////let optString: String? = "hi"
////anyArray.append(optString)
//
//
//// Werkt niet
////func addInt<T: Any>(arr: inout [T]) {
////    arr.append("hi")
////}
//
//
//func addStringRuntime(_ arr: inout [Any]) {
//    arr.append("hi")
//}
//
//func addFloatRuntime(_ arr: inout [Any]) {
//    arr.append(30.0)
//}
//
//
//
//
//addStringRuntime(&anyArray)
//addFloatRuntime(&anyArray) // ["hi", 30]
//
//// is string subtype of any?
//// Werkt niet: Want [String] is geen subtype van [Any] is verwacht
////var stringArray = ["hola"]
////addStringRuntime(&stringArray)
//
//// Does not work:
////func acceptsString(_ arr: inout [String]) {
////
////}
////
//func acceptsString(_ arr: [String]) {
//
//}
////// Werkt niet: Want [Any] is geen subtype van [String]
////var someAnyArray = [Any]()
////acceptsString(someAnyArray)
//
////: Invariance
//
//class Herd<T: Animal> {
//    func add(animal: T) {
//        // append to list of animals
//    }
//}
//
//
//
//func takeCareOfCats(cats: Herd<Cat>) {
//    feedAll(animals: cats)
//}
//
//// Werkt niet. Generic is specialized naar Animal. Kan geen Cat accepteren.
////Herd<Cat> is geen subtype van Herd<Animal>
////func feedAll(animals: Herd<Animal>) {
////
////}
//
//
//
//// Werkt want we propageren de generic weer door. Generic is specialized voor elk dier. "A" wordt Cat of iets anders
//func feedAll<A: Animal>(animals: Herd<A>) {
//
//}
//
////: Simple example
//
//var ssstring: String = "hey"
//var aaany: Any = ssstring
//
//
//// Does not work
//var ssstring: [String] = "hey"
//var aaany: [Any] = ssstring
//
//// Does not work. simple example
////var aaany: Array<Any> = Array<Any>()
////var ssstring: Array<String> = aaany
//
////let stringAny: [Any] = ["hi"]
////
////let stringy: String? = stringAny.first

//: [Next](@next)
