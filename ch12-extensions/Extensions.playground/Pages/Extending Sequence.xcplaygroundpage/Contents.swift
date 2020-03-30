//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Extending Sequence

import Foundation

//: ## Inspect

["C", "B", "A", "D"]
    .sorted()
    .inspect { (string) in
        print("Inspecting: \(string)")
    }.filter { (string) -> Bool in
        string < "C"
    }.forEach {
        print("Result: \($0)")
}

// Output:
// Inspecting: A
// Inspecting: B
// Inspecting: C
// Inspecting: D
// Result A
// Result B

extension Sequence {
    public func inspect(
        _ body: (Element) throws -> Void
        ) rethrows  -> Self {
        for element in self {
            try body(element)
        }
        return self
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
