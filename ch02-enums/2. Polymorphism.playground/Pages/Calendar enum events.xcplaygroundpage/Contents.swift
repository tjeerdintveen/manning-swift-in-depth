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
//: CalendarItem is now an enum, where each case can contain **only** a single item
enum CalendarItem {
    case event(Event)
    case birthday(BirthDay)
}

//: Below we are creating an array full of CalendarItem's, which serve as the contents inside a calendar.

let calendarItems: [CalendarItem] = [
    CalendarItem.event(
        Event(date: Date(timeIntervalSince1970: 1_520_000_000), title: "Watching the Lion King")
    ),
    CalendarItem.event(
        Event(date: Date(timeIntervalSince1970: 1_504_000_000), title: "A pleasant rootcanal at the dentist")
    ),
    CalendarItem.birthday(
        BirthDay(date: Date(timeIntervalSince1970: 629_581_266), firstName: "Taylor", lastName: "Swift")
    )
]

//: With this function we retrieve the dates that are inside a calendar. But this time we use pattern matching.

func retrieveDates(items: [CalendarItem]) -> [Date] {
    var dates = [Date]()
    
    for calenderItem in items {
        switch calenderItem {
        case .birthday(let birthDay): dates.append(birthDay.date)
        case .event(let event): dates.append(event.date)
        }
    }
    
    return dates
}

let dates = retrieveDates(items: calendarItems)
//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
