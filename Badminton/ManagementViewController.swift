//
//  ManagementViewController.swift
//  Badminton
//
//  Created by NOAH LI (EUCD-EUC-ISD-OOCLL/ZHA) on 10/27/15.
//  Copyright © 2015 OOCL. All rights reserved.
//

import UIKit

class ManagementViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("CO_TAB_TITLE_MANAGEMENT", comment: "")
        
        let addBarItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addButtonDidClick")
        self.navigationItem.rightBarButtonItem = addBarItem
    }
    
    func addButtonDidClick(){
        let createActivityViewController = CreateActivityViewController(nibName:"CreateActivityViewController",bundle:nil)
        let createNav = UINavigationController(rootViewController: createActivityViewController)
        self.presentViewController(createNav, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textFillCellID, forIndexPath: indexPath) as! TextFillCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
