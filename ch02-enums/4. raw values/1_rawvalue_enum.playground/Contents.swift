enum Currency: String {
    case euro = "euro"
    case usd = "usd"
    case gbp = "gdp"
}

let currency = Currency.euro
print(currency.rawValue) // "usd"


let parameters = ["filter": currency.rawValue]
print(parameters) // ["filter": "euro"]




