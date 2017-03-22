//
//  FWContents.swift
//
//  Created by Pratik on 24/02/17
//  Copyright (c) Indianic. All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWContents: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWContentsTitleKey: String = "title"
	internal let kFWContentsObjectIDKey: String = "objectID"
	internal let kFWContentsRecipientsIDsKey: String = "recipientsIDs"
	internal let kFWContentsCreatorKey: String = "creator"
	internal let kFWContentsCreationDateKey: String = "creationDate"
	internal let kFWContentsViewStatusKey: String = "viewStatus"
	internal let kFWContentsLastModifierKey: String = "lastModifier"
	internal let kFWContentsPriorityKey: String = "priority"
	internal let kFWContentsSenderIDKey: String = "senderID"
	internal let kFWContentsExpiresAfterValueKey: String = "expiresAfterValue"
	internal let kFWContentsShowThumbnailKey: String = "showThumbnail"
	internal let kFWContentsLastModificationDateKey: String = "lastModificationDate"
	internal let kFWContentsHasThumbnailKey: String = "hasThumbnail"
	internal let kFWContentsThumbnailURlKey: String = "thumbnailURl"
	internal let kFWContentsReplyToNameKey: String = "replyToName"
	internal let kFWContentsSearchKeywordsKey: String = "searchKeywords"
	internal let kFWContentsIsDraftKey: String = "isDraft"
	internal let kFWContentsIsrtlKey: String = "isrtl"
	internal let kFWContentsRecipientsNamesKey: String = "recipientsNames"
	internal let kFWContentsSenderNameKey: String = "senderName"
	internal let kFWContentsExpiresAfterUnitKey: String = "expiresAfterUnit"
	internal let kFWContentsBodyKey: String = "body"
	internal let kFWContentsClassIDKey: String = "classID"
	internal let kFWContentsReplyToIDKey: String = "replyToID"
	internal let kFWContentsExpiresKey: String = "expires"


    // MARK: Properties
	public var title: String?
	public var objectID: String?
	public var recipientsIDs: String?
	public var creator: String?
	public var creationDate: String?
	public var viewStatus: String?
	public var lastModifier: String?
	public var priority: String?
	public var senderID: String?
	public var expiresAfterValue: Int?
	public var showThumbnail: Bool = false
	public var lastModificationDate: String?
	public var hasThumbnail: Bool = false
	public var thumbnailURl: String?
	public var replyToName: String?
	public var searchKeywords: String?
	public var isDraft: Bool = false
	public var isrtl: Bool = false
	public var recipientsNames: String?
	public var senderName: String?
	public var expiresAfterUnit: Int?
	public var body: String?
	public var classID: String?
	public var replyToID: String?
	public var expires: Bool = false


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
		title = json[kFWContentsTitleKey].string
		objectID = json[kFWContentsObjectIDKey].string
		recipientsIDs = json[kFWContentsRecipientsIDsKey].string
		creator = json[kFWContentsCreatorKey].string
		creationDate = json[kFWContentsCreationDateKey].string
		viewStatus = json[kFWContentsViewStatusKey].string
		lastModifier = json[kFWContentsLastModifierKey].string
		priority = json[kFWContentsPriorityKey].string
		senderID = json[kFWContentsSenderIDKey].string
		expiresAfterValue = json[kFWContentsExpiresAfterValueKey].int
		showThumbnail = json[kFWContentsShowThumbnailKey].boolValue
		lastModificationDate = json[kFWContentsLastModificationDateKey].string
		hasThumbnail = json[kFWContentsHasThumbnailKey].boolValue
		thumbnailURl = json[kFWContentsThumbnailURlKey].string
		replyToName = json[kFWContentsReplyToNameKey].string
		searchKeywords = json[kFWContentsSearchKeywordsKey].string
		isDraft = json[kFWContentsIsDraftKey].boolValue
		isrtl = json[kFWContentsIsrtlKey].boolValue
		recipientsNames =  json[kFWContentsRecipientsNamesKey].string
		senderName = json[kFWContentsSenderNameKey].string
		expiresAfterUnit = json[kFWContentsExpiresAfterUnitKey].int
		body = json[kFWContentsBodyKey].string
		classID = json[kFWContentsClassIDKey].string
		replyToID = json[kFWContentsReplyToIDKey].string
		expires = json[kFWContentsExpiresKey].boolValue

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if title != nil {
			dictionary.updateValue(title! as AnyObject, forKey: kFWContentsTitleKey)
		}
		if objectID != nil {
			dictionary.updateValue(objectID! as AnyObject, forKey: kFWContentsObjectIDKey)
		}
		if recipientsIDs != nil {
			dictionary.updateValue(recipientsIDs! as AnyObject, forKey: kFWContentsRecipientsIDsKey)
		}
		if creator != nil {
			dictionary.updateValue(creator! as AnyObject, forKey: kFWContentsCreatorKey)
		}
		if creationDate != nil {
			dictionary.updateValue(creationDate! as AnyObject, forKey: kFWContentsCreationDateKey)
		}
		if viewStatus != nil {
			dictionary.updateValue(viewStatus! as AnyObject, forKey: kFWContentsViewStatusKey)
		}
		if lastModifier != nil {
			dictionary.updateValue(lastModifier! as AnyObject, forKey: kFWContentsLastModifierKey)
		}
		if priority != nil {
			dictionary.updateValue(priority! as AnyObject, forKey: kFWContentsPriorityKey)
		}
		if senderID != nil {
			dictionary.updateValue(senderID! as AnyObject, forKey: kFWContentsSenderIDKey)
		}
		if expiresAfterValue != nil {
			dictionary.updateValue(expiresAfterValue! as AnyObject, forKey: kFWContentsExpiresAfterValueKey)
		}
		dictionary.updateValue(showThumbnail as AnyObject, forKey: kFWContentsShowThumbnailKey)
		if lastModificationDate != nil {
			dictionary.updateValue(lastModificationDate! as AnyObject, forKey: kFWContentsLastModificationDateKey)
		}
		dictionary.updateValue(hasThumbnail as AnyObject, forKey: kFWContentsHasThumbnailKey)
		if thumbnailURl != nil {
			dictionary.updateValue(thumbnailURl! as AnyObject, forKey: kFWContentsThumbnailURlKey)
		}
		if replyToName != nil {
			dictionary.updateValue(replyToName! as AnyObject, forKey: kFWContentsReplyToNameKey)
		}
		if searchKeywords != nil {
			dictionary.updateValue(searchKeywords! as AnyObject, forKey: kFWContentsSearchKeywordsKey)
		}
		dictionary.updateValue(isDraft as AnyObject, forKey: kFWContentsIsDraftKey)
		dictionary.updateValue(isrtl as AnyObject, forKey: kFWContentsIsrtlKey)
		if recipientsNames != nil {
			dictionary.updateValue(recipientsNames! as AnyObject, forKey: kFWContentsRecipientsNamesKey)
		}
		if senderName != nil {
			dictionary.updateValue(senderName! as AnyObject, forKey: kFWContentsSenderNameKey)
		}
		if expiresAfterUnit != nil {
			dictionary.updateValue(expiresAfterUnit! as AnyObject, forKey: kFWContentsExpiresAfterUnitKey)
		}
		if body != nil {
			dictionary.updateValue(body! as AnyObject, forKey: kFWContentsBodyKey)
		}
		if classID != nil {
			dictionary.updateValue(classID! as AnyObject, forKey: kFWContentsClassIDKey)
		}
		if replyToID != nil {
			dictionary.updateValue(replyToID! as AnyObject, forKey: kFWContentsReplyToIDKey)
		}
		dictionary.updateValue(expires as AnyObject, forKey: kFWContentsExpiresKey)

        return dictionary
    }

    
    
    
    
    
    
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.title = aDecoder.decodeObject(forKey: kFWContentsTitleKey) as? String
		self.objectID = aDecoder.decodeObject(forKey: kFWContentsObjectIDKey) as? String
		self.recipientsIDs = aDecoder.decodeObject(forKey: kFWContentsRecipientsIDsKey) as? String
		self.creator = aDecoder.decodeObject(forKey: kFWContentsCreatorKey) as? String
		self.creationDate = aDecoder.decodeObject(forKey: kFWContentsCreationDateKey) as? String
		self.viewStatus = aDecoder.decodeObject(forKey: kFWContentsViewStatusKey) as? String
		self.lastModifier = aDecoder.decodeObject(forKey: kFWContentsLastModifierKey) as? String
		self.priority = aDecoder.decodeObject(forKey: kFWContentsPriorityKey) as? String
		self.senderID = aDecoder.decodeObject(forKey: kFWContentsSenderIDKey) as? String
		self.expiresAfterValue = aDecoder.decodeObject(forKey: kFWContentsExpiresAfterValueKey) as? Int
		self.showThumbnail = aDecoder.decodeBool(forKey: kFWContentsShowThumbnailKey)
		self.lastModificationDate = aDecoder.decodeObject(forKey: kFWContentsLastModificationDateKey) as? String
		self.hasThumbnail = aDecoder.decodeBool(forKey: kFWContentsHasThumbnailKey)
		self.thumbnailURl = aDecoder.decodeObject(forKey: kFWContentsThumbnailURlKey) as? String
		self.replyToName = aDecoder.decodeObject(forKey: kFWContentsReplyToNameKey) as? String
		self.searchKeywords = aDecoder.decodeObject(forKey: kFWContentsSearchKeywordsKey) as? String
		self.isDraft = aDecoder.decodeBool(forKey: kFWContentsIsDraftKey)
		self.isrtl = aDecoder.decodeBool(forKey: kFWContentsIsrtlKey)
		self.recipientsNames = aDecoder.decodeObject(forKey: kFWContentsRecipientsNamesKey) as? String
		self.senderName = aDecoder.decodeObject(forKey: kFWContentsSenderNameKey) as? String
		self.expiresAfterUnit = aDecoder.decodeObject(forKey: kFWContentsExpiresAfterUnitKey) as? Int
		self.body = aDecoder.decodeObject(forKey: kFWContentsBodyKey) as? String
		self.classID = aDecoder.decodeObject(forKey: kFWContentsClassIDKey) as? String
		self.replyToID = aDecoder.decodeObject(forKey: kFWContentsReplyToIDKey) as? String
		self.expires = aDecoder.decodeBool(forKey: kFWContentsExpiresKey)

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(title, forKey: kFWContentsTitleKey)
		aCoder.encode(objectID, forKey: kFWContentsObjectIDKey)
		aCoder.encode(recipientsIDs, forKey: kFWContentsRecipientsIDsKey)
		aCoder.encode(creator, forKey: kFWContentsCreatorKey)
		aCoder.encode(creationDate, forKey: kFWContentsCreationDateKey)
		aCoder.encode(viewStatus, forKey: kFWContentsViewStatusKey)
		aCoder.encode(lastModifier, forKey: kFWContentsLastModifierKey)
		aCoder.encode(priority, forKey: kFWContentsPriorityKey)
		aCoder.encode(senderID, forKey: kFWContentsSenderIDKey)
		aCoder.encode(expiresAfterValue, forKey: kFWContentsExpiresAfterValueKey)
		aCoder.encode(showThumbnail, forKey: kFWContentsShowThumbnailKey)
		aCoder.encode(lastModificationDate, forKey: kFWContentsLastModificationDateKey)
		aCoder.encode(hasThumbnail, forKey: kFWContentsHasThumbnailKey)
		aCoder.encode(thumbnailURl, forKey: kFWContentsThumbnailURlKey)
		aCoder.encode(replyToName, forKey: kFWContentsReplyToNameKey)
		aCoder.encode(searchKeywords, forKey: kFWContentsSearchKeywordsKey)
		aCoder.encode(isDraft, forKey: kFWContentsIsDraftKey)
		aCoder.encode(isrtl, forKey: kFWContentsIsrtlKey)
		aCoder.encode(recipientsNames, forKey: kFWContentsRecipientsNamesKey)
		aCoder.encode(senderName, forKey: kFWContentsSenderNameKey)
		aCoder.encode(expiresAfterUnit, forKey: kFWContentsExpiresAfterUnitKey)
		aCoder.encode(body, forKey: kFWContentsBodyKey)
		aCoder.encode(classID, forKey: kFWContentsClassIDKey)
		aCoder.encode(replyToID, forKey: kFWContentsReplyToIDKey)
		aCoder.encode(expires, forKey: kFWContentsExpiresKey)

    }

}
