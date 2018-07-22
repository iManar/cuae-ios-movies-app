//
//  MoviesDBUrls.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/14/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import Foundation

enum MoviesDBUrls {
    
    enum UrlEnvironment  {
        case baseUrl
        case imageURL
        
        func getBaseUrl() -> String {
            switch self {
            case .baseUrl:
                return "http://api.themoviedb.org/3/"
            case .imageURL:
                return "http://image.tmdb.org/t/p/"
            }
        }
    }
    
    
    
    enum Path {
        case search(apiKey: String, query: String, page: Int)
        case image(size: ImageSize, imagePath: String)
        
        var absolutePath: String {
            switch self {
            case .search(let apiKey, let query, let page):
                return "search/movie?api_key=\(apiKey)&query=\(query)&page=\(page)"
            case .image(let size, let imagePath):
                return UrlEnvironment.imageURL.getBaseUrl() + size.rawValue + imagePath
            }
        }
    }
    
    
    
    enum HttpMethod: String {
        case get  = "GET"
        case post = "POST"
        case put  = "PUT"
    }
    
    enum ImageSize: String {
        case w92    = "w92"
        case w185   = "w185"
        case w500   = "w500"
    }
}
