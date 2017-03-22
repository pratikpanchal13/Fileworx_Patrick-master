//
//  FWMessage.swift
//
//  Created by Pratik on 24/02/17
//  Copyright (c) Indianic. All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWMessage: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWMessageDataKey: String = "data"
	internal let kFWMessageMessageKey: String = "message"
	internal let kFWMessageResultKey: String = "result"


    // MARK: Properties
	public var data: FWData?
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
		data = FWData(json: json[kFWMessageDataKey])
		message = json[kFWMessageMessageKey].string
		result = json[kFWMessageResultKey].int

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if data != nil {
			dictionary.updateValue(data!.dictionaryRepresentation() as AnyObject, forKey: kFWMessageDataKey)
		}
		if message != nil {
			dictionary.updateValue(message! as AnyObject, forKey: kFWMessageMessageKey)
		}
		if result != nil {
			dictionary.updateValue(result! as AnyObject, forKey: kFWMessageResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.data = aDecoder.decodeObject(forKey: kFWMessageDataKey) as? FWData
		self.message = aDecoder.decodeObject(forKey: kFWMessageMessageKey) as? String
		self.result = aDecoder.decodeObject(forKey: kFWMessageResultKey) as? Int

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(data, forKey: kFWMessageDataKey)
		aCoder.encode(message, forKey: kFWMessageMessageKey)
		aCoder.encode(result, forKey: kFWMessageResultKey)

    }

}
