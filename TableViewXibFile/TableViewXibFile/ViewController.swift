//
//  ViewController.swift
//  TableViewXibFile
//
//  Created by 任耀坤 on 3/26/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name: String?

    let arr = ["Hamburger", "HogDog", "Noodles", "Pizza", "SandWinch", "Steak"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.imgView.image = UIImage(named: arr[indexPath.row])
        cell.label.text = arr[indexPath.row]
        
        return cell
    }

}

