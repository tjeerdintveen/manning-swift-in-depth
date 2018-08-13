//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Extending Sequence

import Foundation

//: ## drop(while:)

let silenceLines =
    """
    
    
    
    The silence is finally over.
    """.components(separatedBy: "\n")

let lastParts = silenceLines.drop(while: { (line) -> Bool in
    line.isEmpty
})

print(lastParts) // ["The silence is finally over."]

//: ## take(while:)

let lines =
    """
    We start with text...
    ... and then some more

    This will be ignored because it came after empty space
    and more text
    """.components(separatedBy: "\n")

let firstParts = lines.take(while: { (line) -> Bool in
    !line.isEmpty
})

print(firstParts) // ["We start with text...", "... and then some more"]

//: ## take(while:)

extension Sequence {
    public func take(
        while predicate: (Element) throws -> Bool
        ) rethrows -> [Element] {
        
        var iterator = makeIterator()
        
        var result = ContiguousArray<Element>()
        
        while let element = iterator.next() {
            if try predicate(element) {
                result.append(element)
            } else {
                break
            }
        }
        
        return Array(result)
    }
}

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
