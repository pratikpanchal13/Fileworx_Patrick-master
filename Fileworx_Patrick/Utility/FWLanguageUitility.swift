//
//  FWLanguageUitility.swift
//  Fileworx_Patrick
//
//  Created by indianic on 27/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import Foundation
import UIKit
import MMDrawerController

class FWLanguageUitily
{
    let arrayLanguages = Localisator.sharedInstance.getArrayAvailableLanguages()    // 1) without Restart Method

    public func setLanguage()
    {
        if let language :String =   UtilityUserDefault().getUDObject(KeyToReturnValye: "Language") as? String
        {
            print("language is \(language)")
            if language == "ar" {
                if SetLanguage(arrayLanguages[3]) {
                    UtilityUserDefault().setUDObject(ObjectToSave: arrayLanguages[3] as AnyObject?, KeyToSave: "Language")
                    UIView.appearance().semanticContentAttribute = .forceLeftToRight
                }
            }
            else
            {
                if SetLanguage(arrayLanguages[1]) {
                    UtilityUserDefault().setUDObject(ObjectToSave: arrayLanguages[1] as AnyObject?, KeyToSave: "Language")
                    UIView.appearance().semanticContentAttribute = .forceLeftToRight
                }
            }
        }
    }
    
    
    func setLocalizationView(_ view : UIView){
        
        if let language :String =   UtilityUserDefault().getUDObject(KeyToReturnValye: "Language") as? String
        {
            print("language is \(language)")
            
            if language == "ar" {
                
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                view.semanticContentAttribute = .forceRightToLeft
                
            }
            else
            {
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                view.semanticContentAttribute = .forceLeftToRight
                
            }
        }
    }
    
    
    func setLocalizationTextField(_ textField : UITextField){
        
        if let language :String =   UtilityUserDefault().getUDObject(KeyToReturnValye: "Language") as? String
        {
            print("language is \(language)")
            
            if language == "ar" {
                
                textField.textAlignment = .right
            }
            else
            {
                textField.textAlignment = .left
                
            }
        }
    }
    
   
    func setLocalizationLabel(_ label : UILabel){
        
        if let language :String =   UtilityUserDefault().getUDObject(KeyToReturnValye: "Language") as? String
        {
            print("language is \(language)")
            
            if language == "ar" {
                
                label.textAlignment = .right
            }
            else
            {
                label.textAlignment = .left
                
            }
        }
    }
    
  
}

