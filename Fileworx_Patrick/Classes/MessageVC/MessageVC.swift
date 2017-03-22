//
//  MessageVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 04/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//


// Set R to L Using Two way 
// 1) Using Restart App
// 2) Set Using Witout Restart App


import UIKit

class MessageVC: UIViewController {

    @IBOutlet weak var lblMessage: UILabel!
    
    let currentLang: AnyObject? = NSLocale.preferredLanguages[0] as AnyObject?      // 1) With Restart Method
    let arrayLanguages = Localisator.sharedInstance.getArrayAvailableLanguages()    // 1) without Restart Method

    override func viewDidLoad() {
        
        super.viewDidLoad()

        /* changeLang(language: "en")  //  1) With Restart Method
         
         let preferredLanguage = NSLocale.preferredLanguages[0] as String
         lblMessage.text = NSLocalizedString("Hello", comment: "Hello")
         
         
         if preferredLanguage == "en" {
         print("this is English")
         } else if preferredLanguage == "ar" {
         print("this is Arabic")
         }
         */

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        lblMessage.text = Localization("Hello")

    }


}

// 2) Without Restart Method
extension MessageVC{
    
    @IBAction func setAppLanguage(_ sender: UISwitch) {
        
        if sender.isOn {
            if SetLanguage(arrayLanguages[1]) {
                lblMessage.text = Localization("Hello")
                
                _ = UIView.userInterfaceLayoutDirection(
                    for: view.semanticContentAttribute) == .leftToRight
                     UIView.appearance().semanticContentAttribute = .forceLeftToRight
                lblMessage.textAlignment = NSTextAlignment.left
            }
            //changeLang(language: "en")    // 1) With Restart Method
            print("this is English")
            
        } else {
            if SetLanguage(arrayLanguages[3]) {
                lblMessage.text = Localization("Hello")
                lblMessage.textAlignment = NSTextAlignment.right
                _ = UIView.userInterfaceLayoutDirection(
                    for: view.semanticContentAttribute) == .rightToLeft
                     UIView.appearance().semanticContentAttribute = .forceRightToLeft
            }
            //changeLang(language: "ar") // 1) With Restart Method
            print("this is Arabic")
            
        }
    }

}



// 1) With Restart Method
extension MessageVC{
    func changeLang(language: String) {
        
        if language != (currentLang as! String?)! {
            UserDefaults.standard.set([language], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            print(self.currentLang)
            lblMessage.text = NSLocalizedString("Hello", comment: "Hello")
        }
    }
}
