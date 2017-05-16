//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by studentuser on 5/9/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    
    var percent = 0.0
    
    @IBOutlet weak var StatLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = appdata.shared.subjectTopic?.subjectTitle
        percent = Double(appdata.shared.correctNum) / Double(appdata.shared.questionNum)
        navigationItem.hidesBackButton = true
        if percent == 1{
            DescriptionLabel.text = "Perfect!"
        } else if percent > 0.75{
            DescriptionLabel.text = "Good Job!"
        } else if percent > 0.50 {
            DescriptionLabel.text = "You're getting there!"
        } else {
            DescriptionLabel.text = "Yikes!"
        }
        percentLabel.text = String(round(percent * 10000)/100) + "%"
        StatLabel.text = "\(appdata.shared.correctNum) out of \(appdata.shared.questionNum)"
        
        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        recognizer.direction = .right
        self.view .addGestureRecognizer(recognizer)
        
        let leftrecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        leftrecognizer.direction = .left
        self.view .addGestureRecognizer(leftrecognizer)
        
        appdata.shared.questionNum = 0
        appdata.shared.correctNum = 0
        
        
        // Do any additional setup after loading the view.
    }
    
    func swipeRight(recognizer : UISwipeGestureRecognizer) {
        goBack(self)
    }
    
    func swipeLeft(recognizer : UISwipeGestureRecognizer) {
        goBack(self)
    }


    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
