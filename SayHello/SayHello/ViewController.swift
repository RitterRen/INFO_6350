//
//  ViewController.swift
//  SayHello
//
//  Created by 任耀坤 on 3/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showName(_ sender: Any) {
        guard let firstName = firstNameField.text else {
            nameLabel.text = "Please Enter firstName.";
            
            return
        }
        guard let lastName = lastNameField.text else {
            nameLabel.text = "Please Enter lastName";
            
            return
        }
        
        nameLabel.text = "Hello \(firstName) \(lastName)";
    }
    
}

