//
//  MoviesListPresenter.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/21/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import Foundation


/**
 *  Movies List Presenter Protocol Declaration
 */
protocol MoviesListProtocol {
    
    func getMoviesList(_ searchKeyword: String, pageNum: Int)
    func getCurrentPageNumber()-> Int
    func getSuggestionsList()-> [String]
}


/**
 *  Movies List Presenter Protocols Implementation
 */
class MoviesListPresenter: MoviesListProtocol {
    
    
    
    // MARK: - Properties
    
    // MARK: - Private Properties
    private weak var delegate: MoviesListViewProtocol!
    private let serviceManager = SearchManager()
    
    
    lazy var moviesList: [Movie] = []
    var searchResult: SearchResult?
    
    
    // MARK: - Methods
    
    // MARK: - Init
    
    /**
     Initialize an instance of Movies List Presenter with View Controller delegate
     - returns: MoviesListPresenter Object
     */
    init(_ delegate: MoviesListViewProtocol) {
        self.delegate = delegate
    }
    
    
    
    func getMoviesList(_ searchKeyword: String, pageNum: Int) {
        
        serviceManager.getSearchResult(searchKeyword, pageNum: pageNum) {
            [weak self] (response, error) in
            guard let strongSelf = self else { return }
           
            if let responseModel = response {
                strongSelf.searchResult = responseModel
                if pageNum == 1 {
                    strongSelf.moviesList = []
                }
                strongSelf.moviesList.append(contentsOf: responseModel.movies ?? [])
                strongSelf.delegate.refreshView()
            } else {
                strongSelf.delegate.showErrorWithMessage(error!.localizedDescription)
            }
        }
    }
    
    func getCurrentPageNumber() -> Int {
        return searchResult?.page ?? 1
    }
    
    func getSuggestionsList() -> [String] {
        return serviceManager.getLastSuccessfulSearchQueries()
    }
    
}
