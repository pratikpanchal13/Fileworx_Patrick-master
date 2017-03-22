//
//  FWDateOptionsList.swift
//
//  Created by Pratik on 24/02/17
//  Copyright (c) Indianic. All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWDateOptionsList: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWDateOptionsListSelectedKey: String = "selected"
	internal let kFWDateOptionsListHtmlAttributesKey: String = "htmlAttributes"
	internal let kFWDateOptionsListValueKey: String = "value"
	internal let kFWDateOptionsListTextKey: String = "text"
	internal let kFWDateOptionsListTagKey: String = "tag"


    // MARK: Properties
	public var selected: Bool = false
	public var htmlAttributes: String?
	public var value: String?
	public var text: String?
	public var tag: String?


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
		selected = json[kFWDateOptionsListSelectedKey].boolValue
		htmlAttributes = json[kFWDateOptionsListHtmlAttributesKey].string
		value = json[kFWDateOptionsListValueKey].string
		text = json[kFWDateOptionsListTextKey].string
		tag = json[kFWDateOptionsListTagKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		dictionary.updateValue(selected as AnyObject, forKey: kFWDateOptionsListSelectedKey)
		if htmlAttributes != nil {
			dictionary.updateValue(htmlAttributes! as AnyObject, forKey: kFWDateOptionsListHtmlAttributesKey)
		}
		if value != nil {
			dictionary.updateValue(value! as AnyObject, forKey: kFWDateOptionsListValueKey)
		}
		if text != nil {
			dictionary.updateValue(text! as AnyObject, forKey: kFWDateOptionsListTextKey)
		}
		if tag != nil {
			dictionary.updateValue(tag! as AnyObject, forKey: kFWDateOptionsListTagKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.selected = aDecoder.decodeBool(forKey: kFWDateOptionsListSelectedKey)
		self.htmlAttributes = aDecoder.decodeObject(forKey: kFWDateOptionsListHtmlAttributesKey) as? String
		self.value = aDecoder.decodeObject(forKey: kFWDateOptionsListValueKey) as? String
		self.text = aDecoder.decodeObject(forKey: kFWDateOptionsListTextKey) as? String
		self.tag = aDecoder.decodeObject(forKey: kFWDateOptionsListTagKey) as? String

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(selected, forKey: kFWDateOptionsListSelectedKey)
		aCoder.encode(htmlAttributes, forKey: kFWDateOptionsListHtmlAttributesKey)
		aCoder.encode(value, forKey: kFWDateOptionsListValueKey)
		aCoder.encode(text, forKey: kFWDateOptionsListTextKey)
		aCoder.encode(tag, forKey: kFWDateOptionsListTagKey)

    }

}
