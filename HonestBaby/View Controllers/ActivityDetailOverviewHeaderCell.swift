//
//  ActivityDetailOverviewHeaderCell.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/9/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit

protocol ActivityDetailOverviewHeaderCellDelegate: class {
    func userPressedAdd()
    func userPressedmoreInfo()
    func userPressedNextDay()
    func userPressedPreviousDay()
    
}

class ActivityDetailOverviewHeaderCell: UIView {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var nextDayButton: UIButton!
    @IBOutlet weak var previousDayButton: UIButton!
    
    weak var delegate: ActivityDetailOverviewHeaderCellDelegate?
    
    @IBAction func addbuttonPressed(sender: UIButton) {
        
        if let iuDelegate = self.delegate {
            iuDelegate.userPressedAdd()
        }
    }
    
    


    
    

    
    

    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
