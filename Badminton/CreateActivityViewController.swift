//
//  CreateActivityViewController.swift
//  Badminton
//
//  Created by NOAH LI (EUCD-EUC-ISD-OOCLL/ZHA) on 10/26/15.
//  Copyright © 2015 OOCL. All rights reserved.
//

import UIKit

let reuseIdentifier = "reuseIdentifier"
let textFillCellID = "TextFillCell"

var titles:Array<Array<String>>?

var subject:String?
var startTime:NSDate?
var endTime:NSDate?
var signUpEndTime:NSDate?
var location:String?

class CreateActivityViewController: UITableViewController,UITextFieldDelegate,UITextViewDelegate {
    var datePickerView: UIView?
    var datePicker: UIDatePicker?
    var startTimeTextField:UITextField?
    var endTimeTextField:UITextField?
    var cutOffTextField:UITextField?
    var selectedTextField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:reuseIdentifier)
        let nib = UINib(nibName: "TextFillCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(nib, forCellReuseIdentifier: "TextFillCell")
        self.navigationItem.title = NSLocalizedString("CREATE_ACTIVITY_TITLE", comment: "")
        self.setTitles()
        
        let closeBarItem = UIBarButtonItem(title: NSLocalizedString("CO_NAV_CLOSE", comment: ""), style: UIBarButtonItemStyle.Plain, target: self, action: "closeView")
        let doneBarItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "didCreateActivity");
        self.navigationItem.leftBarButtonItem = closeBarItem
        self.navigationItem.rightBarButtonItem = doneBarItem
        
        self.tableView.tableFooterView = nil
    }
    
    func closeView(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didCreateActivity(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setTitles(){
        let titlesForSubjectSection = [NSLocalizedString("CREATE_ACTIVITY_SUBJECT", comment: "")]
        let titlesForTimeSection = [NSLocalizedString("CREATE_ACTIVITY_START_TIME", comment: ""),NSLocalizedString("CREATE_ACTIVITY_END_TIME", comment: ""),NSLocalizedString("CREATE_ACTIVITY_LAST_SIGN_UP_TIME", comment: "")]
        let titlesForLocationSection = [NSLocalizedString("CREATE_ACTIVITY_LOCATION", comment: "")]
        let titlesForDetailSection = [""]
        titles  = [titlesForSubjectSection,titlesForTimeSection,titlesForLocationSection, titlesForDetailSection]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (titles?.count)!
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 3{
            return NSLocalizedString("CREATE_ACTIVITY_DETAIL", comment: "")
        }else{
            return nil
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let titlesForSection = titles![section]
        return titlesForSection.count;
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        if indexPath.section == 3{
            cell = UITableViewCell()
            let detailTextView = UITextView()
            detailTextView.text = "Test"
            detailTextView.delegate = self;
            cell?.contentView.addSubview(detailTextView)
            detailTextView.translatesAutoresizingMaskIntoConstraints = false
            let leadingConstraint = NSLayoutConstraint(item: detailTextView, attribute: .Leading, relatedBy: .Equal, toItem: cell, attribute: .Leading, multiplier: 1, constant: 8)
            let traingConstraint = NSLayoutConstraint(item: detailTextView, attribute: .Trailing, relatedBy: .Equal, toItem: cell?.contentView, attribute: .Trailing, multiplier: 1, constant: -8)
            let topConstraint = NSLayoutConstraint(item: detailTextView, attribute: .Top, relatedBy: .Equal, toItem: cell, attribute: .Top, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: detailTextView, attribute: .Bottom, relatedBy: .Equal, toItem: cell, attribute: .Bottom, multiplier: 1, constant: 0)
            cell?.addConstraints([leadingConstraint,traingConstraint,topConstraint,bottomConstraint])
        }else{
            let fillCell = tableView.dequeueReusableCellWithIdentifier(textFillCellID, forIndexPath: indexPath) as! TextFillCell
            
            let titlesForSection = titles![indexPath.section]
            fillCell.titleLabel?.text = titlesForSection[indexPath.row];
            fillCell.detailTextField.delegate = self
            
            if indexPath.section == 1 {
                switch(indexPath.row){
                case 0:
                    startTimeTextField = fillCell.detailTextField
                case 1:
                    endTimeTextField = fillCell.detailTextField
                case 2:
                    cutOffTextField = fillCell.detailTextField
                default:
                    break;
                }
                
                if datePickerView == nil{
                    datePickerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 250))
                    datePickerView!.backgroundColor = UIColor.whiteColor()
                    
                    let datePickerToolBar = UIToolbar()
                    let cancelItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "pickDateCancel")
                    let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: "")
                    let doneItem =  UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "pickDateDone")
                    datePickerToolBar.items = [cancelItem,flexSpaceItem,doneItem]
                    datePickerToolBar.backgroundColor = UIColor.whiteColor()
                    datePickerToolBar.translatesAutoresizingMaskIntoConstraints = false
                    datePickerToolBar.translucent = false
                    datePickerView!.addSubview(datePickerToolBar)
                    
                    datePicker = UIDatePicker()
                    datePicker!.datePickerMode = .DateAndTime
                    datePickerView!.addSubview(datePicker!)
                    datePicker!.backgroundColor = UIColor.whiteColor()
                    datePicker!.translatesAutoresizingMaskIntoConstraints = false
                    let barTopCons = NSLayoutConstraint(item: datePickerToolBar, attribute: .Top, relatedBy: .Equal, toItem: datePickerView, attribute: .Top, multiplier: 1, constant: 0)
                    let barLeftCons = NSLayoutConstraint(item: datePickerToolBar, attribute: .Leading, relatedBy: .Equal, toItem: datePickerView, attribute: .Leading, multiplier: 1, constant: 0)
                    let barRightCons = NSLayoutConstraint(item: datePickerToolBar, attribute: .Trailing, relatedBy: .Equal, toItem: datePickerView, attribute: .Trailing, multiplier: 1, constant: 0)
                    
                    let pickerTopCons = NSLayoutConstraint(item: datePicker!, attribute: .Top, relatedBy: .Equal, toItem: datePickerToolBar, attribute: .Bottom, multiplier: 1, constant: 0)
                    let pickekXCons = NSLayoutConstraint(item: datePicker!, attribute: .CenterX, relatedBy: .Equal, toItem: datePickerView, attribute: .CenterX, multiplier: 1, constant: 0)
                    let pickerBottomCons = NSLayoutConstraint(item: datePicker!, attribute: .Bottom, relatedBy: .Equal, toItem: datePickerView, attribute: .Bottom, multiplier: 1, constant: 0)
                    
                    datePickerView!.addConstraints([barTopCons,barLeftCons,barRightCons,pickerTopCons,pickekXCons,pickerBottomCons])
                }
            
                fillCell.detailTextField.inputView = datePickerView
            }
            cell = fillCell
        }

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 3 {
            
        }else{
            
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! TextFillCell
            cell.detailTextField.becomeFirstResponder()
            
            if indexPath.section == 1{
                selectedTextField = cell.detailTextField
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 3{
            return 200
        }else{
            return 44
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true;
    }
    
    func pickDateCancel(){
        print("cancel")
        startTimeTextField?.endEditing(true)
        endTimeTextField?.endEditing(true)
        cutOffTextField?.endEditing(true)
    }
    
    func pickDateDone(){
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm"
        selectedTextField?.text = formatter.stringFromDate((datePicker?.date)!)
        selectedTextField?.endEditing(true)
    }
    
}
