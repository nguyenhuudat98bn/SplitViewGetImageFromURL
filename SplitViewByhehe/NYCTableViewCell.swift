//
//  NYCTableViewCell.swift
//  SplitViewByhehe
//
//  Created by nguyễn hữu đạt on 6/1/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class NYCTableViewCell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
