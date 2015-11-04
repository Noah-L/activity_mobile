//
//  ActivityListCell.swift
//  Badminton
//
//  Created by NOAH LI (EUCD-EUC-ISD-OOCLL/ZHA) on 10/28/15.
//  Copyright © 2015 OOCL. All rights reserved.
//

import UIKit

class ActivityListCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
