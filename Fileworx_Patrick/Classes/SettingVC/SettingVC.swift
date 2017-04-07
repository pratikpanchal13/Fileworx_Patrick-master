//
//  SettingVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 07/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnBackClicked(_ sender: Any) {
//      
//        let aStoryboard = UIStoryboard(name: "LoginSplash", bundle: nil)
//        let centerVC = aStoryboard.instantiateViewController(withIdentifier: "MediaVC")
//        self.mm_drawerController?.setCenterView(centerVC, withCloseAnimation: true, completion: nil)

//        let navigationController = FWUtilityAppDelegate().appDelegate.window?.rootViewController as! UINavigationController
 
        _ = self.navigationController?.popViewController(animated: true)

    }
}
