//
//  FWData.swift
//
//  Created by Pratik on 24/02/17
//  Copyright (c) Indianic. All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWData: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWDataOppKey: String = "opp"
	internal let kFWDataRenderDateRTLKey: String = "renderDateRTL"
	internal let kFWDataPKey: String = "p"
	internal let kFWDataIsrtlKey: String = "isrtl"
	internal let kFWDataShowPagesNavigationKey: String = "showPagesNavigation"
	internal let kFWDataVKey: String = "v"
	internal let kFWDataRfcKey: String = "rfc"
	internal let kFWDataObjKey: String = "obj"
	internal let kFWDataClsKey: String = "cls"
	internal let kFWDataResultsDataTableKey: String = "resultsDataTable"
	internal let kFWDataDKey: String = "d"
	internal let kFWDataDtEndDateKey: String = "dtEndDate"
	internal let kFWDataDefaultListFontSizeKey: String = "defaultListFontSize"
	internal let kFWDataPaginationInfoKey: String = "paginationInfo"
	internal let kFWDataContentsKey: String = "contents"
	internal let kFWDataDateOptionsListKey: String = "dateOptionsList"
	internal let kFWDataCurrentMessageKey: String = "currentMessage"
	internal let kFWDataLsKey: String = "ls"
	internal let kFWDataOcKey: String = "oc"
	internal let kFWDataDtStartDateKey: String = "dtStartDate"
	internal let kFWDataPcKey: String = "pc"


    // MARK: Properties
	public var opp: Int?
	public var renderDateRTL: Bool = false
	public var p: Int?
	public var isrtl: Bool = false
	public var showPagesNavigation: Bool = false
	public var v: Int?
	public var rfc: Bool = false
	public var obj: String?
	public var cls: String?
	public var resultsDataTable:String?
	public var d: String?
	public var dtEndDate: String?
	public var defaultListFontSize: Float?
	public var paginationInfo: FWPaginationInfo?
	public var contents: [FWContents]?
	public var dateOptionsList: [FWDateOptionsList]?
	public var currentMessage: String?
	public var ls: Int?
	public var oc: Int?
	public var dtStartDate: String?
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
		opp = json[kFWDataOppKey].int
		renderDateRTL = json[kFWDataRenderDateRTLKey].boolValue
		p = json[kFWDataPKey].int
		isrtl = json[kFWDataIsrtlKey].boolValue
		showPagesNavigation = json[kFWDataShowPagesNavigationKey].boolValue
		v = json[kFWDataVKey].int
		rfc = json[kFWDataRfcKey].boolValue
		obj = json[kFWDataObjKey].string
		cls = json[kFWDataClsKey].string
