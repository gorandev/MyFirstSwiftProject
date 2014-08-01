//
//  MyOtherTableViewCell.swift
//  MyFirstSwiftProject
//
//  Created by Christian De Martino on 8/1/14.
//  Copyright (c) 2014 Christian De Martino. All rights reserved.
//

import UIKit

class MyOtherTableViewCell: UITableViewCell {

    @IBOutlet weak var redditTitle: UILabel!
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
