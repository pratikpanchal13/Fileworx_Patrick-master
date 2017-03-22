


//
//  FWMobileSettingModel.swift
//
//  Created by  on 25/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWMobileSettingModel: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWMobileSettingModelDataKey: String = "data"
	internal let kFWMobileSettingModelMessageKey: String = "message"
	internal let kFWMobileSettingModelResultKey: String = "result"


    // MARK: Properties
	public var data: FWMobileSettingData?
	public var message: String?
	public var result: Int?


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
		data = FWMobileSettingData(json: json[kFWMobileSettingModelDataKey])
		message = json[kFWMobileSettingModelMessageKey].string
		result = json[kFWMobileSettingModelResultKey].int

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if data != nil {
			dictionary.updateValue(data!.dictionaryRepresentation() as AnyObject, forKey: kFWMobileSettingModelDataKey)
		}
		if message != nil {
			dictionary.updateValue(message! as AnyObject, forKey: kFWMobileSettingModelMessageKey)
		}
		if result != nil {
			dictionary.updateValue(result! as AnyObject, forKey: kFWMobileSettingModelResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.data = aDecoder.decodeObject(forKey: kFWMobileSettingModelDataKey) as? FWMobileSettingData
		self.message = aDecoder.decodeObject(forKey: kFWMobileSettingModelMessageKey) as? String
		self.result = aDecoder.decodeObject(forKey: kFWMobileSettingModelResultKey) as? Int

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(data, forKey: kFWMobileSettingModelDataKey)
		aCoder.encode(message, forKey: kFWMobileSettingModelMessageKey)
		aCoder.encode(result, forKey: kFWMobileSettingModelResultKey)

    }

}
