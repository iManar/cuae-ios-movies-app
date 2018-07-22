//
//	SearchResult.swift
//
//	Create by Manar Magdy on 15/7/2018
//	Copyright © 2018 Manar Magdy. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class SearchResult : NSObject, NSCoding, Mappable{

	var movies : [Movie]?
	var page : Int?
	var totalPages : Int?
	var totalResults : Int?


	class func newInstance(map: Map) -> Mappable?{
		return SearchResult()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		movies <- map["results"]
		page <- map["page"]
		totalPages <- map["total_pages"]
		totalResults <- map["total_results"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         movies = aDecoder.decodeObject(forKey: "results") as? [Movie]
         page = aDecoder.decodeObject(forKey: "page") as? Int
         totalPages = aDecoder.decodeObject(forKey: "total_pages") as? Int
         totalResults = aDecoder.decodeObject(forKey: "total_results") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if movies != nil{
			aCoder.encode(movies, forKey: "results")
		}
		if page != nil{
			aCoder.encode(page, forKey: "page")
		}
		if totalPages != nil{
			aCoder.encode(totalPages, forKey: "total_pages")
		}
		if totalResults != nil{
			aCoder.encode(totalResults, forKey: "total_results")
		}

	}

}
