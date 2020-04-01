//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Extending with concrete constraints

import UIKit

struct Article: Hashable {
    let viewCount: Int
}

extension Collection where Element == Article {
    var totalViewCount: Int {
        var count = 0
        for article in self {
            count += article.viewCount
        }
        return count
    }
}

let articleOne = Article(viewCount: 30)
let articleTwo = Article(viewCount: 200)

// Getting the total count on an Array.
let articlesArray = [articleOne, articleTwo]
articlesArray.totalViewCount // 230

// Getting the total count on a Set.
let articlesSet: Set<Article> = [articleOne, articleTwo]
articlesSet.totalViewCount // 230


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
