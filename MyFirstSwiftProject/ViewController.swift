//
//  ViewController.swift
//  MyFirstSwiftProject
//
//  Created by Christian De Martino on 7/23/14.
//  Copyright (c) 2014 Christian De Martino. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
                            
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Store.sharedInstance.parseReddits()
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    
        return 3
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Default")
        cell.textLabel.text = "Hola"
        return  cell
    }

}

