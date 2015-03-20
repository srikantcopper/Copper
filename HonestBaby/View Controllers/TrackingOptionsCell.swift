//
//  TrackingOptionsCell.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/2/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit
//enum ButtonType {
//    case Moments, Medical, Activity
//    
//}

protocol TrackingOptionsCellDelegate {
    
    func switchToViewForTrackingOption(trackingOption: TrackingOptions)
    
}

class TrackingOptionsCell: UITableViewCell {
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var momentsButton: UIButton!
    @IBOutlet weak var medicalButton: UIButton!
    
    var delegate: TrackingOptionsCellDelegate?


    
    @IBAction func pressedTrackingOptionsButton(sender: UIButton) {
        
        println("pressed button \(sender.titleLabel!.text)")
        

        
        switch sender {
        case activityButton:
            selectedOptionType = .Activity
        case momentsButton:
            selectedOptionType = .Moments
        case medicalButton:
            selectedOptionType = .Medical

        default:
            break
        }
        

        

            
        delegate?.switchToViewForTrackingOption(self.selectedOptionType)
            
            

    }
    var selectedOptionType: TrackingOptions = .Activity {
        didSet{
            
            switch selectedOptionType {
            case .Activity:
                activityButton.setTitleColor(UIColor().teal, forState: .Normal)
                momentsButton.setTitleColor(UIColor().grey, forState: .Normal)
                medicalButton.setTitleColor(UIColor().grey, forState: .Normal)
            case .Medical:
                activityButton.setTitleColor(UIColor().grey, forState: .Normal)
                momentsButton.setTitleColor(UIColor().grey, forState: .Normal)
                medicalButton.setTitleColor(UIColor().teal, forState: .Normal)
            case .Moments:
                activityButton.setTitleColor(UIColor().grey, forState: .Normal)
                momentsButton.setTitleColor(UIColor().teal, forState: .Normal)
                medicalButton.setTitleColor(UIColor().grey, forState: .Normal)
                
            }
            
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        activityButton.setTitleColor(UIColor().teal, forState: .Normal)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
