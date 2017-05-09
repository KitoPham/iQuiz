//
//  questionViewController.swift
//  iQuiz
//
//  Created by studentuser on 5/8/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit

class questionViewController: UIViewController {
    var subjectTopic : subjectItem?
    var currentQuestion : QuestionObject?
    var answer = 0
    var questionNum = 1
    var correctNum = 0
    
    
    @IBOutlet weak var Nextbutton: UIButton!
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var QuestionNumLabel: UILabel!
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = subjectTopic?.subjectTitle
        currentQuestion = subjectTopic?.questions[questionNum - 1]
        questionLabel.text = currentQuestion!.question
        QuestionNumLabel.text = "Question #\(questionNum)"
        Answer1.setTitle(currentQuestion!.Answer[0], for: .normal)
        Answer2.setTitle(currentQuestion!.Answer[1], for: .normal)
        Answer3.setTitle(currentQuestion!.Answer[2], for: .normal)
        Answer4.setTitle(currentQuestion!.Answer[3], for: .normal)
        
        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeleft))
        recognizer.direction = .left
        self.view .addGestureRecognizer(recognizer)
        
        let rightrecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swiperight))
        rightrecognizer.direction = .right
        self.view .addGestureRecognizer(rightrecognizer)
        
    
        
        
    }
    
    func swiperight(recognizer : UISwipeGestureRecognizer) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func swipeleft(recognizer : UISwipeGestureRecognizer) {
        if (Nextbutton.isEnabled){
            performSegue(withIdentifier: "ToAnswer", sender: self)
        }
    }
    

    @IBAction func AnswerOnClick(_ sender: UIButton) {
        Answer1.backgroundColor = UIColor.lightGray
        Answer2.backgroundColor = UIColor.lightGray
        Answer3.backgroundColor = UIColor.lightGray
        Answer4.backgroundColor = UIColor.lightGray
        
        Nextbutton.isEnabled = true
        sender.backgroundColor = UIColor.blue
        answer = sender.tag
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let answerView = segue.destination as! answerViewController
        answerView.subjectTopic = self.subjectTopic
        answerView.currQuestion = self.currentQuestion!
        answerView.answer = self.answer
        answerView.questionNum = self.questionNum
        answerView.correctNum = self.correctNum
        
        
    }
}
