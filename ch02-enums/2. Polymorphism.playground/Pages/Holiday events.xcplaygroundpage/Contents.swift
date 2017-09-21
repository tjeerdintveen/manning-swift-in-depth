//: [Previous](@previous)

import Foundation

struct Event {
    let date: Date
    let title: String
}

struct BirthDay {
    let date: Date
    let firstName: String
    let lastName: String
}

enum CalendarItem {
    case holiday(Event)
    case event(Event)
    case birthday(BirthDay)
}

let items: [CalendarItem] = [
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

// Uncomment to see error, need to match on holiday type
//
//func retrieveDates(items: [CalendarItem]) -> [Date] {
//    var dates = [Date]()
//
//    for calendarItem in items {
//        switch calendarItem {
//        case .birthday(let birthDay): dates.append(birthDay.date)
//        case .event(let event): dates.append(event.date)
//        }
//    }
//
//    return dates
//}

//: [Next](@next)