//		if let tempValue = json[kFWDataResultsDataTableKey].array {
//			resultsDataTable = tempValue
//		} else {
//			resultsDataTable = nil
//		}
        resultsDataTable = json[kFWDataResultsDataTableKey].string
		d = json[kFWDataDKey].string
		dtEndDate = json[kFWDataDtEndDateKey].string
		defaultListFontSize = json[kFWDataDefaultListFontSizeKey].float
		paginationInfo = FWPaginationInfo(json: json[kFWDataPaginationInfoKey])
		contents = []
		if let items = json[kFWDataContentsKey].array {
			for item in items {
				contents?.append(FWContents(json: item))
			}
		} else {
			contents = nil
		}
		dateOptionsList = []
		if let items = json[kFWDataDateOptionsListKey].array {
			for item in items {
				dateOptionsList?.append(FWDateOptionsList(json: item))
			}
		} else {
			dateOptionsList = nil
		}
		currentMessage = json[kFWDataCurrentMessageKey].string
		ls = json[kFWDataLsKey].int
		oc = json[kFWDataOcKey].int
		dtStartDate = json[kFWDataDtStartDateKey].string
		pc = json[kFWDataPcKey].int

        
    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if opp != nil {
			dictionary.updateValue(opp! as AnyObject, forKey: kFWDataOppKey)
		}
		dictionary.updateValue(renderDateRTL as AnyObject, forKey: kFWDataRenderDateRTLKey)
		if p != nil {
			dictionary.updateValue(p! as AnyObject, forKey: kFWDataPKey)
		}
		dictionary.updateValue(isrtl as AnyObject, forKey: kFWDataIsrtlKey)
		dictionary.updateValue(showPagesNavigation as AnyObject, forKey: kFWDataShowPagesNavigationKey)
		if v != nil {
			dictionary.updateValue(v! as AnyObject, forKey: kFWDataVKey)
		}
		dictionary.updateValue(rfc as AnyObject, forKey: kFWDataRfcKey)
		if obj != nil {
			dictionary.updateValue(obj! as AnyObject, forKey: kFWDataObjKey)
		}
		if cls != nil {
			dictionary.updateValue(cls! as AnyObject, forKey: kFWDataClsKey)
		}
		if d != nil {
			dictionary.updateValue(d! as AnyObject, forKey: kFWDataDKey)
		}
		if dtEndDate != nil {
			dictionary.updateValue(dtEndDate! as AnyObject, forKey: kFWDataDtEndDateKey)
		}
		if defaultListFontSize != nil {
			dictionary.updateValue(defaultListFontSize! as AnyObject, forKey: kFWDataDefaultListFontSizeKey)
		}
		if paginationInfo != nil {
			dictionary.updateValue(paginationInfo!.dictionaryRepresentation() as AnyObject, forKey: kFWDataPaginationInfoKey)
		}
		if (contents?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in contents! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kFWDataContentsKey)
		}
		if (dateOptionsList?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in dateOptionsList! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kFWDataDateOptionsListKey)
		}
		if currentMessage != nil {
			dictionary.updateValue(currentMessage as AnyObject, forKey: kFWDataCurrentMessageKey)
		}
		if ls != nil {
			dictionary.updateValue(ls! as AnyObject, forKey: kFWDataLsKey)
		}
		if oc != nil {
			dictionary.updateValue(oc! as AnyObject, forKey: kFWDataOcKey)
		}
		if dtStartDate != nil {
			dictionary.updateValue(dtStartDate! as AnyObject, forKey: kFWDataDtStartDateKey)
		}
		if pc != nil {
			dictionary.updateValue(pc! as AnyObject, forKey: kFWDataPcKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.opp = aDecoder.decodeObject(forKey: kFWDataOppKey) as? Int
		self.renderDateRTL = aDecoder.decodeBool(forKey: kFWDataRenderDateRTLKey)
		self.p = aDecoder.decodeObject(forKey: kFWDataPKey) as? Int
		self.isrtl = aDecoder.decodeBool(forKey: kFWDataIsrtlKey)
		self.showPagesNavigation = aDecoder.decodeBool(forKey: kFWDataShowPagesNavigationKey)
		self.v = aDecoder.decodeObject(forKey: kFWDataVKey) as? Int
		self.rfc = aDecoder.decodeBool(forKey: kFWDataRfcKey)
		self.obj = aDecoder.decodeObject(forKey: kFWDataObjKey) as? String
		self.cls = aDecoder.decodeObject(forKey: kFWDataClsKey) as? String
		self.d = aDecoder.decodeObject(forKey: kFWDataDKey) as? String
		self.dtEndDate = aDecoder.decodeObject(forKey: kFWDataDtEndDateKey) as? String
		self.defaultListFontSize = aDecoder.decodeObject(forKey: kFWDataDefaultListFontSizeKey) as? Float
		self.paginationInfo = aDecoder.decodeObject(forKey: kFWDataPaginationInfoKey) as? FWPaginationInfo
		self.contents = aDecoder.decodeObject(forKey: kFWDataContentsKey) as? [FWContents]
		self.dateOptionsList = aDecoder.decodeObject(forKey: kFWDataDateOptionsListKey) as? [FWDateOptionsList]
		self.currentMessage = aDecoder.decodeObject(forKey: kFWDataCurrentMessageKey) as? String
		self.ls = aDecoder.decodeObject(forKey: kFWDataLsKey) as? Int
		self.oc = aDecoder.decodeObject(forKey: kFWDataOcKey) as? Int
		self.dtStartDate = aDecoder.decodeObject(forKey: kFWDataDtStartDateKey) as? String
		self.pc = aDecoder.decodeObject(forKey: kFWDataPcKey) as? Int

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(opp, forKey: kFWDataOppKey)
		aCoder.encode(renderDateRTL, forKey: kFWDataRenderDateRTLKey)
		aCoder.encode(p, forKey: kFWDataPKey)
		aCoder.encode(isrtl, forKey: kFWDataIsrtlKey)
		aCoder.encode(showPagesNavigation, forKey: kFWDataShowPagesNavigationKey)
		aCoder.encode(v, forKey: kFWDataVKey)
		aCoder.encode(rfc, forKey: kFWDataRfcKey)
		aCoder.encode(obj, forKey: kFWDataObjKey)
		aCoder.encode(cls, forKey: kFWDataClsKey)
		aCoder.encode(resultsDataTable, forKey: kFWDataResultsDataTableKey)
		aCoder.encode(d, forKey: kFWDataDKey)
		aCoder.encode(dtEndDate, forKey: kFWDataDtEndDateKey)
		aCoder.encode(defaultListFontSize, forKey: kFWDataDefaultListFontSizeKey)
		aCoder.encode(paginationInfo, forKey: kFWDataPaginationInfoKey)
		aCoder.encode(contents, forKey: kFWDataContentsKey)
		aCoder.encode(dateOptionsList, forKey: kFWDataDateOptionsListKey)
		aCoder.encode(currentMessage, forKey: kFWDataCurrentMessageKey)
		aCoder.encode(ls, forKey: kFWDataLsKey)
		aCoder.encode(oc, forKey: kFWDataOcKey)
		aCoder.encode(dtStartDate, forKey: kFWDataDtStartDateKey)
		aCoder.encode(pc, forKey: kFWDataPcKey)

    }

}
