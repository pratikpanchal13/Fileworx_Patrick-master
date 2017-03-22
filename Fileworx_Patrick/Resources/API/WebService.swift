//
//  WebService.swift
//  MidPoynt
//
//  Created by ind502 on 5/24/16.
//  Copyright © 2016 ind502. All rights reserved.
//

import Foundation
import SwiftyJSON
import MBProgressHUD

class WebService: NSObject {
    
    
    // MARK: - Webservice Methods
    
    func callWebService(_ aStrULR:String,aView:UIView!,param:[String : Any]?,imgData : Data? = nil,CompletionHandler:@escaping (JSON) -> Void) {
        
        if imgData != nil {
            self.callWebServiceWithImageData(aStrULR, imgData: imgData!, aView: aView, param: param, CompletionHandler: CompletionHandler)
            return
        }
        if aView != nil {
            MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow, animated: true)
//          Constantsnt.sharedInstance.startActivityIndicator()
        }
        
        print("--- URL : \(aStrULR)")
        print("--- PARAMETER : \(param)")
        
        let request = URLRequest(url: URL(string: aStrULR)!)
        var encodedRequest = self.encode(request, with: param)
        
        print("--- Request URL : \(encodedRequest.url)")
        encodedRequest.timeoutInterval = 60.0
        
