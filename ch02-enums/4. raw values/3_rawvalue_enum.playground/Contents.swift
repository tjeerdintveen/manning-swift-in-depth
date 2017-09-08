enum Currency: String {
    case euro = "eur"
    case usd
    case gbp
}

let currency = Currency.euro
print(currency.rawValue) // "eur"


let parameters = ["filter": currency.rawValue]
// We expect "euro" but got "eur"
print(parameters) // ["filter": "eur"]



