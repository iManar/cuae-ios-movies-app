//
//  MoviesDBUrls.swift
//  CUAEMoviesApp
//
//  Created by tr on 7/14/18.
//  Copyright © 2018 tr. All rights reserved.
//

import Foundation

enum MoviesDBUrls {
    
    enum UrlEnvironment  {
        case baseUrl
        
        func getBaseUrl() -> String {
            switch self {
            case .baseUrl:
                return "http://api.themoviedb.org/3/"
            }
        }
    }
    
    
    enum Path {
        case search(apiKey: String, query: String, page: Int)
        
        var absolutePath: String {
            switch self {
            case .search(let apiKey, let query, let page):
                return "search/movie?api_key=\(apiKey)&query=\(query)&page=\(page)"
            }
        }
    }
    
    
    
    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
    }
}
