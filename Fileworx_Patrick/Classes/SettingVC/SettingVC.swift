//
//  SettingVC.swift
//  Fileworx_Patrick
//
//  Created by indianic on 07/04/17.
//  Copyright © 2017 indianic. All rights reserved.
//

import UIKit
import PatrickDatePickers



class SettingVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    var mutArrayContent = ["Prefered Language","English","Arabic","Hindi","Gujarati"]
    let arrayLanguages = Localisator.sharedInstance.getArrayAvailableLanguages()    // 1) without Restart Method
    
    var datePicker = PKDatePickers.getFromNib()
    var dateFormatter = DateFormatter()

    
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
        cell.txtName.text = mutArrayContent[indexPath.row]
        cell.txtName.tag = indexPath.row
        
        return cell

    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 90
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        
        let indexPath = NSIndexPath(row: textField.tag, section: 0)
        let cell = self.tblView.cellForRow(at: indexPath as IndexPath) as! CellSettings!

       let pickerArray = ["English","Arbic","French","Hindi","Gujarati"]
        
        switch textField.tag {
        case 0:
                FWUtility.sharedInstance.addPicker(self, onTextField: (cell?.txtName)!, typePicker: "", pickerArray: pickerArray, setMaxDate:true) { (picker,buttonindex,firstindex) in
                    
                    if (picker != nil)
                    {
                        
                        print("Index is \(firstindex)")
                        switch firstindex{
                            case 0:
                                UtilityUserDefault().setUDObject(ObjectToSave: self.arrayLanguages[1] as AnyObject?, KeyToSave: "Language")
                                
                                break
                            case 1:
                                UtilityUserDefault().setUDObject(ObjectToSave: self.arrayLanguages[3] as AnyObject?, KeyToSave: "Language")
                                break
                                
                            case 2:
                                break
                            case 3:
                                UtilityUserDefault().setUDObject(ObjectToSave: self.arrayLanguages[4] as AnyObject?, KeyToSave: "Language")

                                break
                            case 4:
                                UtilityUserDefault().setUDObject(ObjectToSave: self.arrayLanguages[5] as AnyObject?, KeyToSave: "Language")
                                break
                            case 5:

                                break
                            default:
                                break
                            }
                        
                        print("picker Data \(pickerArray[firstindex])")
                        cell?.txtName.text = pickerArray[firstindex]
                    }
                    cell?.txtName!.resignFirstResponder()
                }
        
        break;

        case 1:
            break;
            
        case 2:
            break;
            print("Arabic")
        case 3:
            break;
        default:
            break
        }
        
     
    }
    
}


