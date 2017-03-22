//
//  FWUserModel.swift
//
//  Created by  on 25/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWUserModel: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWUserModelDataKey: String = "data"
	internal let kFWUserModelMessageKey: String = "message"
	internal let kFWUserModelResultKey: String = "result"


    // MARK: Properties
	public var data: FWUserData?
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
		data = FWUserData(json: json[kFWUserModelDataKey])
		message = json[kFWUserModelMessageKey].string
		result = json[kFWUserModelResultKey].int

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if data != nil {
			dictionary.updateValue(data!.dictionaryRepresentation() as AnyObject, forKey: kFWUserModelDataKey)
		}
		if message != nil {
			dictionary.updateValue(message! as AnyObject, forKey: kFWUserModelMessageKey)
		}
		if result != nil {
			dictionary.updateValue(result! as AnyObject, forKey: kFWUserModelResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.data = aDecoder.decodeObject(forKey: kFWUserModelDataKey) as? FWUserData
		self.message = aDecoder.decodeObject(forKey: kFWUserModelMessageKey) as? String
		self.result = aDecoder.decodeObject(forKey: kFWUserModelResultKey) as? Int

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(data, forKey: kFWUserModelDataKey)
		aCoder.encode(message, forKey: kFWUserModelMessageKey)
		aCoder.encode(result, forKey: kFWUserModelResultKey)

    }

}
