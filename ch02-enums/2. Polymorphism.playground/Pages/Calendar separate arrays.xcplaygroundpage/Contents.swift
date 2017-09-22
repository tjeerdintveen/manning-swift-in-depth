//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
import Foundation

//: First we structure the data types.

struct Event {
    let date: Date
    let title: String
}

struct BirthDay {
    let date: Date
    let firstName: String
    let lastName: String
}

struct CalendarItems {
    let birthdays: [BirthDay]
    let events: [Event]
}

//: Below we are creating a calendar by passing it two arrays.

let events = [
    Event(date: Date(timeIntervalSince1970: 1_520_000_000), title: "Watching the Lion King"),
    Event(date: Date(timeIntervalSince1970: 1_504_000_000), title: "A pleasant rootcanal at the dentist")
]

let birthdays = [
    BirthDay(date: Date(timeIntervalSince1970: 629_581_266), firstName: "Taylor", lastName: "Swift")
]

let calendar = CalendarItems(birthdays: birthdays, events: events)

//: With this function we retrieve the dates that are inside a calendar.

func retrieveDates(calendar: CalendarItems) -> [Date] {
    var dates = [Date]()
    
    for event in calendar.events {
        dates.append(event.date)
    }
    
    for birthday in calendar.birthdays {
        dates.append(birthday.date)
    }
    
    return dates
}

let dates = retrieveDates(calendar: calendar)

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

