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
    
    private var reddits = [Reddit]()
                            
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.estimatedRowHeight = 80
        
        // Do any additional setup after loading the view, typically from a nib.
        Store.sharedInstance.parseReddits({ (response:[Reddit]) -> Void in
            
            self.reddits = response
            self.tableView.reloadData()
            
        })
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    
        return reddits.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
      var cell = self.tableView.dequeueReusableCellWithIdentifier("MyOtherIdentifier", forIndexPath: indexPath) as MyOtherTableViewCell
        cell.redditTitle.text = reddits[indexPath.row].redditTitle
        return  cell
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        
        // Dequeue a cell for the particular layout required (you will likely need to substitute
        // the reuse identifier dynamically at runtime, instead of a static string as below).
        // Note that this method will init and return a new cell if there isn't one available in the reuse pool,
        // so either way after this line of code you will have a cell with the correct constraints ready to go.
        var cell = self.tableView.dequeueReusableCellWithIdentifier("MyOtherIdentifier") as MyOtherTableViewCell
        //[cell layoutIfNeeded];
        // Configure the cell with content for the given indexPath, for example:
        // cell.textLabel.text = someTextForThisCell;
        // ...
        
        // Set the width of the cell to match the width of the table view. This is important so that we'll get the
        // correct cell height for different table view widths if the cell's height depends on its width (due to
        // multi-line UILabels word wrapping, etc). We don't need to do this above in -[tableView:cellForRowAtIndexPath]
        // because it happens automatically when the cell is used in the table view.
        // Also note, the final width of the cell may not be the width of the table view in some cases, for example when a
        // section index is displayed along the right side of the table view. You must account for the reduced cell width.
     
        //cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
        
        var redditEntry = self.reddits[indexPath.row];
        cell.redditTitle.text = redditEntry.redditTitle;
        
        // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints.
        // (Note that you must set the preferredMaxLayoutWidth on multi-line UILabels inside the -[layoutSubviews] method
        // of the UITableViewCell subclass, or do it manually at this point before the below 2 lines!)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        var height = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        return height;
    }

}

