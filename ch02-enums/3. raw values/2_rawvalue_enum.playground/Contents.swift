enum Location: String {
    case previous = "former"
    case current
    case next
}

let location = Location.previous
print(location.rawValue) // "former"


let locationValue: String

switch location {
case .previous: locationValue = "previous"
case .current: locationValue = "current"
case .next: locationValue = "next"
}

// Our parameters are unaffected by raw value renaming of an enum.
let parameters = ["action": "navigateTo", "location" : locationValue]
print(parameters) // ["action": "navigateTo", "location": "previous"]

