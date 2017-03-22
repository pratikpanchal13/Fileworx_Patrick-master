//
//  AppDelegate.swift
//  Fileworx_Patrick
//
//  Created by indianic on 03/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import MMDrawerController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let rootViewController = self.window?.rootViewController
//        let mainStoryboard :UIStoryboard = UIStoryboard(name: "LoginSplash", bundle: nil)
//        
//        
//        let centerViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        
//        
//        let leftViewController = mainStoryboard.instantiateViewController(withIdentifier: "FWLeftSideMenu") as! FWLeftSideMenu
//        let rightViewController = mainStoryboard.instantiateViewController(withIdentifier: "MediaVC") as! MediaVC
//        
//        let leftSideNav = UINavigationController(rootViewController: leftViewController)
//        let centerNav = UINavigationController(rootViewController: centerViewController)
//        let rightNav = UINavigationController(rootViewController: rightViewController)
//        
//        centerContainer = MMDrawerController(center: centerNav, leftDrawerViewController: leftSideNav,rightDrawerViewController:nil)
//        //        centerContainer!.openDrawerGestureModeMask = MMOpenDrawerGestureMode.panningCenterView;
//        //        centerContainer!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.panningCenterView;
//        
//        
//        
//        centerContainer?.setMaximumLeftDrawerWidth((self.window?.frame.size.width)! * 0.8, animated: false, completion: nil)
//        centerContainer?.restorationIdentifier = "MMDrawer"
//        centerContainer?.openDrawerGestureModeMask = .all
//        centerContainer?.closeDrawerGestureModeMask = .all
//        centerContainer?.showsShadow = true
////        centerContainer?.shadowColor = UIColor.gray
//        
//        
//        window!.rootViewController = centerContainer
//        window!.makeKeyAndVisible()

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

