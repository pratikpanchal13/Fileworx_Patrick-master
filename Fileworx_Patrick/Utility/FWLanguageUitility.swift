//
//  FWLanguageUitility.swift
//  Fileworx_Patrick
//
//  Created by indianic on 27/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import Foundation
import UIKit


class FWLanguageUitily
{
    let arrayLanguages = Localisator.sharedInstance.getArrayAvailableLanguages()    // 1) without Restart Method

    func setTextField(textField:UITextField) {
//        
//        let isLeftToRight = UIView.userInterfaceLayoutDirection(
//            for: view.semanticContentAttribute) == .leftToRight
//        
//        if isLeftToRight {
//            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//            textField.textAlignment = NSTextAlignment.right
//            
//            
//        }else{
//            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//            textField.textAlignment = NSTextAlignment.left
//            
//        }
        
        //
    }
    
    
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
    
    
    
    func setLeftToRightView(_ view : UIView)
    {
             UIView.appearance().semanticContentAttribute = .forceLeftToRight
             view.semanticContentAttribute = .forceLeftToRight
    }
    func setRightTOLeftView(_ view : UIView)
    {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        view.semanticContentAttribute = .forceRightToLeft

    }
    
    func setRightTOLeftTextField(_ textField : UITextField)
    {
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        textField.textAlignment = .right
    }
    
    func setLeftToRightTextField(_ textField : UITextField)
    {
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        textField.textAlignment = .left

    }
}

