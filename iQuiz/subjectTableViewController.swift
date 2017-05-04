//
//  subjectTableViewController.swift
//  iQuiz
//
//  Created by Kito T. Pham on 5/1/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit


class subjectTableViewController: UITableViewController {

    var subjectList : [subjectItem] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let topic1 = subjectItem("Mathematics", "This is a quiz about math", "mathicon")
        let topic2 = subjectItem("Marvel Super Heroes", "This is a quiz about marvel", "heroicon")
        let topic3 = subjectItem("Science", "This is a quiz about science", "scienceicon")
        
        subjectList = [topic1, topic2, topic3]

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
    

    @IBOutlet weak var subjectTableCell: subjectTableViewCell!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVc = segue.destination as! questionViewController
        let cell = sender as! subjectTableViewCell
        destinationVc.navigationItem.title = cell.TitleLabel.text
        
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
