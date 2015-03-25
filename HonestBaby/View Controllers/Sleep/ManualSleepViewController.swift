//
//  ManualSleepViewController.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/24/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit
enum PickerViewShown {
    case None, DatePickerShown, DurationPickerShown
    
}
class ManualSleepViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerViewShown: PickerViewShown = .None
    var dateFormatter = NSDateFormatter()
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var durationPicker: UIPickerView!
    
    var saveButton  = UIButton()
    
    var originalButtonOriginY: CGFloat = 0.0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.setupDateFormatter()
        self.setupWithDate(NSDate())
        
    self.addSaveButton()
    }
    
    // MARK: Custom views methods 
    
    
    func addSaveButton(){
        
        saveButton = UIButton.buttonWithType(.Custom) as! UIButton
        
        saveButton.addTarget(self, action: "savePressed", forControlEvents: .TouchUpInside)
        let buttonHeight: CGFloat = 44.0
        
        
        let tableViewRect = NSStringFromCGRect(self.tableView.frame)
        let viewRect = NSStringFromCGRect(self.view.frame)

        
        println("tableView height: \(tableViewRect) view rect: \(viewRect)")
        
        var deltaY: CGFloat = 0
        
        if let navBarHeight = self.navigationController?.navigationBar.frame.height {
            deltaY = navBarHeight
        }
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        
        deltaY += statusBarHeight
        
        saveButton.frame = CGRectMake(0.0, self.tableView.bounds.size.height - CGFloat(buttonHeight), self.tableView.frame.width, buttonHeight)
        
        originalButtonOriginY = saveButton.frame.origin.y
        
        saveButton.backgroundColor = UIColor().honestGreen
        
        saveButton.setTitle("Save", forState: .Normal)
        self.view.insertSubview(saveButton, aboveSubview: self.tableView)
        
        
        
        
        
        
        }
    
    // MARK: - Helper Methods 
    
    func setupDateFormatter() {
        
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .MediumStyle
        
    }
    
    func setupWithDate(date: NSDate?){
        dateLabel.textColor = UIColor().teal
        
        if date != nil{
            
            dateLabel.text = dateFormatter.stringFromDate(date!)

        } else {
            
            let currentDate = NSDate()
            
            dateLabel.text = dateFormatter.stringFromDate(currentDate)
            
            
        }
        
        
    }
    
    func signupForKeyboardNotifications(){
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow", name: "UIKeyboardWillShowNotification", object: nil)
        
    }

    func keyboardWillShow(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        switch (indexPath.row, pickerViewShown) {
            
        case (0, _)  :
            return 44
        case (2 ,_):
            return 44
        case (_, .None):
            return 0
        case(1, .DatePickerShown):
            return 166
        case (3, .DurationPickerShown):
            return 166
        default:
            return 0
            }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch (indexPath.row, pickerViewShown) {
        case (0, .None) :
            self.showDatePicker()
        case (0, .DatePickerShown):
            self.hideDatePicker()
        case (0, .DurationPickerShown):
            self.hideDurationPicker()
            self.showDatePicker()
        case (2, .None) :
            self.showDurationPicker()
        case (2, .DatePickerShown):
            self.hideDatePicker()
            self.showDurationPicker()
        case (2, .DurationPickerShown):
            self.hideDurationPicker()
        default:
            break
        }
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //MARK: - Scroll view delegate
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let tableViewBounds = self.tableView.bounds
        var floatingButtonFrame = saveButton.frame
        floatingButtonFrame.origin.y = originalButtonOriginY + tableViewBounds.origin.y
        
        saveButton.frame = floatingButtonFrame
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Picker View helpers
    
    func showDatePicker(){
        
        pickerViewShown = .DatePickerShown
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()

        
        self.datePicker.hidden = false
        self.datePicker.alpha = 0.0
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.datePicker.alpha = 1
        })

        
        
        
    }
    
    func hideDatePicker(){
        pickerViewShown = .None
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
        self.datePicker.alpha = 0.0
        }) { (BOOL) -> Void in
        self.datePicker.hidden = false
        }
        
    }
    
    
    func showDurationPicker(){
        pickerViewShown = .DurationPickerShown
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
        self.durationPicker.hidden = false
        self.durationPicker.alpha = 0.0
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.durationPicker.alpha = 1
        })
        
        
        
    }
    
    func hideDurationPicker(){
        pickerViewShown = .None
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.durationPicker.alpha = 0.0
            }) { (BOOL) -> Void in
                self.durationPicker.hidden = false
        }
        
    }
    
    // Mark: Picker view IBActions
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        
        self.setupWithDate(sender.date)
        
    }
    
    
    // MArk: Picker View Delegate and data source
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 2
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        } else {
            return 60
        }
        
    }
    
    // returns width of column and height of row for each component.
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat{
        
        return 60
    }
    
//    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    
    // these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
    // for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
    // If you return back a different object, the old one will be released. the view will be centered in the row rect
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        switch (row, component){
        case (_,0):
            return String(row)+"h"
        case (_,1):
            return String(row)+"m"
        default:
            return ""
        }
    }
//    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? // attributed title is favored if both methods are implemented
//    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        
        let hours = pickerView.selectedRowInComponent(0)
        let minutes = pickerView.selectedRowInComponent(1)
        
        durationLabel.text = String(hours)+"h "+String(minutes)+"m"
        
    }

    
    //Mark: Save button 
    
    func savePressed(){
        println("save user data")
        
        self.performSegueWithIdentifier("UnwindToSleepingOverviewController", sender: self)
        

    }

}
