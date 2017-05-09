//
//  subjectTableViewController.swift
//  iQuiz
//
//  Created by Kito T. Pham on 5/1/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit
import Alamofire


class subjectTableViewController: UITableViewController {

    var subjectList : [subjectItem] = []
    var subjectNum = 0
    
    @IBOutlet var tableViewObject: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableViewObject.delegate = self
        self.tableViewObject.dataSource = self
        
        let url = URL(string: "https://tednewardsandbox.site44.com/questions.json")
        Alamofire.request(url!).responseJSON{ response in
            debugPrint(response)
            
            
            if let json = response.result.value as? [[String:Any]]{
                for index in 0...json.count - 1{
                    let title = json[index]["title"] as! String
                    let description = json[index]["desc"] as!String
                    let questions = json[index]["questions"] as! [[String:Any]]
                    var questionList : [QuestionObject] = []
                    for num in 0...questions.count - 1{
                        let question = questions[num]["text"] as! String
                        let correctAnswer = questions[num]["answer"] as! String
                        let answers = questions[num]["answers"] as! [String]
                        questionList.append(QuestionObject(Int(correctAnswer)!, question, answers))
                    }
                    
                    self.subjectList.append(subjectItem(title, description, "mathicon"))
                    self.subjectList[index].questions = questionList
                    
                }
                /*print("JSON: \(json)")*/
            }
            self.tableView.reloadData()
        }
       
        
        
        
        
       /* let topic1 = subjectItem("Mathematics", "This is a quiz about math", "mathicon")
        let QuestionOne = QuestionObject(4, "What is 2+2", ["1", "2", "3", "4"])
        let QuestionTwo = QuestionObject(2, "What is 1+1", ["1", "2", "3", "4"])
        topic1.questions = [QuestionOne,QuestionTwo]
        let topic2 = subjectItem("Marvel Super Heroes", "This is a quiz about marvel", "heroicon")
        let QuestionOne1 = QuestionObject(4, "Who is cool", ["superman", "batman", "green arrow", "captain america"])
        let QuestionTwo2 = QuestionObject(2, "Who wears a metal suit", ["hulk", "ironman", "hawkeye", "red hulk"])
        topic2.questions = [QuestionOne1, QuestionTwo2]
        let topic3 = subjectItem("Science", "This is a quiz about science", "scienceicon")
        topic3.questions=[QuestionObject(1, "e = ?", ["mc^2", "pi", "2", "avogadro's number"])]
        self.subjectList.append(topic1)
        self.subjectList.append(topic2)
        self.subjectList.append(topic3)*/
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subjectList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subjectCell", for: indexPath) as! subjectTableViewCell

        let subjectItem = self.subjectList[indexPath.row]
        cell.TitleLabel.text = subjectItem.subjectTitle
        cell.descriptionLabel.text = subjectItem.descriptionText
        cell.imageObject.image = UIImage(named: subjectItem.icon)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("cell # \(indexPath.row) selected")
        
        subjectNum = indexPath.row
            let questionView = self.storyboard?.instantiateViewController(withIdentifier: "questionScene") as! questionViewController
            
            questionView.subjectTopic = self.subjectList[subjectNum]
            self.navigationController?.pushViewController(questionView, animated: true)
            //self.performSegue(withIdentifier: "ToQuestion", sender: self)
    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let questionView = segue.destination as! questionViewController
        questionView.subjectTopic = subjectList[subjectNum]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
