//
//  Quiz.swift
//  BetterKnow
//
//  Created by Denielle Abaquita on 10/9/21.
//

import UIKit

class Quiz {
    var title: String
    var image: UIImage
    var questions: [Question]
    
    init(title: String, image: UIImage, questions: [Question]) {
        self.title = title
        self.image = image
        self.questions = questions
    }
    
//    static func FetchQuizzes() -> [Quiz] {
//        return [
//            Quiz(
//                title: "Mental Health",
//                image: UIImage(systemName: "person"),
//                questions: [Question()]
//            )
//        ]
//    }
}
