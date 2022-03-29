//
//  ViewController.swift
//  Assignment4
//
//  Created by 任耀坤 on 3/28/22.
//

import UIKit

class ViewController: UIViewController, SendMessageDelegate, SendFirstAndLastNameDelegate {

    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toProfile(_ sender: Any) {
        performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue" {
            let getNameVC = segue.destination as! ProfileViewController
            guard let firstName = lblFirstName.text else {return}
            guard let lastName = lblLastName.text else {return}
            
            getNameVC.firstName = firstName
            getNameVC.lastName = lastName
            getNameVC.sendFirstAndLastNameDelegate = self
            
        }
    }
    
    func sendWelcomeMsg(message: String) {
        lblWelcome.text = message
    }
    
    func setFirstAndLastName(firstName: String, lastName: String) {
        lblFirstName.text = firstName
        lblLastName.text = lastName
    }
    
    func setWelcomeMsg(welcomMsg: String) {
        lblWelcome.text = welcomMsg
    }
    
}

