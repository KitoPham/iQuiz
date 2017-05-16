//
//  ViewController.swift
//  iQuiz
//
//  Created by Kito T. Pham on 5/1/17.
//  Copyright © 2017 Kito T. Pham. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var checkbutton: UIButton!
    @IBOutlet weak var edit: UIButton!
    @IBAction func editbutton(_ sender: Any) {
        if UrlTextField.isEditing || UrlTextField.isEnabled{
            UrlTextField.isEnabled = false
            edit.setTitle("Edit", for: UIControlState.normal)
            checkbutton.isEnabled = true
        } else {
            UrlTextField.isEnabled = true
            checkbutton.isEnabled = false
            edit.setTitle("Finish", for: UIControlState.normal)
        }
    }
    @IBOutlet weak var UrlTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UrlTextField.text = appdata.shared.webString
        
    }

    
    @IBAction func newUrl(_ sender: Any) {
        appdata.shared.webUrl = URL(string: UrlTextField.text!)
        appdata.shared.webString = UrlTextField.text!
    }
    @IBAction func reloadData(_ sender: Any) {
        
        let destination: DownloadRequest.DownloadFileDestination = {_, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("questions.json")
            
            return(fileURL, [.createIntermediateDirectories, .removePreviousFile])
        }
        if appdata.shared.webUrl != nil {
        Alamofire.download(appdata.shared.webUrl!, method: .get,to: destination).responseJSON{ response in
            debugPrint(response)
            switch response.result{
            case .success:
                let alert = UIAlertController(title:"settings", message:"download successful", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title:"close", style: UIAlertActionStyle.default, handler:nil))
                self.present(alert,animated:true, completion: nil)
            case .failure:
                let alert = UIAlertController(title:"settings", message:"download unsuccessful", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title:"close", style: UIAlertActionStyle.default, handler:nil))
                self.present(alert,animated:true, completion: nil)
            }
        }
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

