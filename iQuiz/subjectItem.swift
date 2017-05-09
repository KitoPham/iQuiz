//
//  SubjectItem.swift
//  iQuiz
//
//  Created by Kito T. Pham on 5/1/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit

class subjectItem: NSObject {
    
    var questions : [QuestionObject] = []
    var subjectTitle : String = ""
    var descriptionText : String = ""
    var icon : String = ""
    var iconImage : UIImage?
    

    
    init(_ subject : String, _ description : String, _ icon : String){
        subjectTitle = subject
        descriptionText = description
        self.icon = icon
    }

}
