//
//  AppDelegate.swift
//  Badminton
//
//  Created by NOAH LI (EUCD-EUC-ISD-OOCLL/ZHA) on 10/21/15.
//  Copyright © 2015 OOCL. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        CommonStyle.setProjectCommonStyle()
        
        // Override point for customization after application launch.
        let rootViewController = ActivityListTableViewController(nibName: "ActivityListTableViewController",bundle: nil)
        rootViewController.tabBarItem.title = NSLocalizedString("CO_TAB_TITLE_ACTIVITY", comment: "")
        rootViewController.tabBarItem.image = UIImage(named: "activity")
        let rootNavController = UINavigationController(rootViewController: rootViewController)
        
        let accountController = AccountViewController(nibName:"AccountViewController",bundle: nil)
        accountController.tabBarItem.title = NSLocalizedString("CO_TAB_TITLE_ACCOUNT", comment: "")
        accountController.tabBarItem.image = UIImage(named: "setting")
        let accountNav = UINavigationController(rootViewController: accountController)
        
        let manageController = ManagementViewController(nibName:"ManagementViewController",bundle: nil)
        manageController.tabBarItem.title = NSLocalizedString("CO_TAB_TITLE_MANAGEMENT", comment: "")
        manageController.tabBarItem.image = UIImage(named: "favorite")
        let manageNav = UINavigationController(rootViewController: manageController)
        
        let tabbarController = UITabBarController()
        tabbarController.setViewControllers([rootNavController,manageNav,accountNav], animated: true)
        
        self.window?.rootViewController = tabbarController;
        self.window?.makeKeyAndVisible();
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

