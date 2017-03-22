//
//  FWContentTasksList.swift
//
//  Created by  on 25/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWContentTasksList: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWContentTasksListScreenIDKey: String = "screenID"
	internal let kFWContentTasksListConfirmationMessageKey: String = "confirmationMessage"
	internal let kFWContentTasksListModuleIDKey: String = "moduleID"
	internal let kFWContentTasksListBeforeSubmitFormIDKey: String = "beforeSubmitFormID"
	internal let kFWContentTasksListIsSendTaskKey: String = "isSendTask"
	internal let kFWContentTasksListTargetActionNameKey: String = "targetActionName"
	internal let kFWContentTasksListClassIdKey: String = "classId"
	internal let kFWContentTasksListNeedsConfirmationKey: String = "needsConfirmation"
	internal let kFWContentTasksListInternalIdentifierKey: String = "id"
	internal let kFWContentTasksListCaptionKey: String = "caption"
	internal let kFWContentTasksListHasDefaultInputFormKey: String = "hasDefaultInputForm"
	internal let kFWContentTasksListTaskOpenLocationKey: String = "taskOpenLocation"
	internal let kFWContentTasksListTargetActionIDKey: String = "targetActionID"


    // MARK: Properties
	public var screenID: String?
	public var confirmationMessage: String?
	public var moduleID: String?
	public var beforeSubmitFormID: String?
	public var isSendTask: Bool = false
	public var targetActionName: String?
	public var classId: String?
	public var needsConfirmation: Bool = false
	public var internalIdentifier: String?
	public var caption: String?
	public var hasDefaultInputForm: Bool = false
	public var taskOpenLocation: String?
	public var targetActionID: String?


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
		screenID = json[kFWContentTasksListScreenIDKey].string
		confirmationMessage = json[kFWContentTasksListConfirmationMessageKey].string
		moduleID = json[kFWContentTasksListModuleIDKey].string
		beforeSubmitFormID = json[kFWContentTasksListBeforeSubmitFormIDKey].string
		isSendTask = json[kFWContentTasksListIsSendTaskKey].boolValue
		targetActionName = json[kFWContentTasksListTargetActionNameKey].string
		classId = json[kFWContentTasksListClassIdKey].string
		needsConfirmation = json[kFWContentTasksListNeedsConfirmationKey].boolValue
		internalIdentifier = json[kFWContentTasksListInternalIdentifierKey].string
		caption = json[kFWContentTasksListCaptionKey].string
		hasDefaultInputForm = json[kFWContentTasksListHasDefaultInputFormKey].boolValue
		taskOpenLocation = json[kFWContentTasksListTaskOpenLocationKey].string
		targetActionID = json[kFWContentTasksListTargetActionIDKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if screenID != nil {
			dictionary.updateValue(screenID! as AnyObject, forKey: kFWContentTasksListScreenIDKey)
		}
		if confirmationMessage != nil {
			dictionary.updateValue(confirmationMessage! as AnyObject, forKey: kFWContentTasksListConfirmationMessageKey)
		}
		if moduleID != nil {
			dictionary.updateValue(moduleID! as AnyObject, forKey: kFWContentTasksListModuleIDKey)
		}
		if beforeSubmitFormID != nil {
			dictionary.updateValue(beforeSubmitFormID! as AnyObject, forKey: kFWContentTasksListBeforeSubmitFormIDKey)
		}
		dictionary.updateValue(isSendTask as AnyObject, forKey: kFWContentTasksListIsSendTaskKey)
		if targetActionName != nil {
			dictionary.updateValue(targetActionName! as AnyObject, forKey: kFWContentTasksListTargetActionNameKey)
		}
		if classId != nil {
			dictionary.updateValue(classId! as AnyObject, forKey: kFWContentTasksListClassIdKey)
		}
		dictionary.updateValue(needsConfirmation as AnyObject, forKey: kFWContentTasksListNeedsConfirmationKey)
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier! as AnyObject, forKey: kFWContentTasksListInternalIdentifierKey)
		}
		if caption != nil {
			dictionary.updateValue(caption! as AnyObject, forKey: kFWContentTasksListCaptionKey)
		}
		dictionary.updateValue(hasDefaultInputForm as AnyObject, forKey: kFWContentTasksListHasDefaultInputFormKey)
		if taskOpenLocation != nil {
			dictionary.updateValue(taskOpenLocation! as AnyObject, forKey: kFWContentTasksListTaskOpenLocationKey)
		}
		if targetActionID != nil {
			dictionary.updateValue(targetActionID! as AnyObject, forKey: kFWContentTasksListTargetActionIDKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.screenID = aDecoder.decodeObject(forKey: kFWContentTasksListScreenIDKey) as? String
		self.confirmationMessage = aDecoder.decodeObject(forKey: kFWContentTasksListConfirmationMessageKey) as? String
		self.moduleID = aDecoder.decodeObject(forKey: kFWContentTasksListModuleIDKey) as? String
		self.beforeSubmitFormID = aDecoder.decodeObject(forKey: kFWContentTasksListBeforeSubmitFormIDKey) as? String
		self.isSendTask = aDecoder.decodeBool(forKey: kFWContentTasksListIsSendTaskKey)
		self.targetActionName = aDecoder.decodeObject(forKey: kFWContentTasksListTargetActionNameKey) as? String
		self.classId = aDecoder.decodeObject(forKey: kFWContentTasksListClassIdKey) as? String
		self.needsConfirmation = aDecoder.decodeBool(forKey: kFWContentTasksListNeedsConfirmationKey)
		self.internalIdentifier = aDecoder.decodeObject(forKey: kFWContentTasksListInternalIdentifierKey) as? String
		self.caption = aDecoder.decodeObject(forKey: kFWContentTasksListCaptionKey) as? String
		self.hasDefaultInputForm = aDecoder.decodeBool(forKey: kFWContentTasksListHasDefaultInputFormKey)
		self.taskOpenLocation = aDecoder.decodeObject(forKey: kFWContentTasksListTaskOpenLocationKey) as? String
		self.targetActionID = aDecoder.decodeObject(forKey: kFWContentTasksListTargetActionIDKey) as? String

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(screenID, forKey: kFWContentTasksListScreenIDKey)
		aCoder.encode(confirmationMessage, forKey: kFWContentTasksListConfirmationMessageKey)
		aCoder.encode(moduleID, forKey: kFWContentTasksListModuleIDKey)
		aCoder.encode(beforeSubmitFormID, forKey: kFWContentTasksListBeforeSubmitFormIDKey)
		aCoder.encode(isSendTask, forKey: kFWContentTasksListIsSendTaskKey)
		aCoder.encode(targetActionName, forKey: kFWContentTasksListTargetActionNameKey)
		aCoder.encode(classId, forKey: kFWContentTasksListClassIdKey)
		aCoder.encode(needsConfirmation, forKey: kFWContentTasksListNeedsConfirmationKey)
		aCoder.encode(internalIdentifier, forKey: kFWContentTasksListInternalIdentifierKey)
		aCoder.encode(caption, forKey: kFWContentTasksListCaptionKey)
		aCoder.encode(hasDefaultInputForm, forKey: kFWContentTasksListHasDefaultInputFormKey)
		aCoder.encode(taskOpenLocation, forKey: kFWContentTasksListTaskOpenLocationKey)
		aCoder.encode(targetActionID, forKey: kFWContentTasksListTargetActionIDKey)

    }

}
