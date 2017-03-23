//
//  HomeVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 03/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import MMDrawerController

//Enum For Set HomePage
enum HomePage : String {
    case MessageVC
    case MediaVC

}

class HomeVC: UIViewController {

    //Mark: - Properties & Outlets
    @IBOutlet weak var btnSideMenu: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblTitleVC: UILabel!
    
    weak var currentViewController:UIViewController?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setHomePage), name: NSNotification.Name(rawValue: FWUtilityNotification().FWConstSetHomePage), object: nil)

        let data =  UtilityUserDefault().getUDObject(KeyToReturnValye: "user")
        let data1 =  UtilityUserDefault().getUDBool(key: "pratik")

        self.navigationController?.isNavigationBarHidden = true
        self.iniatLoadView()   // For Initail Load View Controller
    }
}

// List Of Function
extension HomeVC{
    
    // MARK : - For Initial Load View Controller
    func iniatLoadView(){
        
        self.currentViewController = Constants.Storyboard.kLoginAndSplashStoryboard.instantiateViewController(withIdentifier: "MessageVC")
        self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.currentViewController!)
        self.addSubview(self.currentViewController!.view, toView: self.containerView)
    }
    
    //Mark: - Set HomePage
    func setHomePage(notification : NSNotification )
    {
        let notifyHomePage  = notification.object as! String
        switch notifyHomePage {
        case HomePage.MessageVC.rawValue:
            self.btnHomeClicked(Any.self)
            break
        case HomePage.MediaVC.rawValue:
            self.btnSendClicked(Any.self)
            break
        default:
            break
        }
    }
    
}

// Container View ADD & Remove
extension HomeVC{
    func cycleFromViewController(_ oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.addSubview(newViewController.view, toView:self.containerView!)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            newViewController.view.alpha = 1
            oldViewController.view.alpha = 0
        },
                       completion: { finished in
                        oldViewController.view.removeFromSuperview()
                        oldViewController.removeFromParentViewController()
                        newViewController.didMove(toParentViewController: self)
        })
    }
    
    func addSubview(_ subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        
    }
}

// Button Clicked Event
extension HomeVC{

    // MARK: - Set Side Menu
    @IBAction func btnSideMenuClicked(_ sender: Any) {
        self.view.endEditing(true)
        self.mm_drawerController?.toggle(.left, animated: true, completion: nil)
    }
    
    // MARK : - Button MessageVC
    @IBAction func btnHomeClicked(_ sender: Any) {
        lblTitleVC.text = "Messages"
        let newViewController = Constants.Storyboard.kLoginAndSplashStoryboard.instantiateViewController(withIdentifier: "MessageVC")
        newViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(self.currentViewController!, toViewController: newViewController)
        self.currentViewController = newViewController
        self.mm_drawerController?.closeDrawer(animated: true, completion: nil)

    }
    
    // MARK : - Button  MediaVC
    @IBAction func btnSendClicked(_ sender: Any) {
        lblTitleVC.text = "Media"
        let newViewController = Constants.Storyboard.kLoginAndSplashStoryboard.instantiateViewController(withIdentifier: "MediaVC")
        newViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(self.currentViewController!, toViewController: newViewController)
        self.currentViewController = newViewController
        self.mm_drawerController?.closeDrawer(animated: true, completion: nil)
        
    }
}
