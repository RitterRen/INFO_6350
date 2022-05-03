//
//  ViewController.swift
//  FinalBMICalculator
//
//  Created by 任耀坤 on 5/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var txtFeet: UITextField!
    
    @IBOutlet weak var txtInches: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateBMIAction(_ sender: Any) {
        guard let weightStr = txtWeight.text else {return}
        let weight = Double(weightStr)
        guard let feetStr = txtFeet.text else {return}
        let feet = Double(feetStr) ?? 0
        guard let inchesStr = txtInches.text else {return}
        guard let inches = Double(weightStr) else { return }
        let height = (feet ?? 0)! * 12 + (inches ?? 0)!
        
        result.text = ("Your BMI:\(height)")
    }
    
    
}

