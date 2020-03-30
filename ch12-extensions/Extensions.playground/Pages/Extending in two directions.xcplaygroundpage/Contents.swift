//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Extending in two directions

import UIKit

protocol AnalyticsProtocol {
    func track(event: String, parameters: [String: Any])
}

// Not like this:
//extension UIViewController: AnalyticsProtocol {
//    func track(event: String, parameters: [String: Any]) { // ... snip }
//}

// But as follows:
extension AnalyticsProtocol where Self: UIViewController {
    func track(event: String, parameters: [String: Any]) {
        print("Tracked \(event) and \(parameters)")
    }
}

final class NewsViewController: UIViewController, AnalyticsProtocol {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        track(event: "News.appear", parameters: [:])
    }
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