        let task = URLSession.shared.dataTask(with: encodedRequest) { (responseData,response, error) in
            
            if (error != nil) {
                
                DispatchQueue.main.async {
                    if aView != nil{
                        CompletionHandler(["settings":["success":"0","message":"\(error!.localizedDescription)"]])
                        print("Request failed with error: \(error!.localizedDescription)")
                        MBProgressHUD.hide(for: UIApplication.shared.keyWindow, animated: true)
//                        Constants.sharedInstance.stopActivityIndicator()
                    }
                }
            }
            else{
                
                DispatchQueue.main.async {
                    if aView != nil{
                        MBProgressHUD.hide(for: UIApplication.shared.keyWindow, animated: true)
//                        Constant.sharedInstance.stopActivityIndicator()
                    }
                    if let responseData = responseData{
                        
                        let json = JSON(data: responseData)
                        CompletionHandler(json)
                    }
                }
            }
        }
        task.resume()
        
    }
    
    
    
    
    func callWebServiceWithURLSession(_ aStrULR:String, param: Dictionary <String,Any>,CompletionHandler:@escaping (_ json: JSON) -> Void) {
        do {
            if let url = NSURL(string: aStrULR){
                let request = NSMutableURLRequest(url: url as URL)
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//                request.addValue("key=\(Constant.kServerKey)", forHTTPHeaderField: "Authorization")
                MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow, animated: true)

                let httpData = try JSONSerialization.data(withJSONObject:param, options:[])
                
                request.httpBody = httpData
                let session = URLSession.shared
                session.dataTask(with: request as URLRequest, completionHandler: { (returnData, response, error) -> Void in
                    
                    print(returnData)
                    print(response)
                    print(error)
                    
                   
                    
                    DispatchQueue.main.async {
                            MBProgressHUD.hide(for: UIApplication.shared.keyWindow, animated: true)
                            //                        Constant.sharedInstance.stopActivityIndicator()
                      
                        if let responseData = returnData{
                            
                            let json = JSON(data: responseData)
                            CompletionHandler(json)
                        }
                    }

                    
                }).resume()
                
                
            }
            
        } catch {
            print("JSON serialization failed:  \(error)")
        }
        
        
    }
    
    
    
    func callWebServiceWithImageData(_ aStrULR:String,imgData:Data,aView:UIView!,param:[String : Any]?,CompletionHandler:@escaping (JSON) -> Void) {
        
        if aView != nil {
            MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow, animated: true)
//            Constant.sharedInstance.startActivityIndicator()
        }
        
        print("--- URL : \(aStrULR)")
        print("--- PARAMETER : \(param)")
        
        let request = URLRequest(url: URL(string: aStrULR)!)
        var encodedRequest = self.encode(request, with: param)
        
        let boundary = self.generateBoundaryString()
        let headers = [
            "content-type": "multipart/form-data; boundary=\(boundary)"
        ]
        let parameters = [
            [
                "name": "profile_pic",
                "fileName": "profile_pic.png",
                "content-type":"image/png"
            ]
        ]
        var body =  Data()
        for param in parameters {
            let paramName = param["name"]!
            let filename = param["fileName"]!
            let contentType = param["content-type"]!
            body.appendString("--\(boundary)\r\n")
            body.appendString("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(filename)\"\r\n")
            body.appendString("Content-Type: \(contentType)\r\n\r\n")
            body.append(imgData)
            body.appendString("\r\n")
        }
        body.appendString("--\(boundary)--\r\n")
        
        encodedRequest.httpMethod = "POST"
        encodedRequest.allHTTPHeaderFields = headers
        encodedRequest.httpBody = body
        
        let task = URLSession.shared.dataTask(with: encodedRequest) { (responseData, response, error) in
            if (error != nil) {
                
                DispatchQueue.main.async {
                    if aView != nil{
                        CompletionHandler(["settings":["success":"0","message":"\(error!.localizedDescription)"]])
                        print("Request failed with error: \(error!.localizedDescription)")
                        MBProgressHUD.hide(for: UIApplication.shared.keyWindow, animated: true)
//                        Constant.sharedInstance.stopActivityIndicator()
                    }
                }
            }
            else{
                
                DispatchQueue.main.async {
                    if aView != nil{
                        MBProgressHUD.hide(for: UIApplication.shared.keyWindow, animated: true)
//                        Constant.sharedInstance.stopActivityIndicator()
                    }
                    if let responseData = responseData{
                        
                        let json = JSON(data: responseData)
                        CompletionHandler(json)
                    }
                }
            }
        }
        task.resume()
    }
    
    func callWebServiceForGoodHireVerification(_ aStrULR:String,aView:UIView!,param:[String : Any]?,CompletionHandler:@escaping (JSON) -> Void) {
        
        if aView != nil {
            MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow, animated: true)
        }
        
        print("--- URL : \(aStrULR)")
        print("--- PARAMETER : \(param)")
        
        var request = URLRequest(url: URL(string: aStrULR)!)
        request.timeoutInterval = 60.0
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("ApiKey  CD3769BE-02A6-4E2A-AF53-A18159CF1716", forHTTPHeaderField: "Authorization")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: param!, options: .prettyPrinted)
            request.httpBody = jsonData
        } catch let error as NSError {
            print(error)
        }
        
        let task = URLSession.shared.dataTask(with: request) { (responseData,response, error) in
            
            if (error != nil) {
                
                DispatchQueue.main.async {
                    if aView != nil{
                        CompletionHandler(["settings":["success":"0","message":"\(error!.localizedDescription)"]])
                        print("Request failed with error: \(error!.localizedDescription)")
                        MBProgressHUD.hide(for: UIApplication.shared.keyWindow, animated: true)
                    }
                }
            }
            else{
                
                DispatchQueue.main.async {
                    if aView != nil{
                        MBProgressHUD.hide(for: UIApplication.shared.keyWindow, animated: true)
                    }

                CompletionHandler(["settings":["success":"0","message":"your prrofile has been sucessfully submitted to goodhire"]])
                    
                }
            }
        }
        task.resume()
        
    }

    
    
    // MARK: - URL Encode Methods
    
    func encode(_ urlRequest: URLRequest, with parameters: [String : Any]?)  -> URLRequest {
        
        var urlRequest = urlRequest
        
        guard let parameters = parameters else { return urlRequest }
        
        //        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
        //            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        //        }
        //        urlRequest.httpBody = query(parameters).data(using: .utf8, allowLossyConversion: false)
        
        if let url = urlRequest.url
        {
            if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
                let percentEncodedQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + query(parameters)
                urlComponents.percentEncodedQuery = percentEncodedQuery
                urlRequest.url = urlComponents.url
            }
        }
        return urlRequest
    }
    
    func query(_ parameters: [String: Any]) -> String {
        var components: [(String, String)] = []
        
        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]!
            components += queryComponents(fromKey: key, value: value)
        }
        
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
    
    func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
        var components: [(String, String)] = []
        
        if let dictionary = value as? [String: Any] {
            for (nestedKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
            }
        } else if let array = value as? [Any] {
            for value in array {
                components += queryComponents(fromKey: "\(key)[]", value: value)
            }
        } else if let value = value as? NSNumber {
            if value.isBool {
                components.append((escape(key), escape((value.boolValue ? "1" : "0"))))
            } else {
                components.append((escape(key), escape("\(value)")))
            }
        } else if let bool = value as? Bool {
            components.append((escape(key), escape((bool ? "1" : "0"))))
        } else {
            components.append((escape(key), escape("\(value)")))
        }
        
        return components
    }
    
    func escape(_ string: String) -> String {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowedCharacterSet = CharacterSet.urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        
        return string.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? string
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
}

extension Data {
    
    /// Append string to Data
    ///
    /// Rather than littering my code with calls to `dataUsingEncoding` to convert strings to NSData, and then add that data to the NSMutableData, this wraps it in a nice convenient little extension to NSMutableData. This converts using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `Data`.
    
    mutating func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}


extension NSNumber {
    fileprivate var isBool: Bool { return CFBooleanGetTypeID() == CFGetTypeID(self) }
}

