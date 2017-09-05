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

enum CalendarEvent {
    case event(Event)
    case birthday(BirthDay)
}

let events: [CalendarEvent] = [
    CalendarEvent.event(
        Event(date: Date(timeIntervalSince1970: 1_520_000_000), title: "Watching the Lion King")
    ),
    CalendarEvent.event(
        Event(date: Date(timeIntervalSince1970: 1_504_000_000), title: "A pleasant rootcanal at the dentist")
    ),
    CalendarEvent.birthday(
        BirthDay(date: Date(timeIntervalSince1970: -2_148_249_600), firstName: "Walt", lastName: "Disney")
    )
]

func retrieveDates(events: [CalendarEvent]) -> [Date] {
    var dates = [Date]()
    
    for event in events {
        switch event {
        case .birthday(let birthDay): dates.append(birthDay.date)
        case .event(let event): dates.append(event.date)
        }
    }
    
    return dates
}


