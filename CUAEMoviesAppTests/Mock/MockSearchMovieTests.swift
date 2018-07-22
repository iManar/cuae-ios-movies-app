//
//  MockSearchMovieTests.swift
//  CareemMovieTests
//
//  Created by Manar Magdy on 7/15/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//


/* TEST CASES:
 1. Mock test search success
 2. Mock test search with error
 */
extension CUAEMoviesAppTests {
    
    // Mock serviece    
    func testMockResultsWithSuccess() {
        
        searchManager.getSearchResult("Rock", pageNum: 1) { (response, error) in
            guard let responseModel = response else { return }
            debugPrint("\n**Found results: \(responseModel.totalResults ?? 0) for keyword: Rock 💥\n")
            XCTAssertTrue(responseModel.totalResults ?? 0 > 0)
        }
    }
    
    func testMockResultsWithError() {
        searchManager.getSearchResult("", pageNum: 1) { (response, error) in
            XCTAssertTrue(error != nil)
        }
    }
}
