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

struct Calendar {
    let birthdays: [BirthDay]
    let events: [Event]
}



let regularEvents = [
    Event(date: Date(timeIntervalSince1970: 1_520_000_000), title: "Watching the Lion King"),
    Event(date: Date(timeIntervalSince1970: 1_504_000_000), title: "A pleasant rootcanal at the dentist")
]

let birthdays = [
    BirthDay(date: Date(timeIntervalSince1970: -2_148_249_600), firstName: "Walt", lastName: "Disney")
]


let calendar = Calendar(birthdays: birthdays, events: regularEvents)

func retrieveDates(calendar: Calendar) -> [Date] {
    var dates = [Date]()
    
    for event in calendar.events {
        dates.append(event.date)
    }
    
    for birthday in calendar.birthdays {
        dates.append(birthday.date)
    }
    
    return dates
}

