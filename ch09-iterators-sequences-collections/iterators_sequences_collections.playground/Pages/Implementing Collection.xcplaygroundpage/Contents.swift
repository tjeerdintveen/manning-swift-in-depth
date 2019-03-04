//: [Previous](@previous)

import Foundation
import Foundation

struct Activity: Equatable {
    let date: Date
    let description: String
}

struct Day: Hashable {
    let date: Date
    
    init(date: Date) {
        // Strip time from Date
        let unitFlags: Set<Calendar.Component> = [.day, .month, .year]
        let components = Calendar.current.dateComponents(unitFlags, from: date)
        guard let convertedDate = Calendar.current.date(from: components) else {
            self.date = date
            return
        }
        self.date = convertedDate
    }
    
}

struct TravelPlan {
    
    typealias DataType = [Day: [Activity]]
    
    private var trips = DataType()
    
    init(activities: [Activity]) {
        self.trips = Dictionary(grouping: activities) { activity -> Day in
            Day(date: activity.date)
        }
    }
    
}

extension TravelPlan: Collection {
    
    typealias KeysIndex = DataType.Index
    typealias DataElement = DataType.Element
    
    var startIndex: KeysIndex { return trips.startIndex }
    var endIndex: KeysIndex { return trips.endIndex }
    func index(after i: KeysIndex) -> KeysIndex {
        return trips.index(after: i)
    }
    
    subscript(index: KeysIndex) -> DataElement {
        return trips[index]
    }
    
}
//: We can now iterate over TravelPlan

let activities = [
    Activity(date: Date(), description: "Hiking"),
    Activity(date: Date(), description: "Lunch break"),
    Activity(date: Date(), description: "Mountain biking"),
    Activity(date: Date(), description: "Kayaking")
]

let travelPlan = TravelPlan(activities: activities)

for (day, activities) in travelPlan {
    print(day)
    print(activities)
}


// We get a default iterator, no need to create one ourselves.
let defaultIterator: IndexingIterator<TravelPlan> = travelPlan.makeIterator()

//: Add Bonus subscript for syntactic sugar

extension TravelPlan {
    subscript(date: Date) -> [Activity] {
        return trips[Day(date: date)] ?? []
    }
    
    subscript(day: Day) -> [Activity] {
        return trips[day] ?? []
    }
}

let day = Day(date: Date())
travelPlan[day]
travelPlan[Date()]

extension TravelPlan: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Activity...) {
        self.init(activities: elements)
    }
}

extension TravelPlan: ExpressibleByDictionaryLiteral {
    init(dictionaryLiteral elements: (Day, [Activity])...) {
        self.trips = Dictionary(elements, uniquingKeysWith: { (first, _) in
            return first
        })
    }
}

let adrenalineTrip = Day(date: Date())
let adrenalineActivities = [
    Activity(date: Date(), description: "Bungee jumping"),
    Activity(date: Date(), description: "Driving in rush hour LA"),
    Activity(date: Date(), description: "Sky diving")
]

let adrenalinePlan: TravelPlan = [adrenalineTrip: activities] // We can now create a TravelPlan from a dictionary

////: [Next](@next)
