//
//  FWLeftSideMenu.swift
//  Fileworx_Patrick
//
//  Created by indianic on 22/03/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import MMDrawerController

class FWLeftSideMenu: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var menuItems:[String] = ["Message","Media"];
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.view.layoutSubviews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuItems.count;
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell = tableView.dequeueReusableCell(withIdentifier: "FWLeftSideMenuCell", for: indexPath) as! FWLeftSideMenuCell
        mycell.lblName.text = menuItems[indexPath.row]
        return mycell;
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//                let mainStoryboard :UIStoryboard = UIStoryboard(name: "LoginSplash", bundle: nil)

        
        switch(indexPath.row)
        {
        case 0:
            
            NotificationCenter.default.post(name: NSNotification.Name("notifyHomePage"), object:"MessageVC")
//            let aStoryboard = UIStoryboard(name: "LoginSplash", bundle: nil)
//            let centerVC = aStoryboard.instantiateViewController(withIdentifier: "MessageVC")
//            self.mm_drawerController?.setCenterView(centerVC, withCloseAnimation: true, completion: nil)
            break;
        case 1:
            NotificationCenter.default.post(name: NSNotification.Name("notifyHomePage"), object:"MediaVC")
            
//            let aStoryboard = UIStoryboard(name: "LoginSplash", bundle: nil)
//            let centerVC = aStoryboard.instantiateViewController(withIdentifier: "MediaVC")
//            self.mm_drawerController?.setCenterView(centerVC, withCloseAnimation: true, completion: nil)
            break;
        default:
            print("\(menuItems[indexPath.row]) is selected");
//        }
        
      
        }
    }
    
    func setHomePage()
    {
        
    }
}
