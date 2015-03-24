//
//  SleepingOverviewController.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/9/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit
import QuartzCore

enum SleepTimerState {
    case Stopped
    case Running
    
}

typealias sleepDataType = (startTime: NSDate, duration: NSTimeInterval)

class SleepingOverviewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var lastActivityLabel: UILabel!
    @IBOutlet weak var toggleTimer: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var sleepTimerState: SleepTimerState = .Stopped
    
    var sleepTimer: NSTimer? = NSTimer()
    
    var startTime: NSDate?
    
    var sleepDuration: NSTimeInterval?
    
    let dateFormatter: NSDateFormatter = NSDateFormatter()
    
    var data: [sleepDataType] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sleep"
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 4
        tableView.layer.borderColor = UIColor.clearColor().CGColor
        
//        tableView.tableHeaderView = ActivityDetailOverviewHeaderCell()
        
        




        // Do any additional setup after loading the view.
        
        self.setupDateFormatter()
        self.setupDataSource()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        if let navController = self.navigationController {
            
            navController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            navController.navigationBar.backgroundColor = UIColor.clearColor()
            navController.navigationBar.translucent  = true
            

            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Table view dataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SleepOverviewCell", forIndexPath: indexPath) as! SleepOverviewCell
        
        if  !data.isEmpty {

            cell.setupWithData(data[indexPath.row])
            
        }
        
        return cell
        
        
    }
    
    func tableView(tableView: UITableView,
    viewForHeaderInSection section: Int) -> UIView?{
        let headerView = ActivityDetailOverviewHeaderCell.loadFromNibNamed("ActivityDetailOverviewHeaderCell")
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 88
    }
    
//IBActions 
    
    @IBAction func toggleSleepTimer(sender: AnyObject) {
        
        switch sleepTimerState {
        case .Running:
            self.stoptimer()
        case .Stopped:
            self.startTimer()
            
            
        }
    }
    
    
    func stoptimer(){
        
        if let iuSleepTimer = sleepTimer {
            
            iuSleepTimer.invalidate()
            
            sleepTimer = nil
        }
        
        sleepTimerState = .Stopped
        
        toggleTimer.setTitle("Start Sleep Timer", forState: .Normal)
        
        
        
        
    }
    
    
    func startTimer(){
        
        startTime = NSDate()


        sleepTimer = NSTimer.scheduledTimerWithTimeInterval(Double(1/10), target: self, selector: "updatetimer", userInfo: nil, repeats: true)
        
        sleepTimerState = .Running
        
        toggleTimer.setTitle("Stop Sleep Timer", forState: .Normal)


        
        

        
        
        
    }
    
    func updatetimer() {
        
        let currentTime = NSDate()
        
        if let timerStartTime = startTime {
            
            var timeInterval = currentTime.timeIntervalSinceDate(timerStartTime)
            
            //calculate the hours, minutes and seconds in elapsed time.
            
            let hours = UInt8(timeInterval/3600)
            timeInterval -= (NSTimeInterval(hours) * 3600)
            
            let minutes = UInt8(timeInterval / 60.0)
            timeInterval -= (NSTimeInterval(minutes) * 60)
            
            let seconds = UInt8(timeInterval)
            timeInterval -= NSTimeInterval(seconds)
            

            
            //add the leading zero for minutes, seconds and millseconds and store them as string constants
            
            let strHours = hours > 9 ? String(hours) : "0" + String(hours)
            let strMinutes = minutes > 9 ? String(minutes) : "0" + String(minutes)
            let strSeconds = seconds > 9 ? String(seconds) : "0" + String(seconds)

            timerLabel.text = "\(strHours):\(strMinutes):\(strSeconds)"
            
            sleepDuration = timeInterval

            
        } else {
            println("No start Time")
        }
        
        
        
        }
    
    //initial data setup
    
    func setupDateFormatter() {
        
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        
        
    }
    
    func setupDataSource() {
        
        let sleepData1: sleepDataType = (NSDate(), NSTimeInterval.abs(60*60))
        let sleepData2: sleepDataType = (NSDate(), NSTimeInterval.abs(10*60))
        let sleepData3: sleepDataType = (NSDate(), NSTimeInterval.abs(200*60))
        
        
        let initialArray = [sleepData1, sleepData2, sleepData3]
        
        data = initialArray
        
//        data.sort({ $0.startDate.compare($1.startDate) == NSComparisonResult.OrderedAscending })

        
    }
    

    

}
