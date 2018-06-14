//: [Previous](@previous)

struct Bag<T: Hashable> {
    private var store = [T: Int]()
    
    mutating func insert(_ element: T) {
        store[element, default: 0] += 1
    }
    
    mutating func remove(_ element: T) {
        store[element]? -= 1
        if store[element] == 0 {
            store[element] = nil
        }
    }
    
    var count: Int {
        return store.values.reduce(0, +)
    }
    
}

extension Bag: CustomStringConvertible {
    var description: String {
        var summary = String()
        for (key, value) in store {
            let times = value == 1 ? "time" : "times"
            summary.append("\(key) occurs \(value) \(times)\n")
        }
        return summary
    }
}

var bag = Bag<String>()
bag.insert("Huey")
bag.insert("Huey")
bag.insert("Huey")

bag.insert("Mickey")

bag.remove("Huey")

bag.count // 3
print(bag)
//Output:
//Huey occurs 2 times
//Mickey occurs 1 time


//: ## Making Bag conform to Sequence

struct BagIterator<T: Hashable>: IteratorProtocol {
    
    var store = [T: Int]()
    
    mutating func next() -> T? {
        guard let (key, value) = store.first  else {
            return nil
        }
        if value > 1 {
            store[key]? -= 1
        } else {
            store[key] = nil
        }
        return key
    }
}

extension Bag: Sequence {
    func makeIterator() -> BagIterator<T> {
        return BagIterator(store: store)
    }
}

//: Alternatively, we can use AnyIterator

//extension Bag: Sequence {
//    func makeIterator() -> AnyIterator<T> {
//        var exhaustiveStore = store // create copy
//
//        return AnyIterator<T> {
//            guard let (key, value) = exhaustiveStore.first  else {
//                return nil
//            }
//            if value > 1 {
//                exhaustiveStore[key]? -= 1
//            } else {
//                exhaustiveStore[key] = nil
//            }
//            return key
//        }
//    }
//}

// Now we can call forEach, filter etc

bag.filter { $0.count > 2}
bag.contains("Huey") // true
bag.contains("Mickey") // false

//: ## ExpressibleByArrayLiteral

extension Bag: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = T
    init(arrayLiteral elements: T...) {
        store = elements.reduce(into: [T: Int]()) { (updatingStore, element) in
            updatingStore[element, default: 0] += 1
        }
    }
}

let anotherBag: Bag = [1.0, 2.0, 2.0, 3.0, 3.0, 3.0]
print(anotherBag)
// Output:
// 2.0 occurs 2 times
// 1.0 occurs 1 time
// 3.0 occurs 3 times

let colors: Bag = ["Green", "Green", "Blue", "Yellow", "Yellow", "Yellow"]
print(colors)
// Output:
// Green occurs 2 times
// Blue occurs 1 time
// Yellow occurs 3 times



//: [Next](@next)
