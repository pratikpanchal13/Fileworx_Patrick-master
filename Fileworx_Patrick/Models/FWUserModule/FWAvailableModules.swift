//
//  FWAvailableModules.swift
//
//  Created by  on 25/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWAvailableModules: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWAvailableModulesClassIDKey: String = "classID"
	internal let kFWAvailableModulesIconURLKey: String = "iconURL"
	internal let kFWAvailableModulesInternalIdentifierKey: String = "id"
	internal let kFWAvailableModulesOrderKey: String = "order"
	internal let kFWAvailableModulesScreensKey: String = "screens"
	internal let kFWAvailableModulesCaptionKey: String = "caption"


    // MARK: Properties
	public var classID: String?
	public var iconURL: String?
	public var internalIdentifier: String?
	public var order: Int?
	public var screens: [FWScreens]?
	public var caption: String?


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
		classID = json[kFWAvailableModulesClassIDKey].string
		iconURL = json[kFWAvailableModulesIconURLKey].string
		internalIdentifier = json[kFWAvailableModulesInternalIdentifierKey].string
		order = json[kFWAvailableModulesOrderKey].int
		screens = []
		if let items = json[kFWAvailableModulesScreensKey].array {
			for item in items {
				screens?.append(FWScreens(json: item))
			}
		} else {
			screens = nil
		}
		caption = json[kFWAvailableModulesCaptionKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if classID != nil {
			dictionary.updateValue(classID! as AnyObject, forKey: kFWAvailableModulesClassIDKey)
		}
		if iconURL != nil {
			dictionary.updateValue(iconURL! as AnyObject, forKey: kFWAvailableModulesIconURLKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier! as AnyObject, forKey: kFWAvailableModulesInternalIdentifierKey)
		}
		if order != nil {
			dictionary.updateValue(order! as AnyObject, forKey: kFWAvailableModulesOrderKey)
		}
		if (screens?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in screens! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kFWAvailableModulesScreensKey)
		}
		if caption != nil {
			dictionary.updateValue(caption! as AnyObject, forKey: kFWAvailableModulesCaptionKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.classID = aDecoder.decodeObject(forKey: kFWAvailableModulesClassIDKey) as? String
		self.iconURL = aDecoder.decodeObject(forKey: kFWAvailableModulesIconURLKey) as? String
		self.internalIdentifier = aDecoder.decodeObject(forKey: kFWAvailableModulesInternalIdentifierKey) as? String
		self.order = aDecoder.decodeObject(forKey: kFWAvailableModulesOrderKey) as? Int
		self.screens = aDecoder.decodeObject(forKey: kFWAvailableModulesScreensKey) as? [FWScreens]
		self.caption = aDecoder.decodeObject(forKey: kFWAvailableModulesCaptionKey) as? String

    }

    public func encode(with
        
        
        
        aCoder: NSCoder) {
		aCoder.encode(classID, forKey: kFWAvailableModulesClassIDKey)
		aCoder.encode(iconURL, forKey: kFWAvailableModulesIconURLKey)
		aCoder.encode(internalIdentifier, forKey: kFWAvailableModulesInternalIdentifierKey)
		aCoder.encode(order, forKey: kFWAvailableModulesOrderKey)
		aCoder.encode(screens, forKey: kFWAvailableModulesScreensKey)
		aCoder.encode(caption, forKey: kFWAvailableModulesCaptionKey)

    }

}
