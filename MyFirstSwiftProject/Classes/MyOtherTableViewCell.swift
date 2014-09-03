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
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }

    override func layoutSubviews() {
        redditTitle.preferredMaxLayoutWidth = redditTitle.bounds.width
        self.contentView.layoutIfNeeded()
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
