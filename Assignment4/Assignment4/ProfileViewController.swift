//
//  ProfileViewController.swift
//  Assignment4
//
//  Created by 任耀坤 on 3/28/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    
    var sendMsgDelegate: SendMessageDelegate?
    var sendFirstAndLastNameDelegate: SendFirstAndLastNameDelegate?
    var firstName: String?
    var lastName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let firstName = firstName else {return}
        guard let lastName = lastName else {return}
        
        txtFirstName.text = firstName
        txtLastName.text = lastName
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        guard let firstName = txtFirstName.text else {return}
        guard let lastName = txtLastName.text else {return}
        
        sendMsgDelegate?.sendWelcomeMsg(message: "Welcome: \(firstName), \(lastName)")
        sendFirstAndLastNameDelegate?.setWelcomeMsg(welcomMsg: "Welcome: \(firstName), \(lastName)")
        sendFirstAndLastNameDelegate?.setFirstAndLastName(firstName: firstName, lastName: lastName)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
