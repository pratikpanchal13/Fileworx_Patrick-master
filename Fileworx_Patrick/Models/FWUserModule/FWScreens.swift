//
//  FWScreens.swift
//
//  Created by  on 25/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWScreens: NSObject, NSCoding {
    

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWScreensTargetObjectClassIDKey: String = "targetObjectClassID"
	internal let kFWScreensMobileIconURLKey: String = "mobileIconURL"
	internal let kFWScreensModuleIDKey: String = "moduleID"
	internal let kFWScreensContentTasksListKey: String = "contentTasksList"
	internal let kFWScreensIsDocumentsScreenKey: String = "isDocumentsScreen"
	internal let kFWScreensIconURLKey: String = "iconURL"
	internal let kFWScreensInternalIdentifierKey: String = "id"
	internal let kFWScreensOrderInModuleKey: String = "orderInModule"
	internal let kFWScreensTargetActionTypeKey: String = "targetActionType"
	internal let kFWScreensCaptionKey: String = "caption"
	internal let kFWScreensClassIDKey: String = "classID"
	internal let kFWScreensTargetObjectTypeKey: String = "targetObjectType"
	internal let kFWScreensTargetNameKey: String = "targetName"
	internal let kFWScreensTargetObjectIDKey: String = "targetObjectID"
	internal let kFWScreensTargetObjectNameKey: String = "targetObjectName"


    // MARK: Properties
	public var targetObjectClassID: String?
	public var mobileIconURL: String?
	public var moduleID: String?
	public var contentTasksList: [FWContentTasksList]?
	public var isDocumentsScreen: Bool = false
	public var iconURL: String?
	public var internalIdentifier: String?
	public var orderInModule: Int?
	public var targetActionType: Int?
	public var caption: String?
	public var classID: String?
	public var targetObjectType: Int?
	public var targetName: String?
	public var targetObjectID: String?
	public var targetObjectName: String?


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
		targetObjectClassID = json[kFWScreensTargetObjectClassIDKey].string
		mobileIconURL = json[kFWScreensMobileIconURLKey].string
		moduleID = json[kFWScreensModuleIDKey].string
		contentTasksList = []
		if let items = json[kFWScreensContentTasksListKey].array {
			for item in items {
				contentTasksList?.append(FWContentTasksList(json: item))
			}
		} else {
			contentTasksList = nil
		}
		isDocumentsScreen = json[kFWScreensIsDocumentsScreenKey].boolValue
		iconURL = json[kFWScreensIconURLKey].string
		internalIdentifier = json[kFWScreensInternalIdentifierKey].string
		orderInModule = json[kFWScreensOrderInModuleKey].int
		targetActionType = json[kFWScreensTargetActionTypeKey].int
		caption = json[kFWScreensCaptionKey].string
		classID = json[kFWScreensClassIDKey].string
		targetObjectType = json[kFWScreensTargetObjectTypeKey].int
		targetName = json[kFWScreensTargetNameKey].string
		targetObjectID = json[kFWScreensTargetObjectIDKey].string
		targetObjectName = json[kFWScreensTargetObjectNameKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if targetObjectClassID != nil {
			dictionary.updateValue(targetObjectClassID! as AnyObject, forKey: kFWScreensTargetObjectClassIDKey)
		}
		if mobileIconURL != nil {
			dictionary.updateValue(mobileIconURL! as AnyObject, forKey: kFWScreensMobileIconURLKey)
		}
		if moduleID != nil {
			dictionary.updateValue(moduleID! as AnyObject, forKey: kFWScreensModuleIDKey)
		}
		if (contentTasksList?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in contentTasksList! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kFWScreensContentTasksListKey)

        
        
        
        
        
        }
		dictionary.updateValue(isDocumentsScreen as AnyObject, forKey: kFWScreensIsDocumentsScreenKey)
		if iconURL != nil {
			dictionary.updateValue(iconURL! as AnyObject, forKey: kFWScreensIconURLKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier! as AnyObject, forKey: kFWScreensInternalIdentifierKey)
		}
		if orderInModule != nil {
			dictionary.updateValue(orderInModule! as AnyObject, forKey: kFWScreensOrderInModuleKey)
		}
		if targetActionType != nil {
			dictionary.updateValue(targetActionType! as AnyObject, forKey: kFWScreensTargetActionTypeKey)
		}
		if caption != nil {
			dictionary.updateValue(caption! as AnyObject, forKey: kFWScreensCaptionKey)
		}
		if classID != nil {
			dictionary.updateValue(classID! as AnyObject, forKey: kFWScreensClassIDKey)
		}
		if targetObjectType != nil {
			dictionary.updateValue(targetObjectType! as AnyObject, forKey: kFWScreensTargetObjectTypeKey)
		}
		if targetName != nil {
			dictionary.updateValue(targetName! as AnyObject, forKey: kFWScreensTargetNameKey)
		}
		if targetObjectID != nil {
			dictionary.updateValue(targetObjectID! as AnyObject, forKey: kFWScreensTargetObjectIDKey)
		}
		if targetObjectName != nil {
			dictionary.updateValue(targetObjectName! as AnyObject, forKey: kFWScreensTargetObjectNameKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.targetObjectClassID = aDecoder.decodeObject(forKey: kFWScreensTargetObjectClassIDKey) as? String
		self.mobileIconURL = aDecoder.decodeObject(forKey: kFWScreensMobileIconURLKey) as? String
		self.moduleID = aDecoder.decodeObject(forKey: kFWScreensModuleIDKey) as? String
		self.contentTasksList = aDecoder.decodeObject(forKey: kFWScreensContentTasksListKey) as? [FWContentTasksList]
		self.isDocumentsScreen = aDecoder.decodeBool(forKey: kFWScreensIsDocumentsScreenKey)
		self.iconURL = aDecoder.decodeObject(forKey: kFWScreensIconURLKey) as? String
		self.internalIdentifier = aDecoder.decodeObject(forKey: kFWScreensInternalIdentifierKey) as? String
		self.orderInModule = aDecoder.decodeObject(forKey: kFWScreensOrderInModuleKey) as? Int
		self.targetActionType = aDecoder.decodeObject(forKey: kFWScreensTargetActionTypeKey) as? Int
	
        
        
        
        
        
        
        
        
        
        
        
        self.caption = aDecoder.decodeObject(forKey: kFWScreensCaptionKey) as? String
		self.classID = aDecoder.decodeObject(forKey: kFWScreensClassIDKey) as? String
		self.targetObjectType = aDecoder.decodeObject(forKey: kFWScreensTargetObjectTypeKey) as? Int
		self.targetName = aDecoder.decodeObject(forKey: kFWScreensTargetNameKey) as? String
		self.targetObjectID = aDecoder.decodeObject(forKey: kFWScreensTargetObjectIDKey) as? String
		self.targetObjectName = aDecoder.decodeObject(forKey: kFWScreensTargetObjectNameKey) as? String

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(targetObjectClassID, forKey: kFWScreensTargetObjectClassIDKey)
		aCoder.encode(mobileIconURL, forKey: kFWScreensMobileIconURLKey)
		aCoder.encode(moduleID, forKey: kFWScreensModuleIDKey)
		aCoder.encode(contentTasksList, forKey: kFWScreensContentTasksListKey)
		aCoder.encode(isDocumentsScreen, forKey: kFWScreensIsDocumentsScreenKey)
		aCoder.encode(iconURL, forKey: kFWScreensIconURLKey)
		aCoder.encode(internalIdentifier, forKey: kFWScreensInternalIdentifierKey)
		aCoder.encode(orderInModule, forKey: kFWScreensOrderInModuleKey)
		aCoder.encode(targetActionType, forKey: kFWScreensTargetActionTypeKey)
		aCoder.encode(caption, forKey: kFWScreensCaptionKey)
		aCoder.encode(classID, forKey: kFWScreensClassIDKey)
		aCoder.encode(targetObjectType, forKey: kFWScreensTargetObjectTypeKey)
		aCoder.encode(targetName, forKey: kFWScreensTargetNameKey)
		aCoder.encode(targetObjectID, forKey: kFWScreensTargetObjectIDKey)
		aCoder.encode(targetObjectName, forKey: kFWScreensTargetObjectNameKey)

    }

}
