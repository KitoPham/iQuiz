//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by studentuser on 5/9/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    var subject : String?
    var total = 0
    var correct = 0
    
    var percent = 0.0
    
    @IBOutlet weak var StatLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = subject
        percent = Double(correct) / Double(total)
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
        percentLabel.text = String(round(percent * 100)) + "%"
        StatLabel.text = "\(correct) out of \(total)"
        
        
        // Do any additional setup after loading the view.
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
