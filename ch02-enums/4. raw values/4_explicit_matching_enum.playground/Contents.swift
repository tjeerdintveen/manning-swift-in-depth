enum Currency: String {
    case euro = "eur"
    case usd
    case gbp
}

let currency = Currency.euro
print(currency.rawValue) // "eur"

let parameters: [String: String]
switch currency {
case .euro: parameters = ["filter": "euro"]
    case .usd: parameters = ["filter": "usd"]
    case .gbp: parameters = ["filter": "gbp"]
}



// We're back to using "euro" again
print(parameters) // ["filter": "euro"]



