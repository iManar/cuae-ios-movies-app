//
//  SearchManager.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/14/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchManager {
    
    private let apiKey = "2696829a81b1b5827d515ff121700838"
    private let cachingKey = "2696829a81b1b5827d515ff121700838"
    private lazy var easyCashing: EasyCashing = EasyCashingImplementation()
    
    func getSearchResult(_ queryString: String, pageNum: Int, completionHandler: ((SearchResult?, Error?) -> Void)!) {
        
        AppServiceManager.doRequest(path: .search(apiKey: apiKey, query: queryString, page: pageNum), method: .get, success: {
            (response) in
            
            if let data = response as? [String: Any] {
                self.addSearchQueryToCache(query: queryString)
                completionHandler(Mapper<SearchResult>().map(JSON: data)!, nil)
            } else {
                completionHandler(nil, genericError)
            }
        }, failure: { (error) in
            debugPrint(error.localizedDescription)
            completionHandler(nil, error)
        })
    }
    
    
    private func addSearchQueryToCache(query: String) {
        var queriesList = [String]()
        if let cached = easyCashing.load(objectForKey: cachingKey) as? [String] {
            queriesList.append(contentsOf: cached)
        }
        if let index = queriesList.index(of: query) {
            queriesList.remove(at:index)
        }
        queriesList.insert(query, at: 0)
        
        easyCashing.cache(object: queriesList, forKey: cachingKey)
    }
    
    
    func getLastSuccessfulSearchQueries() -> [String] {
        if let cachedQueries = easyCashing.load(objectForKey: cachingKey) as? [String] {
            return cachedQueries
        }
        return [String]()
    }
}

