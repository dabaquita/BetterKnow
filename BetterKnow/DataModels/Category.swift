//
//  Categories.swift
//  BetterKnow
//
//  Created by Denielle Abaquita on 10/9/21.
//

import UIKit

class Category {
    var title: String = ""
    var image: UIImage
    var topics: [Topic]
    
    init(title: String, image: UIImage, topics: [Topic]) {
        self.title = title
        self.image = image
        self.topics = topics
    }
    
    // Implement this and return our categories holding various topics
    static func FetchCategories() -> [Category] {
        return [
           Category(
            title: "General Information",
            image: UIImage(systemName: "book")!,
            topics: [Topic(title: "Eat", description: "My book")]
           ),
           Category(
            title: "Finding Help",
            image: UIImage(systemName: "book.fill")!,
            topics: [Topic(title: "Eat", description: "My book")]
           ),
           Category(
            title: "Support",
            image: UIImage(systemName: "book.closed")!,
            topics: [Topic(title: "Eat", description: "My taco")]
           ),
           Category(
            title: "Understanding systems and treatments",
            image: UIImage(systemName: "pills")!,
            topics: [Topic(title: "Eat", description: "My pills")]
           )
        ]
    }
}
