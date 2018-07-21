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
    
    func refreshView()
    func showErrorWithMessage(_ errorMsg: String)
}



class MoviesListViewController: UIViewController {

    // MARK: - Private Varaibles
    
    /**
     *  The movies list presenter,
     */
    private lazy var moviesListPresenter: MoviesListPresenter = MoviesListPresenter(self)
    
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
    var showingMode: TableShowMode = .loading {
        didSet {
            contentTableView.reloadData()
            updateResultsLabel()
        }
    }
   
    @IBOutlet private weak var contentTableView: UITableView!
    @IBOutlet private weak var moviesSearchBar: UISearchBar!
    @IBOutlet private weak var tableHeaderView: UIView!
    @IBOutlet private weak var resultsLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    
    private func setupViews() {
        
        contentTableView.registerCellNib(MovieCell.self)
        contentTableView.rowHeight = UITableViewAutomaticDimension
        contentTableView.estimatedRowHeight = self.view.bounds.width
    }
    
    private func updateResultsLabel() {
        resultsLabel.text = "Found \(moviesListPresenter.searchResult.totalResults ?? 0) results by '\(moviesSearchBar.text ?? "")'"
    }
}

extension MoviesListViewController: MoviesListViewProtocol {
    
    func refreshView() {
        showingMode = .normal
        debugPrint("💃💃💃")
    }
    
    func showErrorWithMessage(_ errorMsg: String) {
        showingMode = .error
        debugPrint("🤷‍♀️🤷‍♀️🤷‍♀️")
    }
    
    
}




// MARK: - UISearchBarDelegate
extension MoviesListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        moviesListPresenter.getMoviesList(searchBar.text ?? "", pageNum: 1)
    }
}


extension MoviesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch showingMode {
        case .normal:
            return moviesListPresenter.moviesList.count
        case .error:
            return 1
        case .loading:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch showingMode {
        case .error:
            return UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
            cell.setupWithModel(moviesListPresenter.moviesList[indexPath.row])
            return cell
        }
    }
    
    
}


