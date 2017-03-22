//
//  MediaVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 04/01/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit

class MediaVC: UIViewController {

    

    let objWeb:WebService = WebService()
    
    var amutArrayData : [Any]?
    var objContentsModel  : FWContents?
    var objMessageModel  : FWMessage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.APICallMessageList()
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

    
    func APICallMessageList() {
        
        objWeb.callWebService("http://212.118.26.115/FileworxMobileServer/api/Messages/Contents?SK=20182_24662&Cls=401&Obj=24661&Fn=ctrlQueryRun",aView:self.view,  param: nil) { json in
            
            debugPrint(json)
            
            print(json["data"])
            
            self.objMessageModel  = FWMessage(json:json)

            self.amutArrayData = self.objMessageModel?.data?.contents
            
            print("Array Content is \(self.amutArrayData!)")
            
            
        }
        

    }
}
