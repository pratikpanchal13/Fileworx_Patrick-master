//
//  FWLoginVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 03/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import MBProgressHUD
import SwiftyJSON
import Toast_Swift


class FWLoginVC: UIViewController {
    
    //  MARK: -
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLoginAsGuest: UIButton!
    
    let objWeb:WebService = WebService()
    
    var amutArrayData : [Any]?
    var objMobileSettingModel : FWMobileSettingModel?
    var objAvailableModules : FWAvailableModules?
    var objUserModel : FWUserModel?
    
    var aMutArrayAvailableModule:[Any]?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.cornerRadius = 5
        btnLogin.layer.borderColor = UIColor.white.cgColor
        
        self.txtUserName.text = "root"
        self.txtPassword.text = "root"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let isLeftToRight = UIView.userInterfaceLayoutDirection(
            for: view.semanticContentAttribute) == .leftToRight

        if isLeftToRight {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.txtUserName.textAlignment = NSTextAlignment.right
            self.txtPassword.textAlignment = NSTextAlignment.right

        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.txtUserName.textAlignment = NSTextAlignment.left
            self.txtPassword.textAlignment = NSTextAlignment.left
        }
        
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        

        
        self.CallAPILogin()
        
        
        
        
        
        
    }
    @IBAction func btnLoginAsGuestClicked(_ sender: Any) {
    }
    
}


extension FWLoginVC{
    

    func CallAPIMobileSetting()
    {
        objWeb.callWebService("http://212.118.26.115/FileworxMobileServer/api/Application/MobileSettings",aView:self.view,  param: nil) { json in
            
            debugPrint(json)
            
            print(json["RestResponse"])
            self.objMobileSettingModel =  FWMobileSettingModel(json: json)
            
            
            print("Message is \(self.objMobileSettingModel?.message)")
            print("Message is \(self.objMobileSettingModel?.data?.globalMobileSetttings?.allowAnonymousAccess)")
            
        }
        
    }
    
    func CallAPILogin(){
        
        let json: [String: Any] = ["userName": self.txtUserName.text!, "Password":self.txtPassword.text!,"LastLoginLanguageID":"-1","AuthenticationType":"0"];
    
        
        WebService().callWebServiceWithURLSession(loginAPIUrl, param: json) { json
            in
            
            print("json \(json)")
            self.objUserModel  = FWUserModel(json:json)
            
            
            
            print("Result -> \((self.objUserModel?.data)!)")
            
            if self.objUserModel?.result == 0
            {
                
                UtilityUserDefault().setUDObject(ObjectToSave: self.objUserModel?.message as AnyObject?, KeyToSave: "user")
                UtilityUserDefault().setUDBool(true,key: "pratik")

                let controller = Constants.Storyboard.kLoginAndSplashStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                self.navigationController?.pushViewController(controller, animated: true)
                
            }else
            {
                self.view.makeToast((self.objUserModel?.message)!, duration: 3.0, position: .bottom)
            }
            
        }
    }

}
