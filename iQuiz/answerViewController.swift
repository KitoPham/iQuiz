//
//  answerViewController.swift
//  iQuiz
//
//  Created by studentuser on 5/8/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit

class answerViewController: UIViewController {
    var subjectTopic : subjectItem?
    var currQuestion : QuestionObject?
    var answer = 0
    var questionNum = 0
    var correctNum = 0
    
    @IBOutlet weak var QuestionNumLabel: UILabel!
    @IBOutlet weak var CorrectLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4: UIButton!
    
    var correctAnswerButton : UIButton?
    var userAnswerButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuestionNumLabel.text = "Question # \(questionNum)"
        
        Answer1.backgroundColor = UIColor.red
        Answer2.backgroundColor = UIColor.red
        Answer3.backgroundColor = UIColor.red
        Answer4.backgroundColor = UIColor.red
        
        Answer1.setTitle(currQuestion!.Answer[0], for: .normal)
        Answer2.setTitle(currQuestion!.Answer[1], for: .normal)
        Answer3.setTitle(currQuestion!.Answer[2], for: .normal)
        Answer4.setTitle(currQuestion!.Answer[3], for: .normal)
        
        if (answer == currQuestion!.correctAnswer){
            correctNum += 1
            self.view.viewWithTag(answer)?.backgroundColor = UIColor.green
            QuestionLabel.text = "Correct!!"
        } else {
            self.view.viewWithTag(answer)?.backgroundColor = UIColor.blue
            self.view.viewWithTag(currQuestion!.correctAnswer)?.backgroundColor = UIColor.green
            QuestionLabel.text = "Incorrect!!"
        }
        navigationItem.hidesBackButton = true
        CorrectLabel.text = "\(correctNum) out of \(questionNum) correct"

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let questionView = segue.destination as! questionViewController
        
        
        questionNum += 1
        questionView.subjectTopic = self.subjectTopic
        questionView.questionNum = self.questionNum
        questionView.correctNum = self.correctNum
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
