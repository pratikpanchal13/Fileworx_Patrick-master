//
//  FWGlobalMobileSetttings.swift
//
//  Created by  on 25/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWGlobalMobileSetttings: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWGlobalMobileSetttingsAnonymousPasswordKey: String = "anonymousPassword"
	internal let kFWGlobalMobileSetttingsAllowAnonymousAccessKey: String = "allowAnonymousAccess"
	internal let kFWGlobalMobileSetttingsClientAppSessionTimeOutInDaysKey: String = "clientAppSessionTimeOutInDays"
	internal let kFWGlobalMobileSetttingsDefualtLoginLanguageKey: String = "defualtLoginLanguage"
	internal let kFWGlobalMobileSetttingsAnonymousUserNameKey: String = "anonymousUserName"
	internal let kFWGlobalMobileSetttingsServerSessionTimeoutKey: String = "serverSessionTimeout"


    // MARK: Properties
	public var anonymousPassword: String?
	public var allowAnonymousAccess: String?
	public var clientAppSessionTimeOutInDays: String?
	public var defualtLoginLanguage: String?
	public var anonymousUserName: String?
	public var serverSessionTimeout: String?


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
		anonymousPassword = json[kFWGlobalMobileSetttingsAnonymousPasswordKey].string
		allowAnonymousAccess = json[kFWGlobalMobileSetttingsAllowAnonymousAccessKey].string
		clientAppSessionTimeOutInDays = json[kFWGlobalMobileSetttingsClientAppSessionTimeOutInDaysKey].string
		defualtLoginLanguage = json[kFWGlobalMobileSetttingsDefualtLoginLanguageKey].string
		anonymousUserName = json[kFWGlobalMobileSetttingsAnonymousUserNameKey].string
		serverSessionTimeout = json[kFWGlobalMobileSetttingsServerSessionTimeoutKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if anonymousPassword != nil {
			dictionary.updateValue(anonymousPassword! as AnyObject, forKey: kFWGlobalMobileSetttingsAnonymousPasswordKey)
		}
		if allowAnonymousAccess != nil {
			dictionary.updateValue(allowAnonymousAccess! as AnyObject
                
                
                , forKey: kFWGlobalMobileSetttingsAllowAnonymousAccessKey)
		}
		if clientAppSessionTimeOutInDays != nil {
			dictionary.updateValue(clientAppSessionTimeOutInDays! as AnyObject, forKey: kFWGlobalMobileSetttingsClientAppSessionTimeOutInDaysKey)
		}
		if defualtLoginLanguage != nil {
			dictionary.updateValue(defualtLoginLanguage! as AnyObject, forKey: kFWGlobalMobileSetttingsDefualtLoginLanguageKey)
		}
		if anonymousUserName != nil {
			dictionary.updateValue(anonymousUserName! as AnyObject, forKey: kFWGlobalMobileSetttingsAnonymousUserNameKey)
		}
		if serverSessionTimeout != nil {
			dictionary.updateValue(serverSessionTimeout! as AnyObject, forKey: kFWGlobalMobileSetttingsServerSessionTimeoutKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.anonymousPassword = aDecoder.decodeObject(forKey: kFWGlobalMobileSetttingsAnonymousPasswordKey) as? String
		self.allowAnonymousAccess = aDecoder.decodeObject(forKey: kFWGlobalMobileSetttingsAllowAnonymousAccessKey) as? String
		self.clientAppSessionTimeOutInDays = aDecoder.decodeObject(forKey: kFWGlobalMobileSetttingsClientAppSessionTimeOutInDaysKey) as? String
		self.defualtLoginLanguage = aDecoder.decodeObject(forKey: kFWGlobalMobileSetttingsDefualtLoginLanguageKey) as? String
		self.anonymousUserName = aDecoder.decodeObject(forKey: kFWGlobalMobileSetttingsAnonymousUserNameKey) as? String
		self.serverSessionTimeout = aDecoder.decodeObject(forKey: kFWGlobalMobileSetttingsServerSessionTimeoutKey) as? String

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(anonymousPassword, forKey: kFWGlobalMobileSetttingsAnonymousPasswordKey)
		aCoder.encode(allowAnonymousAccess, forKey: kFWGlobalMobileSetttingsAllowAnonymousAccessKey)
		aCoder.encode(clientAppSessionTimeOutInDays, forKey: kFWGlobalMobileSetttingsClientAppSessionTimeOutInDaysKey)
		aCoder.encode(defualtLoginLanguage, forKey: kFWGlobalMobileSetttingsDefualtLoginLanguageKey)
		aCoder.encode(anonymousUserName, forKey: kFWGlobalMobileSetttingsAnonymousUserNameKey)
		aCoder.encode(serverSessionTimeout, forKey: kFWGlobalMobileSetttingsServerSessionTimeoutKey)

    }

}
