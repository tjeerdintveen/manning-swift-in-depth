//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Optional chaining

import UIKit

enum Membership {
    /// 10% discount
    case gold
    /// 5% discount
    case silver
}

struct Customer {
    let id: String
    let email: String
    let firstName: String?
    let lastName: String?
    let balance: Int
    
    let membership: Membership?
    
    var displayName: String? {
        switch (firstName, lastName) {
        case let (first?, last?): return first + " " + last
        case let (first?, nil): return first
        case let (nil, last?): return last
        default: return nil
        }
    }
    
    let favoriteArticle: Article?
    
}

struct Article {
    let id: String
    let name: String
    let image: UIImage?
}

let url = Bundle.main.url(forResource: "mayo", withExtension: "jpg")
//: We normally won't force unwrap this.
let imageData = try! Data(contentsOf: url!)
let articleImage = UIImage(data: imageData)

let anotherImage = articleImage

let article = Article(id: "9482", name: "Gourmet truffle mayonaise", image: articleImage)

let customer = Customer(id: "30", email: "famthompson@gmail.com", firstName: nil, lastName: "Thompson", balance: 300, membership: .gold, favoriteArticle: article)

let imageView = UIImageView()
//: Optional chaining
imageView.image = customer.favoriteArticle?.image

//: Optional chaining with nil coalescing
imageView.image = customer.favoriteArticle?.image ?? UIImage(named: "missing_image")

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

