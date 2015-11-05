//
//  ActivityFilterController.swift
//  Badminton
//
//  Created by NOAH LI (EUCD-EUC-ISD-OOCLL/ZHA) on 11/5/15.
//  Copyright © 2015 OOCL. All rights reserved.
//

import UIKit

class ActivityFilterController: UITableViewController {
    let cellId = "standardCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.navigationItem.title = NSLocalizedString("FILTER_NAV_TITLE", comment: "")
        
        let applyBtn = UIBarButtonItem(title: NSLocalizedString("CO_NAV_APPLY", comment: ""), style: .Plain, target: self, action: "applyFilter")
        let closeBtn = UIBarButtonItem(title: NSLocalizedString("CO_NAV_CLOSE", comment: ""), style: .Plain, target: self, action: "close")
        self.navigationItem.rightBarButtonItem = applyBtn;
        self.navigationItem.leftBarButtonItem = closeBtn;
    }
    
    func applyFilter(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func close(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 2:
            return 2
        default:
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return NSLocalizedString("FILTER_SORT", comment: "")
        case 1:
            return NSLocalizedString("FILTER_CLUB", comment: "")
        case 2:
            return NSLocalizedString("FILTER_START_DATE", comment: "")
        default:
            return nil;
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell?

        
        switch indexPath.section{
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
            if indexPath.row == 0{
                cell?.textLabel?.text = NSLocalizedString("SORT_BY_NONE", comment: "")
            }
            cell?.accessoryType = .DisclosureIndicator
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
            if indexPath.row == 0{
                cell?.textLabel?.text = NSLocalizedString("FILTER_ALL_CLUB", comment: "")
            }
            cell?.accessoryType = .DisclosureIndicator
        case 2:
            cell = tableView.dequeueReusableCellWithIdentifier("detailCell")
            if cell==nil{
                cell = UITableViewCell(style: .Value1, reuseIdentifier: "detailCell")
            }
            
            switch indexPath.row{
            case 0:
                cell?.textLabel?.text = NSLocalizedString("FILTER_FROM", comment: "")
                cell?.detailTextLabel?.text = "2015/10/11"
            case 1:
                cell?.textLabel?.text = NSLocalizedString("FILTER_TO", comment: "")
                cell?.detailTextLabel?.text = "2015/10/12"
            default:
                break
            }
        case 3:
            cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
            cell?.textLabel?.text = NSLocalizedString("FILTER_SIGN_UP", comment: "")
            
            let attendOnlySwitch = UISwitch()
            attendOnlySwitch.onTintColor = UIColor(red: 224.0/255, green: 16.0/255, blue: 101.0/255, alpha: 1)
            cell?.accessoryView = attendOnlySwitch
            cell?.selectionStyle = .None
        case 4:
            cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
            let resetLabel = UILabel()
            resetLabel.translatesAutoresizingMaskIntoConstraints = false
            cell!.contentView.addSubview(resetLabel)
            let resetCenterYConstrain = NSLayoutConstraint(item: resetLabel, attribute: .CenterY, relatedBy: .Equal, toItem: cell!.contentView, attribute: .CenterY, multiplier: 1, constant: 0)
            let resetCenterXConstrain = NSLayoutConstraint(item: resetLabel, attribute: .CenterX, relatedBy: .Equal, toItem: cell!.contentView, attribute: .CenterX, multiplier: 1, constant: 0)
            
            resetLabel.text = NSLocalizedString("FILTER_RESET", comment: "")
            resetLabel.textColor = UIColor.redColor()
            cell!.contentView.addConstraints([resetCenterXConstrain,resetCenterYConstrain])
            
        default:
            break
        }
        cell?.textLabel?.textColor = UIColor.darkGrayColor()
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
}
