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

class CreateActivityViewController: UITableViewController,UITextFieldDelegate {
        
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
    }
    
    func closeView(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didCreateActivity(){
        print("create activity done")
    }
    
    func setTitles(){
        let titlesForSubjectSection = [NSLocalizedString("CREATE_ACTIVITY_SUBJECT", comment: "")]
        let titlesForTimeSection = [NSLocalizedString("CREATE_ACTIVITY_START_TIME", comment: ""),NSLocalizedString("CREATE_ACTIVITY_END_TIME", comment: ""),NSLocalizedString("CREATE_ACTIVITY_LAST_SIGN_UP_TIME", comment: "")]
        let titlesForLocationSection = [NSLocalizedString("CREATE_ACTIVITY_LOCATION", comment: "")]
        titles  = [titlesForSubjectSection,titlesForTimeSection,titlesForLocationSection]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (titles?.count)!
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let titlesForSection = titles![section]
        return titlesForSection.count;
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textFillCellID, forIndexPath: indexPath) as! TextFillCell
        
        let titlesForSection = titles![indexPath.section]
        cell.titleLabel?.text = titlesForSection[indexPath.row];
        cell.detailTextField.delegate = self
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! TextFillCell
        cell.detailTextField.becomeFirstResponder()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true;
    }
    
}
