//
//  SleepOverviewCell.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/9/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit

class SleepOverviewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var sleepTypeLabel: UILabel!
    
    @IBOutlet weak var sleepTypeImage: UIImageView!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWithData(sleepData: sleepDataType){
        
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "hh:MM a"

        
        let currentStartDate: NSDate = sleepData.startTime
        
        let endSleepDate = currentStartDate.dateByAddingTimeInterval(sleepData.duration)
        

        
        println("\(currentStartDate) - \(endSleepDate)")
        
        let calendar = NSCalendar.currentCalendar()
        let strtComponents = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: currentStartDate)
        let endComponents = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: endSleepDate)
        
        println("startComponents \(strtComponents))-\(endComponents))")

        
        


        
        

        
        
        
        
        timeLabel.text = "\(timeFormatter.stringFromDate(sleepData.startTime))-\(timeFormatter.stringFromDate(endSleepDate))"
        
        var timeInterval = sleepData.duration
        
        let hours = UInt8(timeInterval/3600)
        timeInterval -= (NSTimeInterval(hours) * 3600)
        
        let minutes = UInt8(timeInterval / 60.0)
        timeInterval -= (NSTimeInterval(minutes) * 60)
        
        if hours > 2 {
            sleepTypeLabel.text = "Sleep"
            
        } else {
            sleepTypeLabel.text = "Nap"
        }
        
        durationLabel.text = hours > 0 ? "\(hours)h \(minutes)m" : "\(minutes)m"
        
        
        
        
        
        
        
        
        
    }

}
