//
//  ActivityDetialViewController.swift
//  Badminton
//
//  Created by NOAH LI (EUCD-EUC-ISD-OOCLL/ZHA) on 10/28/15.
//  Copyright © 2015 OOCL. All rights reserved.
//

import UIKit

class ActivityDetialViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let activiryDetailCellId = "ActivityDetailCell"
    let detailInfoCellId = "detailInfoCellId"
    let defaultCellId = "defalutCellId"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var attendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ActivityDetailCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(nib, forCellReuseIdentifier: activiryDetailCellId)
        
        self.navigationItem.title = NSLocalizedString("CREATE_ACTIVITY_DETAIL", comment: "")
        tableView.scrollEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 2
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return nil
        case 1:
            return nil
        case 2:
            return NSLocalizedString("CREATE_ACTIVITY_DETAIL", comment: "")
        default:
            return nil
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        switch indexPath.section{
        case 0:
            let cellForSection0 = tableView.dequeueReusableCellWithIdentifier(activiryDetailCellId, forIndexPath: indexPath) as! ActivityDetailCell
            
            switch indexPath.row{
            case 0:
                cellForSection0.iconImageView.image = UIImage(named: "location")
                cellForSection0.label.text = "珠海市第七中学"
            case 1:
                cellForSection0.iconImageView.image = UIImage(named: "clock")
                cellForSection0.label.text = "2015.10.30 9:30 - 2015.10.30 11:30"
            default:
                break
            }
            cell = cellForSection0
        case 1:
            cell = UITableViewCell(style: .Value1, reuseIdentifier: detailInfoCellId)
            cell.textLabel?.text = "截止时间:"
            cell.textLabel?.textColor = UIColor.redColor()
            cell.detailTextLabel?.text = "2015.10.28 17:00"
        case 2:
            cell = UITableViewCell()
            cell.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300)
            let detailInfoTextView = UITextView(frame: CGRect(x: 8, y: 0, width: cell.frame.width-8, height: cell.frame.height))
            cell.addSubview(detailInfoTextView)
            detailInfoTextView.font = UIFont(name: "Helvetica Neue", size: 14)
            detailInfoTextView.editable = false
            detailInfoTextView.text =
            "报名方式: \n按location分为一期二期三期四期报名参赛,每支队伍需提供【队名，口号，队伍合照，队长以及按不同参赛项目区分的队员名单】，竞技项目每人最多可兼报两项 (10.26-10.30)(先个人报名<deadline是10.30>，再推选队长或者由coordinator协调，制定参赛队伍名单)（团体报名包括：队伍名，location，队长，女双，男双，混双1，混双2，混双3,游戏者，裁判，队伍合照等信息，通过email方式发给committee，deadline是11.05）\n比赛项目\n竞技+娱乐\n竞技：1组男双+3组混双+1组女双\n娱乐：颠球踩点。\n比赛规则\n赛制：团体赛循环赛制（每支队伍都要和其他三支队伍进行比赛），采用印花计算方式，竞技比赛每赢一局获得七枚印花，娱乐项目通过一次活动一枚印花。\n团体排名：排名方式计算，优先级高到低：印花总数->竞技印花总数->竞技实际比分。"
        default:
            break
        }
        cell.selectionStyle = .None
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.section == 2 && indexPath.row == 0 ){
            return 300
        }else{
            return 44
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section == 0){
//            let headerView = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
//            headerView.font = UIFont(name: "Helvetica Neue", size: 20)
//            headerView.numberOfLines = 0;
//            headerView.text = "OOCL 2015羽毛球比赛"
//            headerView.textAlignment = .Center
//            return headerView;
            return nil
        }else{
            return nil
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==0){
            return CGFloat.min
        }else{
            return 0
        }
    }
    
    @IBAction func attendBtnDidClick(sender: UIButton) {
        
    }

}
