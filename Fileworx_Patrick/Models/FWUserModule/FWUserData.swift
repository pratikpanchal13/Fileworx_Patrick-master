
//
//  FWData.swift
//
//  Created by  on 25/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWUserData: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWDataHomeScreenIDKey: String = "homeScreenID"
	internal let kFWDataPasswordKey: String = "password"
	internal let kFWDataLastLoginLanguageIDKey: String = "lastLoginLanguageID"
	internal let kFWDataUserHostNameKey: String = "userHostName"
	internal let kFWDataUserPreferredLanguageIDKey: String = "userPreferredLanguageID"
	internal let kFWDataAvailableModulesKey: String = "availableModules"
	internal let kFWDataUserNameKey: String = "userName"
	internal let kFWDataUtKey: String = "ut"


    // MARK: Properties
	public var homeScreenID: String?
	public var password: String?
	public var lastLoginLanguageID: Int?
	public var userHostName: String?
	public var userPreferredLanguageID: Int?
	public var availableModules: [FWAvailableModules]?
	public var userName: String?
	public var ut: String?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		homeScreenID = json[kFWDataHomeScreenIDKey].string
		password = json[kFWDataPasswordKey].string
		lastLoginLanguageID = json[kFWDataLastLoginLanguageIDKey].int
		userHostName = json[kFWDataUserHostNameKey].string
		userPreferredLanguageID = json[kFWDataUserPreferredLanguageIDKey].int
		availableModules = []
		if let items = json[kFWDataAvailableModulesKey].array {
			for item in items {
				availableModules?.append(FWAvailableModules(json: item))
			}
		} else {
			availableModules = nil
		}
		userName = json[kFWDataUserNameKey].string
		ut = json[kFWDataUtKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if homeScreenID != nil {
			dictionary.updateValue(homeScreenID! as AnyObject, forKey: kFWDataHomeScreenIDKey)
		}
		if password != nil {
			dictionary.updateValue(password! as AnyObject, forKey: kFWDataPasswordKey)
		}
		if lastLoginLanguageID != nil {
			dictionary.updateValue(lastLoginLanguageID! as AnyObject, forKey: kFWDataLastLoginLanguageIDKey)
		}
		if userHostName != nil {
			dictionary.updateValue(userHostName! as AnyObject, forKey: kFWDataUserHostNameKey)
		}
		if userPreferredLanguageID != nil {
			dictionary.updateValue(userPreferredLanguageID! as AnyObject, forKey: kFWDataUserPreferredLanguageIDKey)
		}
		if (availableModules?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in availableModules! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kFWDataAvailableModulesKey)
		}
		if userName != nil {
			dictionary.updateValue(userName! as AnyObject, forKey: kFWDataUserNameKey)
		}
		if ut != nil {
			dictionary.updateValue(ut! as AnyObject, forKey: kFWDataUtKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.homeScreenID = aDecoder.decodeObject(forKey: kFWDataHomeScreenIDKey) as? String
		self.password = aDecoder.decodeObject(forKey: kFWDataPasswordKey) as? String
		self.lastLoginLanguageID = aDecoder.decodeObject(forKey: kFWDataLastLoginLanguageIDKey) as? Int
		self.userHostName = aDecoder.decodeObject(forKey: kFWDataUserHostNameKey) as? String
		self.userPreferredLanguageID = aDecoder.decodeObject(forKey: kFWDataUserPreferredLanguageIDKey) as? Int
		self.availableModules = aDecoder.decodeObject(forKey: kFWDataAvailableModulesKey) as? [FWAvailableModules]
		self.userName = aDecoder.decodeObject(forKey: kFWDataUserNameKey) as? String
		self.ut = aDecoder.decodeObject(forKey: kFWDataUtKey) as? String

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(homeScreenID, forKey: kFWDataHomeScreenIDKey)
		aCoder.encode(password, forKey: kFWDataPasswordKey)
		aCoder.encode(lastLoginLanguageID, forKey: kFWDataLastLoginLanguageIDKey)
		aCoder.encode(userHostName, forKey: kFWDataUserHostNameKey)
		aCoder.encode(userPreferredLanguageID, forKey: kFWDataUserPreferredLanguageIDKey)
		aCoder.encode(availableModules, forKey: kFWDataAvailableModulesKey)
		aCoder.encode(userName, forKey: kFWDataUserNameKey)
		aCoder.encode(ut, forKey: kFWDataUtKey)

    }

}
