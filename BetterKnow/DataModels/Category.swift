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
//    static func FetchCategories() -> [Category] {
//
//    }
    
}
