//
//  TrackingOverviewCell.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/2/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit

class TrackingOverviewCell: UITableViewCell {

    @IBOutlet weak var numericLabel: UILabel!
    @IBOutlet weak var overviewTitleLabel: UILabel!
    @IBOutlet weak var lastActivtyTypeLabel: UILabel!
    @IBOutlet weak var activityTypeLabel: UIImageView!
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
