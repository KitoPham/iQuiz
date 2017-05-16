//
//  data.swift
//  iQuiz
//
//  Created by studentuser on 5/16/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit
import Alamofire

class appdata: NSObject {
    

    var subjectList : [subjectItem] = []
    static let shared = appdata()
    var webString = "https://tednewardsandbox.site44.com/questions.json"
    var webUrl = URL(string: "https://tednewardsandbox.site44.com/questions.json")
    var subjectTopic: subjectItem?
    var questionNum = 0
    var correctNum = 0
    
    var json : [[String:Any]] = []
    
    override init(){
        super.init()
        
    }
    
    func loadJson(){
        json = []
        let content = NSData(contentsOf: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("questions.json"))
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("questions.json"))
        
        if content != nil{
            do{
                self.json = try JSONSerialization.jsonObject(with: content! as Data, options:[]) as! [[String:Any]]
            } catch {
                print("ERROR ERROR FILE NOT FOUND")
            }
        }
        
        appdata.shared.subjectList = []
        if json.count > 0 {
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
                
                appdata.shared.subjectList.append(subjectItem(title, description, "mathicon"))
                appdata.shared.subjectList[index].questions = questionList
                
            }
        }
    }
}
