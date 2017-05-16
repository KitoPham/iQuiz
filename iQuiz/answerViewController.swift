//
//  answerViewController.swift
//  iQuiz
//
//  Created by studentuser on 5/8/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit

class answerViewController: UIViewController {
    var currQuestion : QuestionObject?
    var answer = 0

    
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
        
        QuestionNumLabel.text = "Question # \(appdata.shared.questionNum)"
        
        /*Answer1.backgroundColor = UIColor.red
        Answer2.backgroundColor = UIColor.red
        Answer3.backgroundColor = UIColor.red
        Answer4.backgroundColor = UIColor.red
        */
        
        Answer1.setTitle(currQuestion!.Answer[0], for: .normal)
        Answer2.setTitle(currQuestion!.Answer[1], for: .normal)
        Answer3.setTitle(currQuestion!.Answer[2], for: .normal)
        Answer4.setTitle(currQuestion!.Answer[3], for: .normal)
        
        if (answer == currQuestion!.correctAnswer){
            appdata.shared.correctNum += 1
            self.view.viewWithTag(answer)?.backgroundColor = UIColor.green
            QuestionLabel.text = "Correct!!"
        } else {
            self.view.viewWithTag(answer)?.backgroundColor = UIColor.red
            self.view.viewWithTag(currQuestion!.correctAnswer)?.backgroundColor = UIColor.green
            QuestionLabel.text = "Incorrect!!"
        }
        
        self.navigationItem.title = appdata.shared.subjectTopic?.subjectTitle
        self.navigationItem.hidesBackButton = true
        CorrectLabel.text = "\(appdata.shared.correctNum) out of \(appdata.shared.questionNum) correct"
        
        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeleft))
        recognizer.direction = .left
        self.view .addGestureRecognizer(recognizer)
        
        let rightrecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swiperight))
        rightrecognizer.direction = .right
        self.view .addGestureRecognizer(rightrecognizer)
        
        

        // Do any additional setup after loading the view.
        
    }
    
    func swipeleft(recognizer : UISwipeGestureRecognizer) {
        segueChoice(self)
    }

    func swiperight(recognizer : UISwipeGestureRecognizer) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segueChoice(_ sender: Any) {
        if appdata.shared.questionNum >= (appdata.shared.subjectTopic?.questions.count)!{
            performSegue(withIdentifier: "finishedSegue", sender: self)
        } else {
            performSegue(withIdentifier: "continueSegue", sender: self)
        }
        
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
