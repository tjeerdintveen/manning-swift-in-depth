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
    
    let favoriteProduct: Product?
    
}

struct Product {
    let id: String
    let name: String
    let image: UIImage?
}

let url = Bundle.main.url(forResource: "mayo", withExtension: "jpg")
//: We normally won't force unwrap this.
let imageData = try! Data(contentsOf: url!) // We normally won't force unwrap this

let product = Product(id: "3", name: "Hellmann's", image: UIImage(data: imageData))

let customer = Customer(id: "2", email: "fake@customer.com", firstName: "Jeff", lastName: nil, balance: 2000, membership: nil, favoriteProduct: product)

let imageView = UIImageView()
imageView.image = customer.favoriteProduct?.image

//: Optional chaining with nil coalescing
imageView.image = customer.favoriteProduct?.image ?? UIImage(named: "missing_image")

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

