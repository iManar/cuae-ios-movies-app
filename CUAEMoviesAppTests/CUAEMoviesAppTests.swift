//
//  CUAEMoviesAppTests.swift
//  CUAEMoviesAppTests
//
//  Created by Manar Magdy on 7/11/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import Foundation
import XCTest


@testable import CUAEMoviesApp

class CUAEMoviesAppTests: XCTestCase {
    
    var searchManager: SearchManager!
    var easyCashing: EasyCashing!
    
    override func setUp() {
        super.setUp()

        searchManager = SearchManager()
        easyCashing = EasyCashingImplementation()
    }
    
    // MARK: Base functions
    func getResultSuccessWithQuery(query: String, page: Int? = nil) -> SearchResult? {
        
        var searchResult: SearchResult?
        // The expectation to wait until got the response from API
        let expectation =  self.expectation(description: "SomeService does stuff and runs the callback closure")

        searchManager.getSearchResult(query, pageNum: page ?? 1) { (response, error) in
            guard let responseModel = response else { return }
            searchResult = responseModel
            expectation.fulfill()
            debugPrint("\n*Found results: \(responseModel.totalResults ?? 0) for keyword: \(query) 💥\n")
            XCTAssertTrue(responseModel.totalResults ?? 0 > 0)
        }
        
        self.waitForExpectations(timeout: 60.0) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
        
        return searchResult
    }
    
    // MARK: Test cases
    func testGetResultsSuccessWithQueryIronMan() {
        let movieResults = getResultSuccessWithQuery(query: "Rock")
        XCTAssertTrue(movieResults?.totalResults ?? 0 > 0)
    }
    
    func testGetResultsSuccessWithNextPageIronMan() {
        let movieResults = getResultSuccessWithQuery(query: "Rock", page: 2)
        XCTAssertTrue(movieResults?.totalResults ?? 0 > 0)
    }
    
    func testCaching() {
        let key = "anyKey"
        let value = ["1", "2", "3", "4"]
        easyCashing.cache(object: value, forKey: key)
        let loadedValue = easyCashing.load(objectForKey: key) as! [String]
        XCTAssert(loadedValue == value, "EXPECTED: LoadedValue to be \(String(describing: value))")
    }
    
    func testLoadInvalidKeys() {
        let key = "invalidKey"
        let loadedValue = easyCashing.load(objectForKey: key)
        XCTAssertNil(loadedValue)
    }
    
}
