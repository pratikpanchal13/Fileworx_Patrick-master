//
//  FWPaginationInfo.swift
//
//  Created by Pratik on 24/02/17
//  Copyright (c) Indianic. All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWPaginationInfo: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWPaginationInfoPreviousEnabledKey: String = "previousEnabled"
	internal let kFWPaginationInfoNextEnabledKey: String = "nextEnabled"
	internal let kFWPaginationInfoPKey: String = "p"
	internal let kFWPaginationInfoPcKey: String = "pc"


    // MARK: Properties
	public var previousEnabled: Bool = false
	public var nextEnabled: Bool = false
	public var p: Int?
	public var pc: Int?


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
		previousEnabled = json[kFWPaginationInfoPreviousEnabledKey].boolValue
		nextEnabled = json[kFWPaginationInfoNextEnabledKey].boolValue
		p = json[kFWPaginationInfoPKey].int
		pc = json[kFWPaginationInfoPcKey].int

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		dictionary.updateValue(previousEnabled as AnyObject, forKey: kFWPaginationInfoPreviousEnabledKey)
		dictionary.updateValue(nextEnabled as AnyObject, forKey: kFWPaginationInfoNextEnabledKey)
		if p != nil {
			dictionary.updateValue(p! as AnyObject, forKey: kFWPaginationInfoPKey)
		}
		if pc != nil {
			dictionary.updateValue(pc! as AnyObject, forKey: kFWPaginationInfoPcKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.previousEnabled = aDecoder.decodeBool(forKey: kFWPaginationInfoPreviousEnabledKey)
		self.nextEnabled = aDecoder.decodeBool(forKey: kFWPaginationInfoNextEnabledKey)
		self.p = aDecoder.decodeObject(forKey: kFWPaginationInfoPKey) as? Int
		self.pc = aDecoder.decodeObject(forKey: kFWPaginationInfoPcKey) as? Int

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(previousEnabled, forKey: kFWPaginationInfoPreviousEnabledKey)
		aCoder.encode(nextEnabled, forKey: kFWPaginationInfoNextEnabledKey)
		aCoder.encode(p, forKey: kFWPaginationInfoPKey)
		aCoder.encode(pc, forKey: kFWPaginationInfoPcKey)

    }

}
