//
//  SearchManager.swift
//  CUAEMoviesApp
//
//  Created by tr on 7/14/18.
//  Copyright © 2018 tr. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchManager {
    
    private let apiKey = "2696829a81b1b5827d515ff121700838"
    
    func getSearchResult(_ queryString: String, pageNum: Int, completionHandler: ((SearchResult?, Error?) -> Void)!) {
        
        AppServiceManager.doRequest(path: .search(apiKey: apiKey, query: queryString, page: pageNum), method: .get, success: {
            (response) in
            
            if let data = response as? [String: Any] {
                completionHandler(Mapper<SearchResult>().map(JSON: data)!, nil)
            } else {
                completionHandler(nil, genericError())
            }
        }, failure: { (error) in
            debugPrint(error.localizedDescription)
            completionHandler(nil, genericError())
        })
    }
}

