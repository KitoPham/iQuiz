//
//  QuestionObject.swift
//  iQuiz
//
//  Created by studentuser on 5/8/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit

class QuestionObject: NSObject {
    var correctAnswer = 0
    var question = ""
    var Answer : [String] = []
    
    init(_ correctAnswer : Int, _ question : String, _ Answer : [String]){
        self.correctAnswer = correctAnswer
        self.question = question
        self.Answer = Answer
    }

}
