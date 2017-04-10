//
//  FWUtilityDrawer.swift
//  Fileworx_Patrick
//
//  Created by indianic on 22/03/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import Foundation

import MMDrawerController

class FWUtilityDrawer
{
    var centerContainer : MMDrawerController?
    static let sharedInstance = FWUtilityDrawer()

    func loginToDrawerFrom(_ controller : UIViewController,animated: Bool){

        let mainStoryboard :UIStoryboard = UIStoryboard(name: "LoginSplash", bundle: nil)
        
        
        let centerViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        
        
        let leftViewController = mainStoryboard.instantiateViewController(withIdentifier: "FWLeftSideMenu") as! FWLeftSideMenu
        let rightViewController = mainStoryboard.instantiateViewController(withIdentifier: "FWLeftSideMenu") as! FWLeftSideMenu
        
        let leftSideNav = UINavigationController(rootViewController: leftViewController)
        let centerNav = UINavigationController(rootViewController: centerViewController)
        let rightNav = UINavigationController(rootViewController: rightViewController)
        
        centerContainer = MMDrawerController(center: centerNav, leftDrawerViewController: leftSideNav,rightDrawerViewController:rightNav)
                centerContainer!.openDrawerGestureModeMask = MMOpenDrawerGestureMode.panningCenterView;
        //        centerContainer!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.panningCenterView;
        
        
        
        centerContainer?.setMaximumLeftDrawerWidth(280, animated: false, completion: nil)
        centerContainer?.restorationIdentifier = "MMDrawer"
        centerContainer?.openDrawerGestureModeMask = .init(rawValue: 2)
        centerContainer?.closeDrawerGestureModeMask = .all
        centerContainer?.showsShadow = true
        //        centerContainer?.shadowColor = UIColor.gray
        
        let navigationController = FWUtilityAppDelegate().appDelegate.window?.rootViewController as! UINavigationController
        navigationController.pushViewController(centerContainer!, animated: true)
        
    }
    
//    func setLocalizationDrawer()
//    {
//        if language == "ar" {
//            centerContainer?.toggle(.right, animated: true, completion: nil)
//            centerContainer.open(MMDrawerSide.right, animated: true, completion: nil)
//        }
//        else
//        {
//            centerContainer?.toggle(.left, animated: true, completion: nil)
//            open(MMDrawerSide.left, animated: true, completion: nil)
//        }
//
//    }
//    
    
    
  
    
    
    
}

