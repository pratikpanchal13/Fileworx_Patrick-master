//
//  SettingVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 07/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class SettingVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var mutArrayContent = ["Prefered Language","English","Arabic","Hindi"]
    let arrayLanguages = Localisator.sharedInstance.getArrayAvailableLanguages()    // 1) without Restart Method

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblView.separatorStyle = .none
        

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBackClicked(_ sender: Any) {
 
        _ = self.navigationController?.popViewController(animated: true)

    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mutArrayContent.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : CellSettings = tableView.dequeueReusableCell(withIdentifier: "CellSettings", for: indexPath) as! CellSettings
        
        cell.lblTitle.text = mutArrayContent[indexPath.row]
        cell.btnTitle.setTitle("\(mutArrayContent[indexPath.row])", for: UIControlState.normal)

        cell.btnTitle.tag = indexPath.row
        cell.btnTitle.addTarget(self,action:#selector(btnClicked(sender:)), for: .touchUpInside)

        return cell

    }
    
//    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return 90
//    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
    func btnClicked(sender:UIButton) {
        let index = sender.tag


        switch index {
        case 0:
            print("Index 1")
            UtilityUserDefault().setUDObject(ObjectToSave: arrayLanguages[1] as AnyObject?, KeyToSave: "Language")

            break
        case 1:
            print("Index 2")
            UtilityUserDefault().setUDObject(ObjectToSave: arrayLanguages[1] as AnyObject?, KeyToSave: "Language")

            break
        case 2:
            UtilityUserDefault().setUDObject(ObjectToSave: arrayLanguages[3] as AnyObject?, KeyToSave: "Language")

            print("Index 3")
            break
        case 3:
            UtilityUserDefault().setUDObject(ObjectToSave: arrayLanguages[4] as AnyObject?, KeyToSave: "Language")

            print("Index 4")
            break
        default:
            break
        }
    }
    
}

