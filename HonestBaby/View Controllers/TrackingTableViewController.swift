//
//  TrackingTableViewController.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/2/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit
enum TableViewCellType{
    case ChildView, TrackingOptions, TrackingOverview, Unknown
    
    static func getTypeForIndex(indexPath:NSIndexPath) -> TableViewCellType {
        
        switch indexPath.row {
        case 0:
            return  .ChildView
        case 1:
            return .TrackingOptions
        case 2,3,4:
            return .TrackingOverview
        default:
            return .Unknown
            
        }
        
    }
}

enum TrackingOptions {
    case Moments, Activity, Medical
    
    static func segueForTrackingOption(trackingOption: TrackingOptions, indexPath: NSIndexPath)->String?{
        switch (trackingOption, indexPath.row) {
        case let (currentOption, _) where currentOption == .Moments:
            return "MomentsDetailSegue"
        case let (currentOption, rowIndex) where currentOption == .Activity:
            switch rowIndex {
            case 2:
                return "FeedingOverviewSegue"
            case 3:
                return "SleepingOverviewSegue"
            case 4:
                return "DiaperOverviewSegue"
            default:
                return nil
            }
        case let (currentOption, rowIndex) where currentOption == .Medical:
            switch rowIndex {
            case 2:
                return "DoctorVisitOverviewSegue"
            case 3:
                return "GrowthOverviewSegue"
            case 4:
                return "MedicineOverviewSegue"
            default:
                return nil
            }
        default:
            return nil
        }
    }
}

class TrackingTableViewController: UITableViewController {
    var currentTrackingOption = TrackingOptions.Activity {
        didSet{
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 5
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let type = TableViewCellType.getTypeForIndex(indexPath)
        
        switch type {
        case .ChildView:
            return 258
        case .TrackingOptions:
            return 44
        case .TrackingOverview:
            return 78
        case .Unknown:
            return 0
            
    }
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        
        println("\(indexPath.row)")
        
        
        let type = TableViewCellType.getTypeForIndex(indexPath)

        
//        switch type {
//        case .ChildView:
//            let cell = tableView.dequeueReusableCellWithIdentifier("ChildViewCell", forIndexPath: indexPath) as! ChildViewCell
//
//        case .TrackingOptions:
//            let cell = tableView.dequeueReusableCellWithIdentifier("TrackingOptionsCell", forIndexPath: indexPath) as! TrackingOptionsCell
//
//        case .TrackingOverview:
//            let cell = tableView.dequeueReusableCellWithIdentifier("TrackingOverviewCell", forIndexPath: indexPath) as! TrackingOverviewCell
//
//        case .Unknown:
////            let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
//            let cell = UITableViewCell()
//            cell.frame = CGRectNull
//
//            
//        }
        var cell = UITableViewCell()
        
        if type == .ChildView{
            cell = tableView.dequeueReusableCellWithIdentifier("ChildViewCell", forIndexPath: indexPath) as! ChildViewCell

            
        } else if type == .TrackingOptions {
            
            cell = tableView.dequeueReusableCellWithIdentifier("TrackingOptionsCell", forIndexPath: indexPath) as! TrackingOptionsCell

        } else if type == .TrackingOverview {
            
            cell = tableView.dequeueReusableCellWithIdentifier("TrackingOverviewCell", forIndexPath: indexPath) as! TrackingOverviewCell

            
        } else if type == .Unknown {
            cell = UITableViewCell()

        } else {
            cell = UITableViewCell()

            
        }
        
        
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        let type = TableViewCellType.getTypeForIndex(indexPath)
        
        switch type {
        case .ChildView, .TrackingOptions, .Unknown:
            return false
        case .TrackingOverview:
            return true
            
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let cellType = TableViewCellType.getTypeForIndex(indexPath)

        
        switch (cellType, self.currentTrackingOption) {
        case let (type, _) where type == .ChildView:
            break
        case let (type, _) where type == .TrackingOptions:
            break
        case let (type, _) where type == .Unknown:
            break
        case (.TrackingOverview, _):
            if let segue = TrackingOptions.segueForTrackingOption(self.currentTrackingOption, indexPath: indexPath){
            println("\(segue)")
            }
        default:
            break
            
        
            
            
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

    }
    
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    func showAlertViewForTrackingOption(trackingOption: TrackingOptions){
        
    }

}
