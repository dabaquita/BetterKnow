//
//  Question.swift
//  BetterKnow
//
//  Created by Denielle Abaquita on 10/9/21.
//

import UIKit

class Question {
    var title: String
    var answers: [String]
    var correctAnswerIndex: Int
    
    init(title: String, answers: [String], correctAnswerIndex: Int) {
        self.title = title
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
//    static func FetchQuestions() -> [Question] {
//
//    }
}
