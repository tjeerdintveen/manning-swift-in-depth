enum Location: String {
    case previous
    case current
    case next
}

let location = Location.previous
print(location.rawValue) // "previous"


let parameters = ["action": "navigateTo", "location" : location.rawValue]
print(parameters) // ["action": "navigateTo", "location": "previous"]

