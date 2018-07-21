//
//  MoviesListPresenter.swift
//  CUAEMoviesApp
//
//  Created by tr on 7/21/18.
//  Copyright © 2018 tr. All rights reserved.
//

import Foundation


/**
 *  Movies List Presenter Protocol Declaration
 */
protocol MoviesListProtocol {
    
    func getMoviesList(_ searchKeyword: String, pageNum: Int)
//    func completeBillDetailsModel(_ selectedBill: VFBill)
//
//    func getNumberOfRows(_ withAlarms: Bool) -> Int
//    func toggleCategoryAtIndex(_ index: Int)
//
//    func getCellAtIndex(_ index: Int, tableView: UITableView, withAlarms: Bool) -> UITableViewCell?
//
//    func showConsumpationDetailForBill(model: VFBillIntegrationModel)
}


/**
 *  Movies List Presenter Protocols Implementation
 */
class MoviesListPresenter: MoviesListProtocol {
    
    
    // MARK: - Properties
    
    // MARK: - Private Properties
    private weak var delegate: MoviesListViewProtocol!
    private let serviceManager = SearchManager()
    
    
    // MARK: - Private Lazy Variables
    lazy var moviesList: [Movie] = []
    var searchResult: SearchResult!
    
    
    
    // MARK: - Methods
    
    // MARK: - Init
    
    /**
     Initialize an instance of Bill Details Presenter with View Controller delegate
     - returns: VFGBillDetailsPresenter Object
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
                strongSelf.moviesList.append(contentsOf: responseModel.movies ?? [])
                strongSelf.delegate.refreshView()
            } else {
//                showAlertView(error!.localizedDescription, title: General.errorViewTitle)
            }
        }
    }
}
