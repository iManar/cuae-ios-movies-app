//
//  MoviesListViewController.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/14/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit


/**
 *  Bill Details view controller Protocols
 */
protocol MoviesListViewProtocol: class {
    
    func updateMoviesList(_ data: [Movie])
    func showErrorWithMessage(_ errorMsg: String)
}



class MoviesListViewController: UIViewController {

    // MARK: - Private Varaibles
    
    /**
     *  The movies list presenter,
     */
    private var moviesListPresenter: MoviesListPresenter!
    
//        {
//        didSet {
//            graphPresenter.updateAlias = { [weak self] alias in
//                self?.accountAliasLabel.text = alias
//            }
//        }
//    }
    
    /**
     *  The details table, showing mode
     */
    var showingMode: TableShowMode = .loading
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MoviesListViewController: MoviesListViewProtocol {
    
    func updateMoviesList(_ data: [Movie]) {
        showingMode = .normal
    }
    
    func showErrorWithMessage(_ errorMsg: String) {
        showingMode = .error
    }
    
    
}
