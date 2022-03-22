//
//  ViewController.swift
//  CustomTableCell
//
//  Created by 任耀坤 on 3/21/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let images = ["Hamburger", "HogDog", "Noodles", "Pizza", "SandWinch", "Steak"]
    let names = ["Hamburger", "HotDog", "Noodles", "Pizza", "SandWinch", "Steak"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return images.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.img.image = UIImage(named: images[indexPath.row])
        
        cell.label.text = names[indexPath.row]
        
        return cell
    }

}

