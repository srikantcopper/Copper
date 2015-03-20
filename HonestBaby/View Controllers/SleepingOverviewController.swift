//
//  SleepingOverviewController.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/9/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit
import QuartzCore

class SleepingOverviewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var lastActivityLabel: UILabel!
    @IBOutlet weak var toggleTimer: UIButton!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sleep"
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 4
        tableView.layer.borderColor = UIColor.clearColor().CGColor
        
//        tableView.tableHeaderView = ActivityDetailOverviewHeaderCell()
        
        




        // Do any additional setup after loading the view.
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
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SleepOverviewCell", forIndexPath: indexPath) as! SleepOverviewCell
        
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
    
    
    
    
    

}
