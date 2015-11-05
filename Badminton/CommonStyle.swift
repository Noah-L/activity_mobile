//
//  CommonStyle.swift
//  Badminton
//
//  Created by NOAH LI (EUCD-EUC-ISD-OOCLL/ZHA) on 11/5/15.
//  Copyright © 2015 OOCL. All rights reserved.
//

import UIKit

class CommonStyle: NSObject {
    static func setProjectCommonStyle(){
        let lightBlueTintColor = UIColor(red: 27.0/255, green: 152.0/255, blue: 144.0/255, alpha: 1)
        
        UINavigationBar.appearance().tintColor = lightBlueTintColor
        UITabBar.appearance().tintColor = lightBlueTintColor
        UIToolbar.appearance().tintColor = lightBlueTintColor
        
        
    }
}
